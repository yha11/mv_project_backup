package com.ezen.sb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.sb.model.UserDAO;
import com.ezen.sb.model.UserModel;
import com.ezen.sb.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserDAO user;
	
	//로그인
	@PostMapping("/login.do")
	public String loginDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "views/login/login";
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		UserModel userModel;
		
		try {
			validate(userid, pwd);
			userModel= user.findUser(userid);
		}catch (Exception e) { //로그인 도중 발생하는 에러 처리
			request.setAttribute("message", e.getMessage());
			e.printStackTrace();
			//로그인 실패시 가는 url
			return url;
		}
		
		//로그인 결과 처리
		if (userModel.getPassword().equals(pwd)) {
			request.setAttribute("message", "로그인 되었습니다.");
			makeSession(request, userModel);
			//로그인 성공시 가게되는 url
			url = "redirect:views/index";
		} else {
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
		}
		return url;
	}
	
	//아이디 찾기
	@GetMapping("/findId")
	public String findId() {
		
		return "views/login/findId";
	}
	
	// 비밀번호 찾기
	@GetMapping("/findPassword")
	public String findPassword() {

		return "views/login/findPassword";
	}

	private void validate(String userid, String pwd) {
		if (userid == null || userid == "") {
			throw new IllegalArgumentException("아이디가 비어있습니다.");
		} else if (pwd == null || pwd == "") {
			throw new IllegalArgumentException("패스워드가 비어있습니다.");
		}
	}

	private void makeSession(HttpServletRequest request, UserModel userModel) {
		HttpSession session = request.getSession();
		session.setAttribute("name", userModel.getUserName());
		session.setAttribute("userid", userModel.getUserId());
		session.setAttribute("password",userModel.getPassword());
		session.setAttribute("birth", userModel.getBirth());
		session.setAttribute("email",userModel.getEmail());
		session.setAttribute("phone",userModel.getPhone());
		if (userModel.getRegistDate() != null) {
			session.setAttribute("registDate", userModel.getRegistDate().toString());
		}
		session.setAttribute("addr", userModel.getAddr());
		session.setAttribute("admin", userModel.getAdmin());
	}
}
