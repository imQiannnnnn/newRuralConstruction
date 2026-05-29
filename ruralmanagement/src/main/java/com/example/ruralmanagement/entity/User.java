package com.example.ruralmanagement.entity;

import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.time.LocalDateTime;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>
 *
 * </p>
 *
 * @author Qian
 * @since 2023-03-13
 */
@Data
@TableName("tb_user")
@ApiModel(value = "User对象", description = "")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Alias("用户ID")
    @ApiModelProperty("id")
    @TableId(value = "user_id", type = IdType.AUTO)
    private Integer userId;

    @Alias("用户名")
    @ApiModelProperty("用户名")
    private String userName;

    @Alias("性别")
    @ApiModelProperty(value = "性别")
    private String userSex;

    @Alias("年龄")
    @ApiModelProperty("年龄")
    private Integer userAge;

    @Alias("电话")
    @ApiModelProperty("电话")
    private String userPhone;

    @Alias("邮箱")
    @ApiModelProperty("邮箱")
    private String userEmail;

    @Alias("密码")
    @ApiModelProperty("密码")
    private String userPassword;

    @Alias("创建时间")
    @ApiModelProperty("创建时间")
    private LocalDateTime userCreateTime;

    @Alias("角色（群众，中共党员，中共预备党员）")
    @ApiModelProperty("角色")
    private String userRole;

    @Alias("头像")
    @ApiModelProperty("头像")
    private String userAvatarUrl;

    @Alias("身份(超级管理员)")
    @ApiModelProperty("身份")
    private String userPower;

}
