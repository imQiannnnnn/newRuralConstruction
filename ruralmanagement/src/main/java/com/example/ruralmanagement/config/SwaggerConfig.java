package com.example.ruralmanagement.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

//http://localhost:8888/swagger-ui.html#
@Configuration
@EnableSwagger2
@ComponentScan(basePackages = {"com.example"})
public class SwaggerConfig extends WebSecurityConfigurerAdapter {
    @Bean
    public Docket getRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .host("localhost:8888")
                .select()
                // 扫描自定义控制器所在的包路径
                .apis(RequestHandlerSelectors.basePackage("com.example.ruralmanagement.controller"))
                .paths(PathSelectors.any())
                // 构建swagger首页的自定义信息
                .build().apiInfo(new ApiInfoBuilder()
                        .title("新农村建设信息管理系统")
                        .description("后台模块接口")
                        .version("1.0")
                        .contact(new Contact("pm-6", "http://blog.csdn.net", "1160537386@qq.com"))
                        .license("The Apache License")
                        .licenseUrl("https://www.apache.org/")
                        .build());
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/**").permitAll()
                .anyRequest() . authenticated()
                .and().csrf().disable();
    }

}