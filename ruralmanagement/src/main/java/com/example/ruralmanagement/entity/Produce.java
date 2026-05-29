package com.example.ruralmanagement.entity;

import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.math.BigDecimal;
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
@TableName("tb_produce")
@ApiModel(value = "Produce对象", description = "")
public class Produce implements Serializable {

    private static final long serialVersionUID = 1L;

    @Alias("农产品id")
    @ApiModelProperty("农产品id")
    @TableId(value = "produce_id", type = IdType.AUTO)
    private Integer produceId;

    @Alias("名称")
    @ApiModelProperty("名称")
    private String produceName;

    @Alias("描述")
    @ApiModelProperty("描述")
    private String produceDescribe;

    @Alias("价格")
    @ApiModelProperty("价格")
    private BigDecimal producePrice;

    @Alias("图片")
    @ApiModelProperty("图片")
    private String produceImage;

    @Alias("创建时间")
    @ApiModelProperty("创建时间")
    private LocalDateTime produceCreateTime;

    @Alias("发布者id")
    @ApiModelProperty("发布者id")
    private Integer userId;

    @TableField(exist = false)
    @ApiModelProperty("发布者")
    private User user;

}
