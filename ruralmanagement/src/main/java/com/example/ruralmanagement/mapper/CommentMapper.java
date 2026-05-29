package com.example.ruralmanagement.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.Comment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Qian
 * @since 2023-04-13
 */
@Mapper
public interface CommentMapper extends BaseMapper<Comment> {

    // 联表查询
    List<Comment> queryAll(@Param("map") Map map);

    //分页查询
    Page<Comment> queryByPage(Page<Comment> page, @Param("map") Map map);
}
