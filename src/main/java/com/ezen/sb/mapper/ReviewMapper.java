package com.ezen.sb.mapper;

import java.util.List;

import com.ezen.sb.model.ReviewModel;
import com.github.pagehelper.PageInfo;

public interface ReviewMapper {
	
	List<ReviewModel> selectReviews(long movieNum);
	
	List<ReviewModel> selectMyReviews(Integer userNum);
	
	List<ReviewModel> selectAllReviews();
	
	int insertReview(ReviewModel reviewModel);
	
	int deleteReview(ReviewModel reviewModel);

}
