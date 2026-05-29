package com.example.ruralmanagement.mapper;

import com.example.ruralmanagement.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.ruralmanagement.service.IUserService;
import org.apache.ibatis.annotations.Mapper;

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
public interface UserMapper extends BaseMapper<User> {

    //计算男女比例
    Map<String, Object> countSex();


    //计算年龄段
    List countAge();

}
