package com.example.ruralmanagement.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.Comment;
import com.example.ruralmanagement.mapper.CommentMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.ruralmanagement.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Qian
 * @since 2023-04-13
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {

    @Autowired
    CommentMapper commentMapper;

    // 找到对应文章下的评论
    @Override
    public List<Comment> findAllByArticle(Integer articleId) {
        Map<String, Object> map = new HashMap<>();
        map.put("comment_article_id", articleId);
        return commentMapper.queryAll(map);
    }

    // 分页查询信息
    @Transactional(readOnly = true) //不参与事务
    public Page<Comment> selectByPage(Page<Comment> page, Map<String, Object> map) {
        return commentMapper.queryByPage(page, map);
    }

}
