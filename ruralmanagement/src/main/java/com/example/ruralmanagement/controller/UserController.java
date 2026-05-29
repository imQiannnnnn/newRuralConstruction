package com.example.ruralmanagement.controller;


import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.common.Constants;
import com.example.ruralmanagement.common.Result;
import com.example.ruralmanagement.entity.vo.UserVo;
import com.example.ruralmanagement.service.impl.UserServiceImpl;
import com.example.ruralmanagement.utils.TokenUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.example.ruralmanagement.service.IUserService;
import com.example.ruralmanagement.entity.User;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Qian
 * @since 2023-03-09
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;

    // 用户登录
    @ApiOperation("用户登录")
    @PostMapping("/login")
    public Result login(@RequestBody UserVo userVo) {
        String userName = userVo.getUserName();
        String userPassword = userVo.getUserPassword();
        if (StrUtil.isBlank(userName) || StrUtil.isBlank(userPassword)) {
            return Result.error(Constants.CODE_400, "参数错误");
        }
        UserVo vo = userService.login(userVo);
        return Result.success(vo);
    }

    // 用户注册
    @ApiOperation("用户注册")
    @PostMapping("/register")
    public Result register(@RequestBody UserVo userVo) {
        String userName = userVo.getUserName();
        String userPassword = userVo.getUserPassword();
        if (StrUtil.isBlank(userName) || StrUtil.isBlank(userPassword)) {
            return Result.error(Constants.CODE_400, "参数错误");
        }
        return Result.success(userService.register(userVo));
    }

    // 新增或者更新
    @ApiOperation("新增或者更新")
    @PostMapping("/saveOrUpdate")
    public Result save(@RequestBody User user) {
        return Result.success(userService.saveOrUpdate(user));
    }

    // 删除单个
    @ApiOperation("删除单个")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        return Result.success(userService.removeById(id));
    }

    // 批量删除
    @ApiOperation("批量删除")
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(userService.removeByIds(ids));
    }

    // 查询所有
    @ApiOperation("查询所有")
    @GetMapping("/list")
    public Result findAll() {
        return Result.success(userService.list());
    }

    // 查询单个
    @ApiOperation("查询单个")
    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(userService.getById(id));
    }

    // 查询单个
    @ApiOperation("查询个人信息")
    @GetMapping("/username/{username}")
    public Result findByUsername(@PathVariable String username) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_name", username);
        return Result.success(userService.getOne(queryWrapper));
    }


    // 分页查询 - mybatis-plus的方式
    @ApiOperation("分页查询")
    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String userName,
                           @RequestParam(defaultValue = "") String userEmail) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        if (!"".equals(userName)) {
            queryWrapper.like("user_name", userName);
        }
        if (!"".equals(userEmail)) {
            queryWrapper.like("user_email", userEmail);
        }
        queryWrapper.orderByDesc("user_id");

        // 获取当前用户信息
        User currentUser =  TokenUtils.getCurrentUser();
        System.out.println("======================================");
        System.out.println(currentUser);
        System.out.println("======================================");

        return Result.success(userService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /*
     * 导出接口
     * */
    @ApiOperation("导出Excel表")
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<User> list = userService.list();
        // 通过工具类创建writer 写出到磁盘路径
        //ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        //自定义标题别名
        //writer.addHeaderAlias("userId", "用户ID");
        //writer.addHeaderAlias("userName", "用户名");
        //writer.addHeaderAlias("userSex", "性别");
        //writer.addHeaderAlias("userAge", "年龄");
        //writer.addHeaderAlias("userPassword", "密码");
        //writer.addHeaderAlias("userEmail", "邮箱");
        //writer.addHeaderAlias("userPhone", "电话");
        //writer.addHeaderAlias("userCreateTime", "创建时间");
        //writer.addHeaderAlias("avatarUrl", "头像");

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("用户信息", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

    }

    /**
     * excel 导入
     *
     * @param file
     * @throws Exception
     */
    @ApiOperation("Excel表导入")
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 方式1：(推荐) 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<User> list = reader.readAll(User.class);
        userService.saveBatch(list);

        // 方式2：忽略表头的中文，直接读取表的内容
        //List<List<Object>> list = reader.read(1);
        //List<User> users = CollUtil.newArrayList();
        //for (List<Object> row : list) {
        //    User user = new User();
        //    //user.setUserId(Integer.parseInt(row.get(0).toString()));
        //    //user.setUserName(row.get(1).toString());
        //    //user.setUserSex(row.get(3).toString());
        //    //user.setUserAge(Integer.parseInt(row.get(4).toString()));
        //    //user.setUserPassword(row.get(5).toString());
        //    //user.setUserEmail(row.get(6).toString());
        //    //user.setUserPhone(row.get(7).toString());
        //    //user.setAvatarUrl(row.get(9).toString());
        //    users.add(user);
        //}
        //userService.saveBatch(users);

        return Result.success(true);
    }


    //计算男女个数及总数
    @ApiOperation("计算男女个数及总数")
    @GetMapping("/getSexCount")
    public Result getSexCount(){
        return Result.success(userService.getSexCount());
    }


    //计算各年龄段
    @ApiOperation("计算各年龄段")
    @GetMapping("/getAgeCount")
    public Result getAgeCount(){
        System.out.println("controller =============>" + userService.getAgeCount());
        return Result.success(userService.getAgeCount());
    }


}

