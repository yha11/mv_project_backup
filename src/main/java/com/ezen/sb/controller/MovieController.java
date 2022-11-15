package com.ezen.sb.controller;

import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.sb.model.MovieDAO;
import com.ezen.sb.model.MovieVO;
import com.ezen.sb.model.NaverAPI;
import com.ezen.sb.service.MovieService;

@Controller
public class MovieController {
	MovieDAO dao;
	
	@Autowired
	private MovieService movieService;

	@RequestMapping("/movie")
	public String moviejsp() {
		return "views/movie";
	}

	@ResponseBody  
	@RequestMapping("movie.json") 
	public List<MovieVO> movie() throws Exception { 
		return movieService.selectBoards();
	}

	@ResponseBody
	@RequestMapping("nmovie.json")
	public String movieList(String keyword, String start) throws Exception {
		String text = URLEncoder.encode(keyword, "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/movie.json?"; 
		apiURL += "query=" + text;
		apiURL += "&start=" + start;
		apiURL += "$display=5";
		return NaverAPI.search(apiURL);
	}

}
