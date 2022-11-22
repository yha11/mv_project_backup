package com.ezen.sb.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.sb.model.QnaModel;

public interface QnaMapper {
	
	List<QnaModel> selectQnas(Integer userNum);
	
	QnaModel selectQna(@Param("qnaNum") long qnaNum, @Param("userNum") Integer userNum);
	
	List<QnaModel> selectAllQna();
	
	int insertQna(QnaModel qnaModel);
	
	int updateQna(QnaModel qnaModel);
	
	List<QnaModel> searchAnswer(QnaModel qnaModel);

}
