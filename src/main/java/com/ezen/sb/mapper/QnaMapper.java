package com.ezen.sb.mapper;


import com.ezen.sb.model.QnaModel;
import com.github.pagehelper.PageInfo;

public interface QnaMapper {
	
	PageInfo<QnaModel> selectQnas(Long userNum);
	
	QnaModel selectQna(Integer qnaNum);
	
	int insertQna(QnaModel qnaModel);
	
	int updateQna(QnaModel qnaModel);

}
