package com.example.ruralmanagement.entity;

import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.beans.Transient;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *
 * </p>
 *
 * @author Qian
 * @since 2023-04-13
 */
@Data
@TableName("tb_comment")
@ApiModel(value = "Comment对象", description = "")
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

    @Alias("评论id")
    @ApiModelProperty("评论id")
    @TableId(value = "comment_id", type = IdType.AUTO)
    private Integer commentId;

    @Alias("文章id")
    @ApiModelProperty("文章id")
    private Integer commentArticleId;

    //@Alias("评分")
    //@ApiModelProperty("评分")
    //private BigDecimal commentRate;

    @Alias("父级评论id")
    @ApiModelProperty("父级评论id")
    private Integer commentParentId;


    @Alias("评论内容")
    @ApiModelProperty("评论内容")
    private String commentContent;

    @Alias("评论用户id")
    @ApiModelProperty("评论用户id")
    private Integer commentFromUid;

    @Alias("回复用户id")
    @ApiModelProperty("回复用户id")
    private Integer commentToUid;


    @Alias("评论时间")
    @ApiModelProperty("评论时间")
    private LocalDateTime commentCreateTime;

    //@Transient
    @ApiModelProperty("子评论")
    @TableField(exist = false)
    private List<Comment> children;

    @TableField(exist = false)
    @ApiModelProperty("评论用户")
    private User commentFromUser;

    @TableField(exist = false)
    @ApiModelProperty("回复用户")
    private User commentToUser;

    @TableField(exist = false)
    @ApiModelProperty("文章-旅游风景")
    private Scene scene;

}
