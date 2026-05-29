package com.example.ruralmanagement.service;

import com.example.ruralmanagement.entity.vo.UserVo;
import com.example.ruralmanagement.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Qian
 * @since 2023-03-09
 */
public interface IUserService extends IService<User> {

    //登录
    UserVo login(UserVo userVo);

    //注册
    User register(UserVo userVo);

    //计算男女个数（比例）
    Map<String, Object> getSexCount();

    //计算各年龄段
    List getAgeCount();

}

