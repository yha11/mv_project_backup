package com.runtime.sendbug.model;

import org.springframework.http.HttpStatus;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ErrorModel {

    private int code = HttpStatus.BAD_REQUEST.value();
    private Object error;
}
