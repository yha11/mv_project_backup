package com.ezen.sb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.sb.model.BoardModel;
import com.ezen.sb.service.BoardService;
import com.github.pagehelper.PageInfo;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/boardstest")
	public @ResponseBody boolean boardsTest() {
		boardService.inserTest();
		return true;
	}
	@GetMapping("/boards")
	public @ResponseBody PageInfo<BoardModel> getBoards(BoardModel boardModel){
		return boardService.selectBoards(boardModel);
	}

	@GetMapping("/boards/{boardNum}")
	public @ResponseBody BoardModel getBoards(@PathVariable("boardNum") int boardNum){
		return boardService.selectBoard(boardNum);
	}
	
	@PostMapping("/boards")
	public @ResponseBody int addBoard(@RequestBody BoardModel boardModel){
		return boardService.insertBoard(boardModel);
	}
	
	@PutMapping("/boards")
	public @ResponseBody int modifyBoard(@RequestBody BoardModel boardModel){
		return boardService.updateBoard(boardModel);
	}
	
	@DeleteMapping("/boards")
	public @ResponseBody int removeBoard(@RequestBody BoardModel boardModel){
		return boardService.deleteBoard(boardModel);
	}
}
