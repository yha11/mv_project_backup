package com.ezen.sb.model;

import java.util.List;

public interface MovieDAO {
	public void insert(MovieVO vo) throws Exception;
	public List<MovieVO> list() throws Exception;
	public MovieVO read(String rank) throws Exception;
	public void delete(String rank) throws Exception;
}
