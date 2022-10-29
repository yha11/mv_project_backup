package com.ezen.sb.handler;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import com.ezen.sb.code.ErrorCode;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class AuthenticationEntryPointHandler implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        String exception = (String) request.getAttribute("exception");
        ErrorCode errorCode;
        Iterator<String> names = request.getAttributeNames().asIterator();
        while(names.hasNext()) {
        	String name = names.next();
        	log.info("name=>{}",name);
        	log.info("value=>{}",request.getAttribute(name));
        }
        log.info("authException=>{}",authException);
        /**
         * 토큰이 없는 경우 예외처리
         */
        if(exception == null) {
            errorCode = ErrorCode.UNAUTHORIZEDException;
            setResponse(response, errorCode);
            return;
        }

        /**
         * 토큰이 만료된 경우 예외처리
         */
        if(exception.equals("ExpiredJwtException")) {
            errorCode = ErrorCode.ExpiredJwtException;
            setResponse(response, errorCode);
            return;
        }
    }

    private void setResponse(HttpServletResponse response, ErrorCode errorCode) throws IOException {
        JSONObject json = new JSONObject();
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);

        try {
			json.put("code", errorCode.getCode());
	        json.put("message", errorCode.getMessage());
		} catch (JSONException e) {
			e.printStackTrace();
		}
        response.getWriter().print(json);
    }
}
