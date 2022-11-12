package com.ezen.sb.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.QnaMapper;
import com.ezen.sb.model.QnaModel;

@Service
public class QnaService {
	@Autowired
	private QnaMapper qnaMapper;
	
	public List<QnaModel> selectQnas(long userNum) {
		return qnaMapper.selectQnas(userNum);
	}
	
	public QnaModel selectQna(Integer qnaNum) {
		return qnaMapper.selectQna(qnaNum);
	}
	
	public int insertQna(QnaModel qnaModel) {
		return qnaMapper.insertQna(qnaModel);
	}
	
	public int updateQna(QnaModel qnaModel) {
		return qnaMapper.updateQna(qnaModel);
	}

}
