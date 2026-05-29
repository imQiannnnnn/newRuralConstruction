package com.example.ruralmanagement.controller;


import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.User;
import com.example.ruralmanagement.mapper.WishMapper;
import com.example.ruralmanagement.utils.TokenUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.time.LocalDateTime;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.example.ruralmanagement.common.Result;

import org.springframework.web.multipart.MultipartFile;

import com.example.ruralmanagement.service.IWishService;
import com.example.ruralmanagement.entity.Wish;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Qian
 * @since 2023-03-16
 */
@RestController
@RequestMapping("/wish")
public class WishController {

    @Resource
    private IWishService wishService;


    // 新增[数据库中不存在这个wishId->用户和管理员] 或者 更新[数据库中存在这个wishId->用户和管理员]
    @ApiOperation("新增或者更新")
    @PostMapping("/saveOrUpdate")
    public Result save(@RequestBody Wish wish) {
        return Result.success(wishService.saveOrUpdate(wish));
    }

    //新增
    @ApiOperation("新增")
    @PostMapping("/add")
    public Result add(@RequestBody Wish wish){
        User currentUser = TokenUtils.getCurrentUser();
        assert currentUser != null;
        wish.setUserCreateId(currentUser.getUserId());
        //获取当前时间
        LocalDateTime datetime =LocalDateTime.now();
        wish.setWishCreateTime(datetime);
        return Result.success(wishService.save(wish));
    }

    //更新
    @ApiOperation("更新")
    @PostMapping("/update")
    public Result update(@RequestBody Wish wish) {
        return Result.success(wishService.updateById(wish));
    }


    // 删除单个
    @ApiOperation("删除单个")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        return Result.success(wishService.removeById(id));
    }

    // 批量删除
    @ApiOperation("批量删除")
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(wishService.removeByIds(ids));
    }

    // 查询所有
    @ApiOperation("查询所有")
    @GetMapping("/list")
    public Result findAll() {
        return Result.success(wishService.list());
    }

    // 查询单个
    @ApiOperation("查询单个")
    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(wishService.getById(id));
    }

    // 分页查询 - mybatis-plus的方式
    @ApiOperation("分页查询")
    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String wishName) {
        QueryWrapper<Wish> queryWrapper = new QueryWrapper<>();
        if (!"".equals(wishName)) {
            queryWrapper.like("wish_name", wishName);
        }
        queryWrapper.orderByDesc("wish_id");
        return Result.success(wishService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /*
     * 导出接口
     */
    @ApiOperation("导出Excel表")
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Wish> list = wishService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);
        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("微心愿信息", "UTF-8");
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
        List<Wish> list = reader.readAll(Wish.class);
        wishService.saveBatch(list);
        return Result.success(true);
    }

    // 完成心愿
    @ApiOperation("完成心愿")
    @PostMapping("/finishWish")
    public Result finishWish(@RequestBody Wish wish) {
        // 处理完成对象
        User currentUser = TokenUtils.getCurrentUser();
        assert currentUser != null;
        wish.setUserFinishId(currentUser.getUserId());
        // 处理完成时间
        LocalDateTime finishTime = LocalDateTime.now();
        wish.setWishFinishTime(finishTime);  // 已经格式化的现在时间（24小时制）
        //处理完成状态
        wish.setWishActive(2);
        wishService.saveOrUpdate(wish);
        return Result.success(wish);
    }

    // 分页查询 xml文件 带有联表查询
    @ApiOperation("带有联表查询的分页")
    @GetMapping("/pageMore")
    public Result pageMore(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String wishName) {
        Map<String, Object> map = new HashMap<>();
        map.put("wish_name", wishName);
        Page<Wish> page = new Page<>(pageNum, pageSize);
        return Result.success(wishService.selectByPage(page, map));
    }

    // 查询 xml文件 带有联表查询
    @ApiOperation("查找自己发布的微心愿")
    @GetMapping("/listMine")
    public Result listMine() {
        Map<String, Object> map = new HashMap<>();
        // 获取当前用户信息
        User currentUser =  TokenUtils.getCurrentUser();
        assert currentUser != null;
        map.put("user_create_id", currentUser.getUserId());
        return Result.success(wishService.selectByList(map));
    }

    // 每个月的微心愿的数量和平均评分
    @ApiOperation("每个月的微心愿的数量和平均评分")
    @GetMapping("/listByMonth")
    public Result listByMonth(@RequestParam(defaultValue = "") Integer year){
        // 获取当前用户信息
        User currentUser =  TokenUtils.getCurrentUser();
        assert currentUser != null;
        return Result.success(wishService.selectByMonth(currentUser.getUserId(), year));
    }

    // 查询年份
    @ApiOperation("查询年份列表，不重复")
    @GetMapping("/getYears")
    public Result getYears(){
        return Result.success(wishService.getYear());
    }
}

