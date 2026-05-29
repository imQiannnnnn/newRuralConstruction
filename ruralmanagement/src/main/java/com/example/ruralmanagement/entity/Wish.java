package com.example.ruralmanagement.entity;

import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
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
 * @since 2023-03-16
 */
@Data
@TableName("tb_wish")
@ApiModel(value = "Wish对象", description = "")
public class Wish implements Serializable {

    private static final long serialVersionUID = 1L;

    @Alias("心愿id")
    @ApiModelProperty("心愿id")
    @TableId(value = "wish_id", type = IdType.AUTO)
    private Integer wishId;

    @Alias("名称")
    @ApiModelProperty("名称")
    private String wishName;

    @Alias("描述")
    @ApiModelProperty("描述")
    private String wishDescribe;

    @Alias("创建时间")
    @ApiModelProperty("创建时间")
    private LocalDateTime wishCreateTime;

    @Alias("结束时间")
    @ApiModelProperty("结束时间")
    private LocalDateTime wishFinishTime;

    @Alias("发布者id")
    @ApiModelProperty("发布者id")
    private Integer userCreateId;

    @Alias("完成者id")
    @ApiModelProperty("完成者id")
    private Integer userFinishId;

    @Alias("反馈")
    @ApiModelProperty("反馈")
    private String wishFeedback;

    @Alias("评分【百分制】")
    @ApiModelProperty("评分【百分制】")
    private Integer wishScore;

    @Alias("状态【创建-完成-评价】")
    @ApiModelProperty("状态【创建-完成-评价】")
    private Integer wishActive;

    @TableField(exist = false)
    @ApiModelProperty("发布者")
    private User userCreate;

    @TableField(exist = false)
    @ApiModelProperty("完成者")
    private User userFinish;

}
