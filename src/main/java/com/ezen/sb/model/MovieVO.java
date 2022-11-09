package com.ezen.sb.model;

import lombok.Data;

@Data
public class MovieVO {
	private String title;
	private String rank;
	private String image;
	private String percent;
	private String link;
	private String ticketing;
	

	@Override
	public String toString() {
		return "MovieVO [title=" + title + ", rank=" + rank + ", image=" + image + ", percent=" + percent + "]";
	}
}

