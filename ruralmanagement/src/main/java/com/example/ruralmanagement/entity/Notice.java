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
@TableName("tb_notice")
@ApiModel(value = "Notice对象", description = "")
public class Notice implements Serializable {

    private static final long serialVersionUID = 1L;

    @Alias("id")
    @ApiModelProperty("id")
    @TableId(value = "notice_id", type = IdType.AUTO)
    private Integer noticeId;

    @Alias("名称")
    @ApiModelProperty("名称")
    private String noticeName;

    @Alias("描述")
    @ApiModelProperty("描述")
    private String noticeDescribe;

    @Alias("发布时间")
    @ApiModelProperty("发布时间")
    private LocalDateTime noticeCreateTime;

    @Alias("创建者id")
    @ApiModelProperty("创建者id")
    private Integer userId;

    @Alias("创建者")
    @ApiModelProperty("创建者")
    private String userName;


}
