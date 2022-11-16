package com.ezen.sb.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.sb.model.QnaModel;

public interface QnaMapper {
	
	List<QnaModel> selectQnas(long userNum);
	
	QnaModel selectQna(@Param("userNum") long userNum, @Param("qnaNum") long qnaNum);
	
	List<QnaModel> selectAllQna();
	
	int insertQna(QnaModel qnaModel);
	
	int updateQna(QnaModel qnaModel);

}
