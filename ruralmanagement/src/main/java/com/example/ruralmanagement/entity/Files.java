package com.example.ruralmanagement.entity;

import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>
 *
 * </p>
 *
 * @author Qian
 * @since 2023-03-14
 */
@Data
@TableName("tb_file")
@ApiModel(value = "File对象", description = "")
public class Files implements Serializable {

    private static final long serialVersionUID = 1L;

    @Alias("文件id")
    @ApiModelProperty("文件id")
    private Integer fileId;

    @Alias("名称")
    @ApiModelProperty("名称")
    private String fileName;

    @Alias("类型")
    @ApiModelProperty("类型")
    private String fileType;

    @Alias("大小")
    @ApiModelProperty("大小")
    private Long fileSize;

    @Alias("下载链接")
    @ApiModelProperty("下载链接")
    private String fileUrl;

    @Alias("文件md5")
    @ApiModelProperty("文件md5")
    private String fileMd5;

    @Alias("是否删除")
    @ApiModelProperty("是否删除[0未删除 1已删除]")
    private Boolean fileIsDelete;

    @Alias("是否禁用")
    @ApiModelProperty("是否禁用[0未禁用 1已禁用]")
    private Boolean fileEnable;


}
