package com.ezen.sb.mapper;

import java.util.List;

import com.ezen.sb.model.ReviewModel;
import com.github.pagehelper.PageInfo;

public interface ReviewMapper {
	
	List<ReviewModel> selectReviews(long movieNum);
	
	List<ReviewModel> selectMyReviews(Integer userNum);
	
	List<ReviewModel> selectAllReviews(ReviewModel reviewModel);
	
	int insertReview(ReviewModel reviewModel);
	
	int deleteReview(ReviewModel reviewModel);
	
	List<ReviewModel> searchReview(ReviewModel reviewModel);

}
