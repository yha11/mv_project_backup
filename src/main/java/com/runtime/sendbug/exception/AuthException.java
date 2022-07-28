package com.runtime.sendbug.exception;

import org.springframework.security.core.AuthenticationException;

import com.runtime.sendbug.code.ErrorCode;

import lombok.Getter;

@Getter
public class AuthException extends AuthenticationException{
	private static final long serialVersionUID = 1L;


    private final ErrorCode errCode;

    public AuthException(ErrorCode errCode) {
        super(errCode.getMessage());
        this.errCode = errCode;
    }

}
