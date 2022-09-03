package com.runtime.sendbug.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.runtime.sendbug.model.UserInfoModel;
import com.runtime.sendbug.service.UserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;

@Api(tags = "Admins / 어드민")
@RestController
@RequiredArgsConstructor
public class AdminController {
	
	private final UserService userService;

	@GetMapping("/admins")
    @ApiOperation(value="어드민 리스트")
    @ApiResponses({@ApiResponse(code = 200, message = "OK")})
	public List<UserInfoModel> getAdmins(){
		return userService.getUsers();
	}
}
