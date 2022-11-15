package com.ezen.sb.model;

import lombok.Data;

@Data
public class ReviewBoardModel {

	private Integer page;
	private Integer pageSize;
	private Integer boardNum;
	private String boardRated;
	private String boardJenre;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private Integer boardRcmdNum;
	private String boardDate;
	private Integer boardCnt;
}
