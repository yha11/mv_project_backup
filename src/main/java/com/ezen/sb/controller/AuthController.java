package com.ezen.sb.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.sb.model.UserInfoModel;
import com.ezen.sb.service.AuthService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Api(tags = "Auth / 로그인")
@RestController
public class AuthController {
	@Autowired
    private AuthService authService;

    @PostMapping("/auth/login")
    @ApiOperation(value="로그인")
    @ApiResponses({@ApiResponse(code = 200, message = "OK")})
    public Map<String,String> login(@RequestBody @Valid UserInfoModel user, HttpSession session){
        return authService.login(user, session);
    }

}
