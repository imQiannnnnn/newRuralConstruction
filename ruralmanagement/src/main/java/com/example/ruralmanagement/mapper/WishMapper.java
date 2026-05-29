package com.example.ruralmanagement.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.Wish;
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
 * @since 2023-03-16
 */

@Mapper
public interface WishMapper extends BaseMapper<Wish> {

    // 查询心愿（两表关联查询 分页）
    Page<Wish> queryAll(Page<Wish> page, @Param("map") Map map);

    // 查询心愿（两表关联查询）
    List<Wish> queryList(@Param("map") Map map);

    // 每个月的微心愿的数量 和平均评分
    List<Map> queryByMouth(@Param("map") Map map);

    // 查询年份集合
    List getYearList();
}
