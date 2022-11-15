package com.ezen.sb.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieVO {
	private Integer movieNum;
	private String title;
	private String rank;
	private String image;
	private String percent;
	private String link;
	private String ticketing;

}

