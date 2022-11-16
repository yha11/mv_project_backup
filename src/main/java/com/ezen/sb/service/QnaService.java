package com.ezen.sb.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.QnaMapper;
import com.ezen.sb.model.QnaModel;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class QnaService {
	@Autowired
	private QnaMapper qnaMapper;
	
	public PageInfo<QnaModel> selectQnas(long userNum) {
		PageHelper.startPage(1,10);
		return PageInfo.of(qnaMapper.selectQnas(userNum));
	}
	
	public QnaModel selectQna(long userNum, long qnaNum) {
		return qnaMapper.selectQna(userNum, qnaNum);
	}
	
	public PageInfo<QnaModel> selectAllQna() {
		PageHelper.startPage(1,10);
		return PageInfo.of(qnaMapper.selectAllQna());
	}
	
	public int insertQna(long userNum, QnaModel qnaModel) {
		qnaModel.setUserNum(userNum);
		return qnaMapper.insertQna(qnaModel);
	}
	
	public int updateQna(QnaModel qnaModel) {
		return qnaMapper.updateQna(qnaModel);
	}








}
