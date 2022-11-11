package com.ezen.sb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.BoardMapper;
import com.ezen.sb.model.BoardModel;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class BoardService {
	@Autowired
	private BoardMapper boardMapper; 

	public PageInfo<BoardModel> selectBoards(BoardModel boardMdel){
		PageHelper.startPage(boardMdel.getPage(), boardMdel.getPageSize());
		return PageInfo.of(boardMapper.selectBoards(boardMdel));
	}
	public BoardModel selectBoard(int boardNum){
		return boardMapper.selectBoard(boardNum);
	}
	;
	public int insertBoard(BoardModel boardMdel){
		return boardMapper.insertBoard(boardMdel);
	}
	public int updateBoard(BoardModel boardMdel){
		return boardMapper.updateBoard(boardMdel);
	}
	public int deleteBoard(BoardModel boardMdel){
		return boardMapper.deleteBoard(boardMdel);
	}
	
	public void inserTest() {

		for(int i=10;i<1000;i++) {
			BoardModel bm = new BoardModel();
			bm.setBoardTitle("제목" + i);
			bm.setCreusr(1);
			bm.setBoardContent(" 내용" + i);
			bm.setModusr(1);
			bm.setBoardParentNum(0);
			boardMapper.insertBoard(bm);
		}
	}
}
