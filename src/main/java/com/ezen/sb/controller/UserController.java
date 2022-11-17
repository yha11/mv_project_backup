package com.ezen.sb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.sb.model.UserModel;
import com.ezen.sb.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/user/modify")
	public @ResponseBody int modifyUser(HttpSession session, @RequestBody UserModel userModel) throws Exception {
		if(session.getAttribute("user") == null) {
			return 0;
		}
		
		return userService.updateUser(session, userModel);
	}

}
