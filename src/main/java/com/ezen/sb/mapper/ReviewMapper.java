package com.ezen.sb.mapper;

import java.util.List;

import com.ezen.sb.model.ReviewModel;

public interface ReviewMapper {
	
	List<ReviewModel> selectReviews(long movieNum);
	
	int insertReview(ReviewModel reviewModel);
	
	int deleteReview(long userNum);

}
