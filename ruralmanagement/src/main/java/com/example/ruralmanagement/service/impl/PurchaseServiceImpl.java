package com.example.ruralmanagement.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.Purchase;
import com.example.ruralmanagement.mapper.ProduceMapper;
import com.example.ruralmanagement.mapper.PurchaseMapper;
import com.example.ruralmanagement.service.IPurchaseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Qian
 * @since 2023-04-09
 */
@Service
public class PurchaseServiceImpl extends ServiceImpl<PurchaseMapper, Purchase> implements IPurchaseService {

    @Autowired
    PurchaseMapper purchaseMapper;

    // 分页查询信息
    @Override
    @Transactional(readOnly = true) //不参与事务
    public Page<Purchase> selectByPage(Page<Purchase> page, Map<String, Object> map) {
        return purchaseMapper.queryAllPage(page, map);
    }

    //计算总价
    //public Float totalPrice(float num, float price) {
    //    return num * price;
    //}

    // 判断查询是否已加入购物车【produceId + userId 两键一起在表中已存在不用再加入购物车】
    @Override
    @Transactional(readOnly = true) //不参与事务
    public Boolean selectIfGet(Map<String, Object> map) {
        return purchaseMapper.ifGetPurchase(map);
    }


}
