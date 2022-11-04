package com.ezen.sb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.sb.model.BoardModel;
import com.ezen.sb.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/boards")
	public @ResponseBody List<BoardModel> getBoards(){
		return boardService.selectBoards();
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
