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
 * @since 2023-04-09
 */
@Data
@TableName("tb_purchase")
@ApiModel(value = "Purchase对象", description = "")
public class Purchase implements Serializable {

    private static final long serialVersionUID = 1L;

    @Alias("订单编号")
    @ApiModelProperty("订单编号")
    @TableId(value = "purchase_id", type = IdType.AUTO)
    private Integer purchaseId;

    @Alias("买方Id")
    @ApiModelProperty("买方Id")
    private Integer purchaseBuyerId;

    @Alias("商品Id")
    @ApiModelProperty("商品Id")
    private Integer purchaseProduceId;

    @Alias("数量")
    @ApiModelProperty("数量")
    private Float purchaseNum;

    @Alias("总价")
    @ApiModelProperty("总价")
    private Float purchaseTotalPrice;

    @Alias("地址")
    @ApiModelProperty("地址")
    private String purchaseAddress;

    @Alias("备注")
    @ApiModelProperty("备注")
    private String purchaseRemark;

    @Alias("是否下单【0未下单  1已下单】")
    @ApiModelProperty("是否下单【0未下单  1已下单】")
    private Integer purchaseActive;

    @Alias("下单时间")
    @ApiModelProperty("下单时间")
    private LocalDateTime purchaseTime;

    @Alias("是否配送【0未配送  1已配送】")
    @ApiModelProperty("是否配送【0未配送  1已配送】")
    private Integer purchaseDelivery;

    @Alias("是否确认收货【0未收货  1已收货】")
    @ApiModelProperty("是否确认收货【0未收货  1已收货】")
    private Integer purchaseReceipt;

    @TableField(exist = false)
    @ApiModelProperty("买方")
    private User user;

    @TableField(exist = false)
    @Alias("商品")
    @ApiModelProperty("商品")
    private Produce produce;

}
