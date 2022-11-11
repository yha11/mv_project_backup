package com.ezen.sb.mapper;

import java.util.List;

import com.ezen.sb.model.BoardModel;

public interface BoardMapper {

	List<BoardModel> selectBoards(BoardModel boardModel);
	BoardModel selectBoard(int boardNum);
	int insertBoard(BoardModel boardModel);
	int updateBoard(BoardModel boardModel);
	int deleteBoard(BoardModel boardModel);
}
