package com.example.ruralmanagement.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.common.Constants;
import com.example.ruralmanagement.common.Result;
import com.example.ruralmanagement.entity.Files;
import com.example.ruralmanagement.entity.User;
import com.example.ruralmanagement.mapper.FileMapper;
import com.example.ruralmanagement.service.IFileService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/**
 * <p>文件上传相关接口</p>
 *
 * @author Qian
 * @version 2020.3.2
 * @date 2023/3/14 10:03
 */
@RestController
@RequestMapping("/file")
public class FileController {

    @Value("${files.upload.path}")
    private String fileUploadPath;

    @Resource
    private FileMapper fileMapper;

    @Resource
    private IFileService fileService;

    /**
     * 文件上传接口
     * @param file 前端传递过来的文件
     * @return
     * @throws IOException
     */
    @ApiOperation("文件上传")
    @PostMapping("/upload")
    public String upload(@RequestParam MultipartFile file) throws IOException {
        String originalFilename = file.getOriginalFilename();
        String type = FileUtil.extName(originalFilename);
        long size = file.getSize();

        // 定义一个文件唯一的标识码
        String uuid = IdUtil.fastSimpleUUID();
        String fileUUID = uuid + StrUtil.DOT + type;

        File uploadFile = new File(fileUploadPath + fileUUID);
        // 判断配置的文件目录是否存在，若不存在则创建一个新的文件目录
        File parentFile = uploadFile.getParentFile();
        if(!parentFile.exists()) {
            parentFile.mkdirs();
        }

        String url;
        // 获取文件的md5
        String md5 = SecureUtil.md5(file.getInputStream());
        // 从数据库查询是否存在相同的记录
        Files dbFiles = getFileByMd5(md5);
        if (dbFiles != null) { // 文件已存在
            url = dbFiles.getFileUrl();
        } else {
            // 上传文件到磁盘
            file.transferTo(uploadFile);
            // 数据库若不存在重复文件，则不删除刚才上传的文件
            url = "http://localhost:8888/file/" + fileUUID;
        }

        // 存储数据库
        Files saveFile = new Files();
        saveFile.setFileName(originalFilename);
        saveFile.setFileType(type);
        saveFile.setFileSize(size/1024);
        saveFile.setFileUrl(url);
        saveFile.setFileMd5(md5);
        fileMapper.insert(saveFile);

        return url;
    }

    /**
     * 文件下载接口   http://localhost:8888/file/{fileUUID}
     * @param fileUUID
     * @param response
     * @throws IOException
     */
    @ApiOperation("文件下载")
    @GetMapping("/{fileUUID}")
    public void download(@PathVariable String fileUUID, HttpServletResponse response) throws IOException {
        // 根据文件的唯一标识码获取文件
        File uploadFile = new File(fileUploadPath + fileUUID);
        // 设置输出流的格式
        ServletOutputStream os = response.getOutputStream();
        response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileUUID, "UTF-8"));
        response.setContentType("application/octet-stream");

        // 读取文件的字节流
        os.write(FileUtil.readBytes(uploadFile));
        os.flush();
        os.close();
    }

    /**
     * 通过文件的md5查询文件
     * @param md5
     * @return
     */
    @ApiOperation("查询文件的md5是否存在")
    private Files getFileByMd5(String md5) {
        // 查询文件的md5是否存在
        QueryWrapper<Files> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("file_md5", md5);
        List<Files> filesList = fileMapper.selectList(queryWrapper);
        return filesList.size() == 0 ? null : filesList.get(0);
    }

    @ApiOperation("更新")
    @PostMapping("/update")
    public Result update(@RequestBody Files files) {
        return Result.success(fileMapper.updateById(files));
    }

    @ApiOperation("删除单个")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        Files files = fileMapper.selectById(id);
        files.setFileIsDelete(true);
        fileMapper.updateById(files);
        return Result.success();
    }

    @ApiOperation("批量删除")
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        // select * from sys_file where id in (id,id,id...)
        QueryWrapper<Files> queryWrapper = new QueryWrapper<>();
        queryWrapper.in("file_id", ids);
        List<Files> files = fileMapper.selectList(queryWrapper);
        for (Files file : files) {
            file.setFileIsDelete(true);
            fileMapper.updateById(file);
        }
        //fileService.removeByIds(ids)
        return Result.success();
    }

    /**
     * 分页查询接口
     * @param pageNum
     * @param pageSize
     * @param name
     * @return
     */
    @ApiOperation("分页查询")
    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String name) {

        QueryWrapper<Files> queryWrapper = new QueryWrapper<>();
        // 查询未删除的记录
        queryWrapper.eq("file_is_delete", false);
        queryWrapper.orderByDesc("file_id");
        if (!"".equals(name)) {
            queryWrapper.like("file_name", name);
        }
        return Result.success(fileMapper.selectPage(new Page<>(pageNum, pageSize), queryWrapper));
    }


}
