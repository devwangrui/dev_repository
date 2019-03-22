package com.example.zhengai;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@MapperScan("com.example.zhengai.dao")
@SpringBootApplication
public class ZhengaiApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZhengaiApplication.class, args);
    }




}

