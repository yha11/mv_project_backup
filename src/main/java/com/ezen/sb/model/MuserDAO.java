package com.ezen.sb.model;

import java.util.List;

public interface MuserDAO {
	public List<MuserVO> list(String mrank) throws Exception;
	public void insert(MuserVO vo) throws Exception;
	public void delete(String mrank) throws Exception;
}
