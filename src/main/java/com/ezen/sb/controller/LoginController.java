package com.ezen.sb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.sb.model.UserDAO;
import com.ezen.sb.model.UserModel;
import com.ezen.sb.service.PhoneIDCheckService;
import com.ezen.sb.service.UserService;

@Controller
public class LoginController {

	@Autowired
	private UserDAO user;
	@Autowired
	private PhoneIDCheckService phoneIDCheckService;
	@Autowired
	private UserService userservice;

	// 로그인
	@PostMapping("/login.do")
	public String loginDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "views/login/login";
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		UserModel userModel;

		try {
			validate(userid, pwd);
			userModel = user.findUser(userid);
		} catch (Exception e) { // 로그인 도중 발생하는 에러 처리
			request.setAttribute("message", e.getMessage());
			e.printStackTrace();
			// 로그인 실패시 가는 url
			return url;
		}

		// 로그인 결과 처리
		if (userModel.getPassword().equals(pwd)) {
			request.setAttribute("message", "로그인 되었습니다.");
			makeSession(request, userModel);
			// 로그인 성공시 가게되는 url
			url = "redirect:views/index";
		} else {
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
		}
		return url;
	}

	// 아이디 찾기
	@GetMapping("/findId")
	public String findId() {

		return "views/login/findId";
	}

	/*
	 * // 아이디 찾기 확인
	 * 
	 * @PostMapping("/findId.do") public String findIdDo(HttpServletRequest request)
	 * { String name = request.getParameter("name"); String phone =
	 * request.getParameter("phone");
	 * 
	 * // checkPhoneUser 메서드를 통해 id찾기시 출력해줄 message 리턴받기 String message =
	 * phoneIDCheckService.checkUserPhoneName(phone, name);
	 * request.setAttribute("message", message);
	 * 
	 * return "views/login/findIdResult"; }
	 */

	// 아이디 찾기 확인
	@PostMapping("/findId.do")
	public String findIdDo(@RequestParam("phone") String phone,@RequestParam("userName") String userName, Model model)throws IOException {
		model.addAttribute("message", phoneIDCheckService.checkUserPhoneName(phone,userName));
		
		return "views/login/findIdResult";
	}

	// 비밀번호 찾기
	@GetMapping("/findPassword")
	public String findPassword() {

		return "views/login/findPassword";
	}
	
	@PostMapping("/findPassword.do")
	public String findpasswordDo(@RequestParam("userName") String userName,@RequestParam("userId")String userId ,@RequestParam("phone") String phone,Model model )throws IOException {
		model.addAttribute("message", phoneIDCheckService.checkUserPhoneNameId(userName, userId, phone));
		
		return "views/login/findPasswordResult";
	}
	
	@PostMapping("/updatePassword.do")
	public String updatePassword(@RequestParam("userId")String userId, @RequestParam("password")String password, Model model) {
		model.addAttribute("message", userservice.updatePassword(userId, password));
		
		return "views/login/login";
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
		session.setAttribute("userNum", userModel.getUserNum());
		session.setAttribute("userName", userModel.getUserName());
		session.setAttribute("userId", userModel.getUserId());
		session.setAttribute("password", userModel.getPassword());
		session.setAttribute("birth", userModel.getBirth());
		session.setAttribute("email", userModel.getEmail());
		session.setAttribute("phone", userModel.getPhone());
		if (userModel.getRegistDate() != null) {
			session.setAttribute("registDate", userModel.getRegistDate().toString());
		}
		session.setAttribute("addr", userModel.getAddr());
		session.setAttribute("admin", userModel.getAdmin());
		session.setAttribute("user", userModel);
	}

}
