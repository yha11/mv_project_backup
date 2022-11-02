package com.ezen.sb.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import com.ezen.sb.code.ErrorCode;
import com.ezen.sb.exception.AuthException;
import com.ezen.sb.model.UserInfoModel;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AuthService {
    //토큰방식 사용안함
//	@Autowired
//    private JwtTokenProvider jwtProvider;
	@Autowired
    private AuthenticationManager authenticationManager;

	
    public Map<String,String> login(UserInfoModel user, HttpSession session) {
        try {
        	Authentication auth = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(user.getUserId(), user.getPassword())
            );
        	UserInfoModel authUser = (UserInfoModel)auth.getPrincipal();
        	authUser.setPassword(null);
            session.setAttribute("user", authUser);
            Map<String,String> rMap = new HashMap<>();
            rMap.put("success", "ok");
            rMap.put("userName", authUser.getUserName());
            return rMap;
        } catch (Exception e) {
            log.error("loginException=>{}",e);
            throw new AuthException(ErrorCode.UsernameOrPasswordNotFoundException);
        }
    }
    
    //토큰방식 사용안함
//    private Map<String, String> createTokenReturn(UserInfoModel user) {
//        Map<String,String> result = new HashMap<>();
//        String accessToken = jwtProvider.createAccessToken(user);
//        result.put("accessToken", accessToken);
//        return result;
//    }
}
