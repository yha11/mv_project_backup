package com.runtime.sendbug.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.runtime.sendbug.model.UserInfoModel;
import com.runtime.sendbug.service.UserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;

@Api(tags = "User / 유저")
@RestController
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @PostMapping("/users")
    @ApiOperation(value="유저생성")
    @ApiResponses({@ApiResponse(code = 200, message = "OK")})
    public Map<String,String> signUp(@RequestBody @Valid UserInfoModel user){
    	int result = userService.insertUserInfo(user);
    	if(result!=1) {
    		throw new RuntimeException("회원가입중에 오류가 발생하였습니다.");
    	}
    	Map<String,String> rMap = new HashMap<>();
    	rMap.put("msg", "성공하였습니다.");
    	rMap.put("result", result+"");
        return rMap;
    }

    @DeleteMapping("/users/{userNum}")
    @ApiOperation(value="유저삭제")
    @ApiResponses({@ApiResponse(code = 200, message = "OK")})
    public Map<String,String> deleteUser(@PathVariable("userNum") long userNum){
    	int result = userService.deleteUserInfo(userNum);
    	if(result!=1) {
    		throw new RuntimeException("존재하지 않는 회원입니다.");
    	}
    	Map<String,String> rMap = new HashMap<>();
    	rMap.put("msg", "성공하였습니다.");
    	rMap.put("result", result+"");
        return rMap;
    }
}
