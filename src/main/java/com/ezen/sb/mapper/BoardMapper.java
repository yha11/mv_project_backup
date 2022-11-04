package com.ezen.sb.mapper;

import java.util.List;

import com.ezen.sb.model.BoardModel;

public interface BoardMapper {

	List<BoardModel> selectBoards();
	int insertBoard(BoardModel boardMdel);
	int updateBoard(BoardModel boardMdel);
	int deleteBoard(BoardModel boardMdel);
}
