package com.ezen.sb.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.sb.model.UserInfoModel;
import com.ezen.sb.service.UserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Api(tags = "User / 유저")
@RestController
public class UserController {
	@Autowired
    private UserService userService;

	@GetMapping("/user/select")
	@ApiOperation(value = "현재 로그인한 유저 검색 이나 다른 유저 검색이 가능하다(단 현재 로그인한 유저가 아닐 경우에는 ID, EMAIL, NAME 정보만 가져온다)")
	@ApiResponses({ @ApiResponse(code = 200, message = "OK") })
	public UserInfoModel getUser(String userId, Authentication authentication) {
		return null;
	}

	@PostMapping("/user/update")
	@ApiOperation(value = "유저 수정")
	@ApiResponses({ @ApiResponse(code = 200, message = "OK") })
	public Map<String, Object> updateUser(@RequestBody UserInfoModel userInfo, Authentication authentication) {
		return null;
	}

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
