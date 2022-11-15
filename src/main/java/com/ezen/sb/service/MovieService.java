package com.ezen.sb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.MovieMapper;
import com.ezen.sb.model.MovieVO;

@Service
public class MovieService {
	@Autowired
	private MovieMapper movieMapper;
	
	public List<MovieVO> selectBoards(MovieVO movieModel){
		return movieMapper.selectLists(movieModel);
	}
	
	public MovieVO selectMovieVO(String rank) {
		return movieMapper.selectRead(rank);
	}
	
	public int insertMovie(MovieVO movieModel) {
		return movieMapper.insertMovie(movieModel);
	}
	
	public int deleteMovie(MovieVO movieModel) {
		return movieMapper.deleteMovie(movieModel);
	}
	
}
