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
	
	public PageInfo<QnaModel> selectQnas(Integer userNum, QnaModel qnaModel) {
		PageHelper.startPage(qnaModel.getPage(), qnaModel.getPageSize());
		return PageInfo.of(qnaMapper.selectQnas(userNum));
	}
	
	public QnaModel selectQna(long qnaNum, Integer userNum) {
		return qnaMapper.selectQna(qnaNum, userNum);
	}
	
	public PageInfo<QnaModel> selectAllQna(QnaModel qnaModel) {
		PageHelper.startPage(qnaModel.getPage(), qnaModel.getPageSize());
		return PageInfo.of(qnaMapper.searchAnswer(qnaModel));
	}
	
	public int insertQna(Integer userNum, QnaModel qnaModel) {
		qnaModel.setUserNum(userNum);
		return qnaMapper.insertQna(qnaModel);
	}
	
	public int updateQna(QnaModel qnaModel) {
		return qnaMapper.updateQna(qnaModel);
	}








}
