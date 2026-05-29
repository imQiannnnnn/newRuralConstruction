package com.example.ruralmanagement.entity.vo;

import lombok.Data;

/**
 * @author Qian
 * @version 2020.3.2
 * @date 2023/3/11 17:38
 */

/*
* 接受前端登录请求的参数
*/
@Data
public class UserVo  {

    private Integer userId;

    private String userName;

    private String userPassword;

    private String userAvatarUrl;

    private String userRole;

    private String userPower;

    private String token;
}
