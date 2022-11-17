package com.ezen.sb.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.sb.model.QnaModel;
import com.ezen.sb.model.UserModel;
import com.ezen.sb.service.QnaService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/qnaboard")
	public @ResponseBody PageInfo<QnaModel> getQnas(HttpSession session) {
		if(session.getAttribute("user")==null) {
			return null;
		}
		UserModel user = (UserModel) session.getAttribute("user");
		return qnaService.selectQnas(user.getUserNum());
	}
	
	@GetMapping("/qnadetail/{qnaNum}/{userNum}")
	public @ResponseBody QnaModel getQna(HttpSession session, @PathVariable("qnaNum") long qnaNum, @PathVariable("userNum") Integer userNum) {
		if(session.getAttribute("user")==null) {
			return null;
		}
		return qnaService.selectQna(qnaNum, userNum);
	}
	
	@GetMapping("/allqna")
	public @ResponseBody PageInfo<QnaModel> selectAllQna(HttpSession session) {
		UserModel user = (UserModel) session.getAttribute("user");
		
		if(!(user.getAdmin() == 1)) {
			return null;
		}
		return qnaService.selectAllQna();
	}
	
	@PostMapping("/addqna")
	public @ResponseBody int addQna(HttpSession session, @RequestBody QnaModel qnaModel) {
		UserModel user = (UserModel) session.getAttribute("user");
		return qnaService.insertQna(user.getUserNum(), qnaModel);
	}
	
	@PostMapping("/modifyqna")
	public @ResponseBody int modifyQna(@RequestBody QnaModel qnaModel) {
		return qnaService.updateQna(qnaModel);
	}

}
