package com.ezen.sb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.sb.model.UserInfoModel;
import com.ezen.sb.service.TestService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Api(tags = "Test / 테스트")
@RestController
public class TestController {
	@Autowired
	private TestService ts;

	@GetMapping("/test")
    @ApiOperation(value="test")
    @ApiResponses({@ApiResponse(code = 200, message = "OK")})
	public String getTest(HttpSession session) {
		UserInfoModel user = (UserInfoModel)session.getAttribute("user");
		ts.sessionTest(session);
		return user.getUserName();
	}
	

	@GetMapping("/test/{cnt}")
    @ApiOperation(value="test/cnt")
    @ApiResponses({@ApiResponse(code = 200, message = "OK")})
	public String getAsync(@PathVariable("cnt") int cnt) throws InterruptedException {
		Thread.sleep(cnt*1000);
		return "Result : " + cnt;
	}
}
