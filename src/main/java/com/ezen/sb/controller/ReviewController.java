package com.ezen.sb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.sb.model.MovieVO;
import com.ezen.sb.model.ReviewModel;
import com.ezen.sb.model.UserInfoModel;
import com.ezen.sb.service.ReviewService;
import com.github.pagehelper.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReviewController {
	@Autowired
	private ReviewService reviewService;

	 //영화 정보 가져오기
	 @GetMapping("/movie/{movieNum}")
	 public @ResponseBody MovieVO getSynopsis(@PathVariable("movieNum") Integer movieNum) { 
		 return reviewService.selectMovie(movieNum);
	 }

	// 영화 리뷰 가져오기
	@GetMapping("/reviews/{movieNum}")
	public @ResponseBody PageInfo<ReviewModel> getReviews(@PathVariable("movieNum") Integer movieNum) {
		return reviewService.selectReviews(movieNum);
	}
	
	@GetMapping("/myreviews")
	public @ResponseBody PageInfo<ReviewModel> selectMyReviews(HttpSession session) {
		if(session.getAttribute("user")==null) {
			return null;
		}
		UserInfoModel user = (UserInfoModel) session.getAttribute("user");
		return reviewService.selectMyReviews(user.getUserNum());
	}

	@PostMapping("/addreview")
	public @ResponseBody int addReview(@RequestBody ReviewModel reviewModel, HttpSession session) {
		log.info("reviewModel={}", reviewModel);
		return reviewService.insertReview(reviewModel, session);
	}

	@PostMapping("/delreview")
	public @ResponseBody int removeReview(@RequestBody ReviewModel reviewModel) {
		log.info("reviewModel={}", reviewModel);
		return reviewService.deleteReview(reviewModel);
	}

}
