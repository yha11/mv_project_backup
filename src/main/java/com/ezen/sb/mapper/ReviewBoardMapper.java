package com.ezen.sb.mapper;

import java.util.List;

import com.ezen.sb.model.ReviewBoardModel;

public interface ReviewBoardMapper {

	List<ReviewBoardModel> selectBoardList(ReviewBoardModel reviewBoardModel);
	ReviewBoardModel selectBoardRead(int boardNum);
	int insertReviewBoard(ReviewBoardModel reviewBoardModel);
	int updateReviewBoard(ReviewBoardModel reviewBoardModel);
	int deleteReviewBoard(ReviewBoardModel reviewBoardModel);
}
