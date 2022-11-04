package com.ezen.sb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.sb.model.UserInfoModel;
import com.ezen.sb.service.UserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.extern.slf4j.Slf4j;

@Api(tags = "Admins / 어드민")
@RestController
@Slf4j
public class AdminController {
	
	@Autowired
	private UserService userService;

	@GetMapping("/admins")
    @ApiOperation(value="어드민 리스트")
    @ApiResponses({@ApiResponse(code = 200, message = "OK")})
	public List<UserInfoModel> getAdmins(){
		return userService.getUsers();
	}
	
	@GetMapping("/query")
	public void test(HttpServletRequest request) {
		String boardNum = request.getParameter("query");
		log.info("사용자가 입력한 query=>{}", boardNum);
		log.info("사용자가 입력한 query로 만들어진 sql => {}", "select * from board where board_num="+boardNum);
	}
}
