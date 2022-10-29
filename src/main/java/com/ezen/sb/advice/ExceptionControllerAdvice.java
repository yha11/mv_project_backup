package com.ezen.sb.advice;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.sb.exception.AuthException;
import com.ezen.sb.model.ErrorModel;

@ControllerAdvice
public class ExceptionControllerAdvice {
	
    @ExceptionHandler(AuthException.class)
    @ResponseBody
    public ResponseEntity<ErrorModel> handleAuthenticationException(AuthException ex){
    	ErrorModel errorResponse = new ErrorModel(ex.getErrCode().getCode(), ex.getErrCode().getMessage());
        return new ResponseEntity<>(errorResponse, ex.getErrCode().getStatus());
    }
}
