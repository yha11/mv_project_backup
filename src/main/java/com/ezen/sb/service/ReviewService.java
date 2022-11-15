package com.ezen.sb.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.MovieMapper;
import com.ezen.sb.mapper.ReviewMapper;
import com.ezen.sb.model.MovieVO;
import com.ezen.sb.model.ReviewModel;
import com.ezen.sb.model.UserInfoModel;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ReviewService {
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private MovieMapper movieMapper;
	
	public MovieVO selectMovie(Integer movieNum) {
		return movieMapper.selectMovie(movieNum);
	}
	
	public PageInfo<ReviewModel> selectReviews(long movieNum) {
		PageHelper.startPage(1,10);
		return PageInfo.of(reviewMapper.selectReviews(movieNum));
	}
	
	public PageInfo<ReviewModel> selectMyReviews(long userNum) {
		PageHelper.startPage(1,10);
		return PageInfo.of(reviewMapper.selectMyReviews(userNum));
	}
	
	public int insertReview(ReviewModel reviewModel, HttpSession session) {
		UserInfoModel user = (UserInfoModel) session.getAttribute("user");
		reviewModel.setUserNum(user.getUserNum());
		return reviewMapper.insertReview(reviewModel);
	}
	
	public int deleteReview(ReviewModel reviewModel) {
		return reviewMapper.deleteReview(reviewModel);
	}

}
