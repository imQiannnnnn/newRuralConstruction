package com.example.ruralmanagement.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.Wish;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Qian
 * @since 2023-03-16
 */
public interface IWishService extends IService<Wish> {

    // 分页查询
    Page<Wish> selectByPage(Page<Wish> page, Map<String, Object> map);

    //列表查询
    List<Wish> selectByList(Map<String, Object> map);

    // 每个月的微心愿的数量 和平均评分
    Map selectByMonth(Integer finishUserId, Integer year);

    // 查询年份集合
    List getYear();

}
