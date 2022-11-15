package com.ezen.sb.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.ReviewBoardMapper;
import com.ezen.sb.model.ReviewBoardModel;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ReviewBoardService {

	@Autowired
	private ReviewBoardMapper reviewBoardMapper;
	
	public PageInfo<ReviewBoardModel> selectBoardList(ReviewBoardModel reviewBoardModel){
		PageHelper.startPage(reviewBoardModel.getPage(), reviewBoardModel.getPageSize());
		return PageInfo.of(reviewBoardMapper.selectBoardList(reviewBoardModel));
	}
	
	public ReviewBoardModel selectBoardRead(int boardNum) {
		return reviewBoardMapper.selectBoardRead(boardNum);
	}
	
	public int insertReviewBoard(ReviewBoardModel reviewBoardModel) {
		return reviewBoardMapper.insertReviewBoard(reviewBoardModel);
	}
	
	public int updateReviewBoard(ReviewBoardModel reviewBoardModel) {
		return reviewBoardMapper.insertReviewBoard(reviewBoardModel);
	}
	
	public int deleteReviewBoard(ReviewBoardModel reviewBoardModel) {
		return reviewBoardMapper.insertReviewBoard(reviewBoardModel);
	}
}
