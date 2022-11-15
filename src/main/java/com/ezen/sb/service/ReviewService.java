package com.ezen.sb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.ReviewMapper;
import com.ezen.sb.model.ReviewModel;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ReviewService {
	@Autowired
	private ReviewMapper reviewMapper;
	
	public 
	
	public PageInfo<ReviewModel> selectReviews(long movieNum) {
		PageHelper.startPage(1,10);
		return PageInfo.of(reviewMapper.selectReviews(movieNum));
	}
	
	public int insertReview(ReviewModel reviewModel) {
		return reviewMapper.insertReview(reviewModel);
	}
	
	public int deleteReview(long userNum) {
		return reviewMapper.deleteReview(userNum);
	}

}
