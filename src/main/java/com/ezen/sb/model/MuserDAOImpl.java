package com.ezen.sb.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MuserDAOImpl implements MuserDAO {

	SqlSession session;
	public static final String namespace = "MuserMapper";

	@Override
	public List<MuserVO> list(String mrank) throws Exception {
		return session.selectList(namespace + ".list", mrank);
	}

	@Override
	public void insert(MuserVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void delete(String mrank) throws Exception {
		session.delete(namespace + ".delete", mrank);
	}

}
