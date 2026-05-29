package com.example.ruralmanagement.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.Comment;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Qian
 * @since 2023-04-13
 */
public interface ICommentService extends IService<Comment> {

    // 找到对应文章下的评论
    List<Comment> findAllByArticle(Integer articleId);

    Page<Comment> selectByPage(Page<Comment> page, Map<String, Object> map);
}
