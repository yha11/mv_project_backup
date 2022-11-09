package com.ezen.sb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.BoardMapper;
import com.ezen.sb.model.BoardModel;

@Service
public class BoardService {
	@Autowired
	private BoardMapper boardMapper; 

	public List<BoardModel> selectBoards(){
		return boardMapper.selectBoards();
	}
	public int insertBoard(BoardModel boardMdel){
		return boardMapper.insertBoard(boardMdel);
	}
	public int updateBoard(BoardModel boardMdel){
		return boardMapper.updateBoard(boardMdel);
	}
	public int deleteBoard(BoardModel boardMdel){
		return boardMapper.deleteBoard(boardMdel);
	}
}
