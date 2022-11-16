package com.ezen.sb.mapper;

import java.util.List;

import com.ezen.sb.model.MovieVO;

public interface MovieMapper {

	List<MovieVO> selectLists(MovieVO movieModel);
	MovieVO selectRead(String rank);
	int countMovie();
	int insertMovie(MovieVO movieModel);
	int deleteMovie(MovieVO movieModel);
	
	MovieVO selectMovie(Integer movieNum);
	List<MovieVO> selectAllMovie();
}
