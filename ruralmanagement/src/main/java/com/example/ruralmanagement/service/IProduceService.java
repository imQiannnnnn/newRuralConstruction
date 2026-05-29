package com.example.ruralmanagement.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.Produce;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;


/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Qian
 * @since 2023-03-13
 */
public interface IProduceService extends IService<Produce> {

    // 分页查询农产品
    Page<Produce> selectByPage(Page<Produce> page, Map<String, Object> map);

}
