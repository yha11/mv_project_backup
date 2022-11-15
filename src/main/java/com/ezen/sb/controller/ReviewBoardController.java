package com.ezen.sb.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.sb.model.ReviewBoardModel;
import com.ezen.sb.service.ReviewBoardService;
import com.github.pagehelper.PageInfo;

@Controller
public class ReviewBoardController {
	
	@Autowired
	private ReviewBoardService reviewBoardService;
	
	@GetMapping("/reviewBoards")
	public @ResponseBody PageInfo<ReviewBoardModel> getBoards(ReviewBoardModel reviewBoardModel){
		return reviewBoardService.selectBoardList(reviewBoardModel);
	}
	
	@GetMapping("/reviewBoards/{boardNum}")
	public @ResponseBody ReviewBoardModel getBoard(@PathVariable("boardNum") int boardNum) {
		return reviewBoardService.selectBoardRead(boardNum);
	}
	
	@PostMapping("/reviwBoards")
	public @ResponseBody int addBoard(@RequestBody ReviewBoardModel reviewBoardModel) {
		return reviewBoardService.insertReviewBoard(reviewBoardModel);
	}
	
	@PostMapping("/reviewBoards")
	public @ResponseBody int modifyBoard(@RequestBody ReviewBoardModel reviewBoardModel) {
		return reviewBoardService.updateReviewBoard(reviewBoardModel);
	}
	
	
}
