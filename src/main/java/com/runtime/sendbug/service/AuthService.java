package com.runtime.sendbug.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Service;

import com.runtime.sendbug.code.ErrorCode;
import com.runtime.sendbug.exception.AuthException;
import com.runtime.sendbug.model.UserInfoModel;
import com.runtime.sendbug.provider.JwtTokenProvider;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final JwtTokenProvider jwtProvider;
    private final AuthenticationManager authenticationManager;
    public Map<String,String> login(UserInfoModel user) {
        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(user.getUserId(), user.getPassword())
            );
            return createTokenReturn(user);
        } catch (Exception e) {
            e.printStackTrace();
            throw new AuthException(ErrorCode.UsernameOrPasswordNotFoundException);
        }

    }

    // 토큰을 생성해서 반환
    private Map<String, String> createTokenReturn(UserInfoModel user) {
        Map<String,String> result = new HashMap<>();

        String accessToken = jwtProvider.createAccessToken(user);
        result.put("accessToken", accessToken);
        return result;
    }
}
