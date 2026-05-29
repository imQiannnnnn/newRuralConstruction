package com.example.ruralmanagement;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ruralmanagement.common.Result;
import com.example.ruralmanagement.entity.Produce;
import com.example.ruralmanagement.mapper.ProduceMapper;
import com.example.ruralmanagement.service.IProduceService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest
class RuralmanagementApplicationTests {


    @Test
    void contextLoads() {

    }


    @Autowired
    ProduceMapper produceMapper;

    @Autowired
    IProduceService produceService;

    @Test
    void producePage() {
        System.out.println("==============hello world===============");
        Map<String, Object> map = new HashMap<>();
        map.put("produce_name", "土豆");
        Page<Produce> page = new Page<>(1, 4);
        System.out.println("================================带有联表查询的分页================================");
        produceService.selectByPage(page, map);
    }

}
