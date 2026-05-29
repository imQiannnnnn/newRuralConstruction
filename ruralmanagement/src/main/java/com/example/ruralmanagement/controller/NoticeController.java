package com.example.ruralmanagement.controller;


import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.example.ruralmanagement.common.Result;

import org.springframework.web.multipart.MultipartFile;

import com.example.ruralmanagement.service.INoticeService;
import com.example.ruralmanagement.entity.Notice;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Qian
 * @since 2023-03-13
 */
@RestController
@RequestMapping("/notice")
public class NoticeController {

    @Resource
    private INoticeService noticeService;

    // 新增或者更新
    @ApiOperation("新增或者更新")
    @PostMapping("/saveOrUpdate")
    public Result save(@RequestBody Notice notice) {
        return Result.success(noticeService.saveOrUpdate(notice));
    }

    // 删除单个
    @ApiOperation("删除单个")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        return Result.success(noticeService.removeById(id));
    }

    // 批量删除
    @ApiOperation("批量删除")
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(noticeService.removeByIds(ids));
    }

    // 查询所有
    @ApiOperation("查询所有")
    @GetMapping("/list")
    public Result findAll() {
        return Result.success(noticeService.list());
    }

    // 查询单个
    @ApiOperation("查询单个")
    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(noticeService.getById(id));
    }

    // 分页查询 - mybatis-plus的方式
    @ApiOperation("分页查询")
    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String noticeName,
                           @RequestParam(defaultValue = "") Integer userId) {
        QueryWrapper<Notice> queryWrapper = new QueryWrapper<>();
        if (!"".equals(noticeName)) {
            queryWrapper.like("notice_name", noticeName);
        }
        if (userId != null) {
            queryWrapper.like("user_id", userId);
        }
        queryWrapper.orderByDesc("notice_id");
        return Result.success(noticeService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /*
     * 导出接口
     */
    @ApiOperation("导出Excel表")
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Notice> list = noticeService.list();
        // 通过工具类创建writer 写出到磁盘路径
        //ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);
        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("公告信息", "UTF-8");
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
        List<Notice> list = reader.readAll(Notice.class);
        noticeService.saveBatch(list);
        return Result.success(true);
    }


}

