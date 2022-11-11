package com.ezen.sb.model;

import lombok.Data;

@Data
public class BoardModel {

	private Integer page;
	private Integer pageSize;
	private Integer boardNum;
	private Integer boardParentNum;
	private Integer level;
	private String boardTitle;
	private String boardFilePath;
	private String boardContent;
	private String credate;
	private String crename;
	private Integer creusr;
	private String moddate;
	private Integer modusr;
	private String order;
}
