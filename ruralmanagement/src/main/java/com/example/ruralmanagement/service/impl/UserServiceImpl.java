package com.example.ruralmanagement.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.log.Log;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.ruralmanagement.common.Constants;
import com.example.ruralmanagement.entity.vo.UserVo;
import com.example.ruralmanagement.entity.User;
import com.example.ruralmanagement.exception.ServiceException;
import com.example.ruralmanagement.mapper.UserMapper;
import com.example.ruralmanagement.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.ruralmanagement.utils.TokenUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Qian
 * @since 2023-03-09
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    UserMapper userMapper;

    private static final Log LOG = Log.get();

    @Override
    public UserVo login(UserVo userVo) {
        User one = getUserInfo(userVo);
        if (one != null) {
            BeanUtil.copyProperties(one, userVo, true);
            // 设置token
            String token = TokenUtils.genToken(one.getUserId().toString(), one.getUserPassword());
            userVo.setToken(token);
            userVo.setUserAvatarUrl(one.getUserAvatarUrl());
            userVo.setUserId(one.getUserId());
            userVo.setUserRole(one.getUserRole());
            userVo.setUserPower(one.getUserPower());
            return userVo;
        } else {
            throw new ServiceException(Constants.CODE_600, "用户名或密码错误");
        }
    }

    @Override
    public User register(UserVo userVo) {
        User one = getUserInfo(userVo);
        if (one == null) {
            one = new User();
            //BeanUtil.copyProperties(userVo, one, true);
            //BeanUtil.copyProperties(userVo, one, true, CopyOptions.create().setIgnoreNullValue(true).setIgnoreError(true));
            BeanUtils.copyProperties(userVo, one, getNullPropertyNames(userVo));
            save(one);  // 把 copy完之后的用户对象存储到数据库
        } else {
            throw new ServiceException(Constants.CODE_600, "用户已存在");
        }
        return one;
    }

    private User getUserInfo(UserVo userVo) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_name", userVo.getUserName());
        queryWrapper.eq("user_password", userVo.getUserPassword());
        User one;
        try {
            one = getOne(queryWrapper); // 从数据库查询用户信息
        } catch (Exception e) {
            LOG.error(e);
            throw new ServiceException(Constants.CODE_500, "系统错误");
        }
        return one;
    }

    public static String[] getNullPropertyNames(Object source) {
        final BeanWrapper src = new BeanWrapperImpl(source);
        java.beans.PropertyDescriptor[] pds = src.getPropertyDescriptors();

        Set<String> emptyNames = new HashSet<String>();
        for (java.beans.PropertyDescriptor pd : pds) {
            Object srcValue = src.getPropertyValue(pd.getName());
            if (srcValue == null) emptyNames.add(pd.getName());
        }
        String[] result = new String[emptyNames.size()];
        return emptyNames.toArray(result);
    }

    //public static void copyPropertiesIgnoreNull( Object src, Object target){
    //    BeanUtils.copyProperties(src, target, getNullPropertyNames(src));
    //}

    //计算男女个数和总人数
    @Override
    public Map<String, Object> getSexCount() {
        return userMapper.countSex();
    }

    //计算个年龄段的人数
    @Override
    public List getAgeCount() {
        //System.out.println("===========================================================================");
        //System.out.println("====>" + userMapper.countAge());
        return userMapper.countAge();
    }

}
