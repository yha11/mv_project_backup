package com.ezen.sb.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserModel {
	private Integer userNum;
	private String userId;
	private String userName;
	private String password;
	private String birth;
	private String email;
	private String phone;
	private String registDate;
	private String addr;
	private Integer admin;
}
