package com.ezen.sb.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MovieDAOImpl implements MovieDAO {
	
	SqlSession session;
	public static final String namespace="MovieMapper";
	
	@Override
	public void insert(MovieVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}
	@Override
	public List<MovieVO> list() throws Exception {
		 return session.selectList(namespace + ".list");
	}
	@Override
	public MovieVO read(String rank) throws Exception {
		return session.selectOne(namespace + ".read", rank);
	}
	@Override
	public void delete(String rank) throws Exception {
		session.delete(namespace + ".delete", rank);
	}
}
