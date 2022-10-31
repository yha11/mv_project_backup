package com.ezen.sb.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.NormalMapper;
import com.ezen.sb.model.UserInfoModel;
@Service
public class UserNormalService {

	@Autowired
	private NormalMapper normalMapper;
	
	public List<UserInfoModel> getUsers(){
		return normalMapper.selectUserInfos();
	}
}
