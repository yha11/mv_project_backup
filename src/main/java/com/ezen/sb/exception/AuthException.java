package com.ezen.sb.exception;

import org.springframework.security.core.AuthenticationException;

import com.ezen.sb.code.ErrorCode;

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
