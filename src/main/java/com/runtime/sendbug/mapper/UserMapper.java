package com.runtime.sendbug.mapper;

import java.util.List;

import com.runtime.sendbug.model.UserInfoModel;

public interface UserMapper {

	UserInfoModel selectUserInfoById(String userId);
	
	List<UserInfoModel> selectUserInfos();

	int insertUserInfo(UserInfoModel uiModel);
	int deleteUserInfo(long userNum);
}
