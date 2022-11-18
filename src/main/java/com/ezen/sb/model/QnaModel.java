package com.ezen.sb.model;

import lombok.Data;

@Data
public class QnaModel {
	private long qnaNum;
	private String qnaDate;
	private String qnaStatus;
	private String qnaTitle;
	private String qnaContent;
	private String qnaFile;
	private String qnaAnswer;
	private Integer userNum;
	private Integer page;
	private Integer pageSize;

}
