package com.example.ruralmanagement.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.Purchase;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Qian
 * @since 2023-04-09
 */
public interface IPurchaseService extends IService<Purchase> {

    // 分页查询
    Page<Purchase> selectByPage(Page<Purchase> page, Map<String, Object> map);

    //计算总价
    //Float totalPrice(float num, float price);

    // 判断查询是否已加入购物车【produceId + userId 两键一起在表中已存在不用再加入购物车】
    Boolean selectIfGet(Map<String, Object> map);


}
