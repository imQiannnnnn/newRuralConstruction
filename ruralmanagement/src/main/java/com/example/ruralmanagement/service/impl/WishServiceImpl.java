package com.example.ruralmanagement.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.Wish;
import com.example.ruralmanagement.mapper.WishMapper;
import com.example.ruralmanagement.service.IWishService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Qian
 * @since 2023-03-16
 */
@Service
public class WishServiceImpl extends ServiceImpl<WishMapper, Wish> implements IWishService {

    @Autowired
    WishMapper wishMapper;


    // 分页查询心愿信息
    @Override
    @Transactional(readOnly = true) //不参与事务
    public Page<Wish> selectByPage(Page<Wish> page, Map<String, Object> map) {
        return wishMapper.queryAll(page, map);
    }

    //查询自己的心愿信息
    @Override
    @Transactional(readOnly = true) //不参与事务
    public List<Wish> selectByList(Map<String, Object> map){
        return wishMapper.queryList(map);
    }

    // 计算每个月的微心愿的数量和平均评分
    @Override
    @Transactional(readOnly = true) //不参与事务
    public Map selectByMonth(Integer finishUserId, Integer year) {
        Map<String, Object> map = new HashMap<>();
        map.put("user_finish_id", finishUserId);
        //获取年份信息
        map.put("year", year);
        Map<String, Object> MonthMap = new HashMap<>();
        List months = new ArrayList();
        List scoreAvg = new ArrayList();
        List count = new ArrayList();
        for (Object o: wishMapper.queryByMouth(map)){
            //循环 将不同类型的数据放入对应的数组
            Map mapO = (Map) o;
            months.add(mapO.get("months") + "月");
            scoreAvg.add(mapO.get("avg"));
            count.add(mapO.get("num"));
        }
        MonthMap.put("months",months);
        MonthMap.put("scoreAvg",scoreAvg);
        MonthMap.put("count", count);
        return MonthMap;
    }

    @Override
    @Transactional(readOnly = true) //不参与事务
    public List getYear() {
        return wishMapper.getYearList();
    }

}
