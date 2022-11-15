package com.ezen.sb.model;

import lombok.Data;

@Data
public class ReviewModel {
	private long reviewNum;
	private long reviewStarrate;
	private String reviewContent;
	private String reviewDate;
	private long userNum;
	private long movieNum;
}
