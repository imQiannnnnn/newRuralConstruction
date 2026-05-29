package com.example.ruralmanagement.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.entity.Produce;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.formula.functions.T;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Qian
 * @since 2023-03-13
 */

@Mapper
public interface ProduceMapper extends BaseMapper<Produce> {

    // 查询农产品（两表关联查询 分页）
    Page<Produce> queryAll(Page<Produce> page, @Param("map") Map map);

}
