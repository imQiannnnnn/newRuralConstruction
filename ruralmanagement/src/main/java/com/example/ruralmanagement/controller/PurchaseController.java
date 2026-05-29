package com.example.ruralmanagement.controller;


import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.mapper.PurchaseMapper;
import com.example.ruralmanagement.service.IProduceService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.example.ruralmanagement.common.Result;

import org.springframework.web.multipart.MultipartFile;

import com.example.ruralmanagement.service.IPurchaseService;
import com.example.ruralmanagement.entity.Purchase;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Qian
 * @since 2023-04-09
 */
@RestController
@RequestMapping("/purchase")
public class PurchaseController {

    @Resource
    private IPurchaseService purchaseService;

    @Resource
    private IProduceService produceService;


    // 新增或者更新
    @ApiOperation("新增或者更新")
    @PostMapping("/saveOrUpdate")
    public Result save(@RequestBody Purchase purchase) {
        // 单价 从produceId查询到对应的Produce
        Float price = produceService.getById(purchase.getPurchaseProduceId()).getProducePrice().floatValue();
        //总价 = 数量 * 单价
        Float totalPrice = purchase.getPurchaseNum() * price;
        purchase.setPurchaseTotalPrice(totalPrice);

        //获取当前时间
        LocalDateTime datetime =LocalDateTime.now();
        purchase.setPurchaseTime(datetime);

        return Result.success(purchaseService.saveOrUpdate(purchase));
    }

    // 删除单个
    @ApiOperation("删除单个")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        return Result.success(purchaseService.removeById(id));
    }

    // 批量删除
    @ApiOperation("批量删除")
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(purchaseService.removeByIds(ids));
    }

    // 查询所有
    @ApiOperation("查询所有")
    @GetMapping("/list")
    public Result findAll() {
        return Result.success(purchaseService.list());
    }

    // 查询单个
    @ApiOperation("查询单个")
    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(purchaseService.getById(id));
    }

    // 分页查询 - mybatis-plus的方式
    @ApiOperation("分页查询")
    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Purchase> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("purchase_id");
        return Result.success(purchaseService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /*
     * 导出接口
     */
    @ApiOperation("导出Excel表")
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Purchase> list = purchaseService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);
        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("订单[购物车]信息", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");
        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

    }

    /*
     * excel 导入
     * @param file
     * @throws Exception
     */
    @ApiOperation("Excel表导入")
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 方式1：(推荐) 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<Purchase> list = reader.readAll(Purchase.class);
        purchaseService.saveBatch(list);
        return Result.success(true);
    }

    // 分页查询 xml文件 带有联表查询
    @ApiOperation("带有联表查询的分页")
    @GetMapping("/pageMore")
    public Result pageMore(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") Integer purchaseId,
                           @RequestParam(defaultValue = "") Integer purchaseActive,
                           @RequestParam(defaultValue = "") Integer purchaseDelivery,
                           @RequestParam(defaultValue = "") Integer purchaseReceipt,
                           @RequestParam(defaultValue = "") Integer purchaseBuyerId) {
        Map<String, Object> map = new HashMap<>();
        map.put("purchase_id", purchaseId);
        map.put("purchase_active", purchaseActive);
        map.put("purchase_delivery", purchaseDelivery);
        map.put("purchase_receipt", purchaseReceipt);
        map.put("purchase_buyer_id", purchaseBuyerId);
        //map.put("produce_name", produceName);

        Page<Purchase> page = new Page<>(pageNum, pageSize);
        return Result.success(purchaseService.selectByPage(page, map));
    }

    // 判断查询是否已加入购物车【produceId + userId 两键一起在表中已存在不用再加入购物车】
    @ApiOperation("查询是否加入购物车")
    @PostMapping("/ifGetPurchase")
    public Result ifGetPurchase(@RequestBody Purchase purchase) {
        Map<String, Object> map = new HashMap<>();
        map.put("purchase_buyer_id", purchase.getPurchaseBuyerId());
        map.put("purchase_produce_id", purchase.getPurchaseProduceId());
        return Result.success(purchaseService.selectIfGet(map));
    }

    // 下单单个【 将未下单改为已下单 即将Purchase的active：0 => 1 】
    @ApiOperation("下单【单个】")
    @PostMapping("/order/{id}")
    public Result order(@PathVariable Integer id) {
        Purchase purchase = purchaseService.getById(id);
        purchase.setPurchaseActive(1);
        purchaseService.updateById(purchase);
        return Result.success("下单单个成功");
    }

    // 批量下单
    @ApiOperation("下单【多个】")
    @PostMapping("/order/batch")
    public Result orderBatch(@RequestBody List<Integer> ids) {
        for (Integer id : ids) {
            Purchase purchase = purchaseService.getById(id);
            purchase.setPurchaseActive(1);
            purchaseService.updateById(purchase);
        }
        return Result.success("下单多个成功");
    }

    // 配送商品
    @ApiOperation("配送【单个】")
    @PostMapping("/delivery/{id}")
    public Result delivery(@PathVariable Integer id) {
        Purchase purchase = purchaseService.getById(id);
        purchase.setPurchaseDelivery(1);
        purchaseService.updateById(purchase);
        return Result.success("配送单个成功");
    }

    // 确认收货
    @ApiOperation("确认收货【单个】")
    @PostMapping("/receipt/{id}")
    public Result receipt(@PathVariable Integer id) {
        Purchase purchase = purchaseService.getById(id);
        purchase.setPurchaseReceipt(1);
        purchaseService.updateById(purchase);
        return Result.success("确认收货单个成功");
    }

}

