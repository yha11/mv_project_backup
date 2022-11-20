package com.ezen.sb.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.MovieMapper;
import com.ezen.sb.mapper.ReviewMapper;
import com.ezen.sb.model.MovieVO;
import com.ezen.sb.model.ReviewModel;
import com.ezen.sb.model.UserModel;
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
	
	public List<MovieVO> selectAllMovie() {
		return movieMapper.selectAllMovie();
	}
	
	public PageInfo<ReviewModel> selectReviews(Integer movieNum) {
		PageHelper.startPage(1,10);
		return PageInfo.of(reviewMapper.selectReviews(movieNum));
	}
	
	public PageInfo<ReviewModel> selectMyReviews(Integer userNum, ReviewModel reviewModel) {
		PageHelper.startPage(reviewModel.getPage(), reviewModel.getPageSize());
		return PageInfo.of(reviewMapper.selectMyReviews(userNum));
	}
	
	public PageInfo<ReviewModel> selectAllReviews(ReviewModel reviewModel) {
		PageHelper.startPage(reviewModel.getPage(), reviewModel.getPageSize());
		return PageInfo.of(reviewMapper.searchReview(reviewModel));
	}
		
	public int insertReview(ReviewModel reviewModel, HttpSession session) {
		UserModel user = (UserModel) session.getAttribute("user");
		reviewModel.setUserNum(user.getUserNum());
		return reviewMapper.insertReview(reviewModel);
	}
	
	public int deleteReview(ReviewModel reviewModel) {
		return reviewMapper.deleteReview(reviewModel);
	}
	
	/*
	 * public List<ReviewModel> searchReview(String searchObj, String searchStr) {
	 * ReviewModel reviewModel = return reviewMapper.searchReview(reviewModel); }
	 */

}
