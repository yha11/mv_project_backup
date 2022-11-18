package com.ezen.sb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.model.DataStatus;
import com.ezen.sb.model.UserDAO;

@Service
public class PhoneIDCheckService {
	//아이디 찾을때 사용하는 메서드
	//휴대폰번호 + 이름으로 확인
	
	@Autowired
	private UserDAO userDAO;
	
	//아이디찾기 메서드
	public String checkUserPhoneName(String phone, String name) {
		String message;
		String userId;
		
		userId = userDAO.checkUserPhoneName(phone, name);
		if (userId != null) {
			message = "회원님의 아이디는" + userId + "입니다.";
		}else {
			message = "회원님의 아이디가 존재하지 않습니다. 확인부탁드립니다.";
		}
		return message;
	}
	
	//비밀번호찾기 메서드
	public String checkUserPhoneNameId(String userName,String userId,String phone) {
		String message;
		DataStatus result = userDAO.checkUserPhoneNameId(userName, userId, phone);
		
		//3가지 정보 모두 만족
		
		if (result == DataStatus.Exist) {
			message = "새로운 비밀번호를 입력해 주세요";
		} else {
			message = "입력하신 정보와 일치하는 회원정보가 없습니다.";
		}
		return message;
	}
}
