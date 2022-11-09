package com.ezen.sb.model;

import lombok.Data;

@Data
public class MuserVO {
	private int userid;
	private String username;
	private String userpw;
	private String content;
	private String mrank;

	@Override
	public String toString() {
		return "MuserVO [userid=" + userid + ", username=" + username + ", userpw=" + userpw + ", content=" + content
				+ ", mrank=" + mrank + "]";
	}

}
