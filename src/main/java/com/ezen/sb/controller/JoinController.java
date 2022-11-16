package com.ezen.sb.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.sb.model.DataStatus;
import com.ezen.sb.model.UserModel;
import com.ezen.sb.service.UserService;

@Controller
public class JoinController {

	@Autowired
	private UserService user;

	@GetMapping("terms")
	public String terms() {

		return "views/join/terms";
	}

	@GetMapping("join")
	public String join() {

		return "views/join/join";
	}

	@GetMapping("idCheck.do")
	public String idCheckDo(HttpServletRequest request) {
		String userid = request.getParameter("userid");
		DataStatus result;

		result = user.comfirmId(userid);
		request.setAttribute("result", result);

		return "views/join/idCheck";
	}

	@PostMapping("/join.do")
	public String joinDo(UserModel userModel, Model model) throws IOException {
		model.addAttribute("message", user.insertMember(userModel));

		return "views/login/login";
	}
}
