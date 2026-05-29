package com.example.ruralmanagement.exception;

/**
 * @author Qian
 * @version 2020.3.2
 * @date 2023/3/11 21:02
 */

import lombok.Getter;

// 自定义异常

@Getter
public class ServiceException extends RuntimeException {
    private String code;

    public ServiceException(String code, String msg) {
        super(msg);
        this.code = code;
    }

}

