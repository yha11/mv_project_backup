package com.ezen.sb.model;

import org.springframework.http.HttpStatus;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ErrorModel {

    private int code = HttpStatus.BAD_REQUEST.value();
    private Object error;
    
    
    
}
