package com.ezen.sb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.sb.model.MovieVO;
import com.ezen.sb.model.ReviewModel;
import com.ezen.sb.service.ReviewService;
import com.github.pagehelper.PageInfo;

import io.swagger.v3.oas.annotations.parameters.RequestBody;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;

	 //영화 정보 가져오기
	 @GetMapping("/movie/{movieNum)")
	 public @RequestBody MovieVO getSynopsis(@PathVariable("movieNum") long movieNum) { 
		 return reviewService.selectMovie(movieNum);
	 }

	// 영화 리뷰 가져오기
	@GetMapping("/reviews/{movieNum}")
	public @RequestBody PageInfo<ReviewModel> getReviews(@PathVariable("movieNum") long movieNum) {
		return reviewService.selectReviews(movieNum);
	}

	@PostMapping("/review")
	public @RequestBody int addReview(ReviewModel reviewModel) {
		return reviewService.insertReview(reviewModel);
	}

	@PostMapping("/review/remove")
	public @RequestBody int removeReview(long userNum) {
		return reviewService.deleteReview(userNum);
	}

}
