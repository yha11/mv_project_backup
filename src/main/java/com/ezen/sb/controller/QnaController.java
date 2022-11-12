package com.ezen.sb.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.sb.model.QnaModel;
import com.ezen.sb.service.QnaService;
import com.github.pagehelper.PageInfo;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/qnaboard")
	public @ResponseBody PageInfo<QnaModel> getQnas(@RequestBody Long userNum) {
		return qnaService.selectQnas(userNum);
	}
	
	@GetMapping("/qna")
	public @ResponseBody QnaModel getQna(@RequestBody Integer qnaNum) {
		return qnaService.selectQna(qnaNum);
	}
	
	@PostMapping("/addqna")
	public @ResponseBody int addQna(@RequestBody QnaModel qnaModel) {
		return qnaService.insertQna(qnaModel);
	}
	
	@PostMapping("/modifyqna")
	public @ResponseBody int modifyQna(@RequestBody QnaModel qnaModel) {
		return qnaService.updateQna(qnaModel);
	}

}