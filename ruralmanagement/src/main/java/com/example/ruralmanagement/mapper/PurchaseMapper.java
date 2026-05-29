package com.example.ruralmanagement.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.Purchase;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Qian
 * @since 2023-04-09
 */

@Mapper
public interface PurchaseMapper extends BaseMapper<Purchase> {

    // 查询农产品（两表关联查询 分页）
    Page<Purchase> queryAllPage(Page<Purchase> page, @Param("map") Map map);

    // 判断查询是否已加入购物车【produceId + userId 两键一起在表中已存在不用再加入购物车】
    Boolean ifGetPurchase(@Param("map") Map map);


}
