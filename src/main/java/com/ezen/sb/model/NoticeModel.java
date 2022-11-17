package com.ezen.sb.model;

import lombok.Data;

@Data
public class NoticeModel {

	private Integer page;
	private Integer pageSize;
	private Integer noticeNum;
	//private long noticeNum;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeDate;
	private Integer noticeCnt;
	private String noticeContent;
	private Integer userNum;
}
