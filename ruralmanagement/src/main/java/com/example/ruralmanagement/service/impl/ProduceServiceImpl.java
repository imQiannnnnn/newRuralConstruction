package com.example.ruralmanagement.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.Produce;
import com.example.ruralmanagement.mapper.ProduceMapper;
import com.example.ruralmanagement.service.IProduceService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;


/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Qian
 * @since 2023-03-13
 */
@Service
public class ProduceServiceImpl extends ServiceImpl<ProduceMapper, Produce> implements IProduceService {

    @Autowired
    ProduceMapper produceMapper;

    // 分页查询农产品信息
    @Override
    @Transactional(readOnly = true) //不参与事务
    public Page<Produce> selectByPage(Page<Produce> page, Map<String, Object> map){
        Page<Produce> ProducePage = produceMapper.queryAll(page,map);
        return ProducePage;
    }

}
