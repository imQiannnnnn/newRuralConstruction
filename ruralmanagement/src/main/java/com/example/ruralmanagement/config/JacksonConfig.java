package com.example.ruralmanagement.config;


import java.time.ZoneId;
import java.util.Locale;
import java.util.TimeZone;

import com.example.ruralmanagement.utils.JacksonLocalDateTimeModule;
import com.fasterxml.jackson.annotation.JsonInclude;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.boot.autoconfigure.jackson.JacksonAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author Qian
 * @version 2020.3.2
 * @date 2023/3/20 18:07
 */

@Configuration
@ConditionalOnClass(ObjectMapper.class)
@AutoConfigureBefore(JacksonAutoConfiguration.class)
public class JacksonConfig {

    @Bean
    public Jackson2ObjectMapperBuilderCustomizer customizer() {

        return builder -> {
            builder.locale(Locale.CHINA);
            builder.timeZone(TimeZone.getTimeZone(ZoneId.systemDefault()));
            //转换时间格式
            builder.simpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //转换定义的工具类
            builder.modules(new JacksonLocalDateTimeModule());
            //为null的数据不返回给前端
            builder.serializationInclusion(JsonInclude.Include.NON_NULL);
        };
    }
}