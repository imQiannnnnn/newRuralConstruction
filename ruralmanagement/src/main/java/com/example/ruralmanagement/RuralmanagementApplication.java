package com.example.ruralmanagement;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;


//(exclude= DataSourceAutoConfiguration.class)
@EnableTransactionManagement
@MapperScan(basePackages = {"com.example.ruralmanagement.mapper"})
@SpringBootApplication
public class RuralmanagementApplication {

    public static void main(String[] args) {
        SpringApplication.run(RuralmanagementApplication.class, args);
    }

}
