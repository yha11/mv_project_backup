package com.ezen.sb.mapper;


import java.util.List;

import com.ezen.sb.model.QnaModel;

public interface QnaMapper {
	
	List<QnaModel> selectQnas(long userNum);
	
	QnaModel selectQna(Integer qnaNum);
	
	int insertQna(QnaModel qnaModel);
	
	int updateQna(QnaModel qnaModel);

}
