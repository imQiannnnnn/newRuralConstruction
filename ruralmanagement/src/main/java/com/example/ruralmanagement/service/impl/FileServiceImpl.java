package com.example.ruralmanagement.service.impl;

import com.example.ruralmanagement.entity.Files;
import com.example.ruralmanagement.mapper.FileMapper;
import com.example.ruralmanagement.service.IFileService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Qian
 * @since 2023-03-14
 */
@Service
public class FileServiceImpl extends ServiceImpl<FileMapper, Files> implements IFileService {

}
