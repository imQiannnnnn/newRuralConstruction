package com.example.ruralmanagement.entity;

import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.math.BigDecimal;

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
@TableName("tb_scene")
@ApiModel(value = "Scene对象", description = "")
public class Scene implements Serializable {

    private static final long serialVersionUID = 1L;

    @Alias("景色id")
    @ApiModelProperty("景色id")
    @TableId(value = "scene_id", type = IdType.AUTO)
    private Integer sceneId;

    @Alias("名称")
    @ApiModelProperty("名称")
    private String sceneName;

    @Alias("描述")
    @ApiModelProperty("描述")
    private String sceneDescribe;

    @Alias("地点")
    @ApiModelProperty("地点")
    private String sceneAddress;

    @Alias("价格")
    @ApiModelProperty("价格")
    private BigDecimal scenePrice;

    @Alias("图片")
    @ApiModelProperty("图片")
    private String sceneImage;

    @Alias("优待政策")
    @ApiModelProperty("优待政策")
    private String scenePolicies;

    @Alias("服务设施")
    @ApiModelProperty("服务设施")
    private String sceneServiceFacility;


}
