package com.ezen.sb.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.ezen.sb.model.UserInfoModel;

public interface UserMapper {

	UserInfoModel selectUserInfoById(String userId);
	
	List<UserInfoModel> selectUserInfos();

	int insertUserInfo(UserInfoModel uiModel);
	int deleteUserInfo(long userNum);
	
	int updateUserInfo(UserInfoModel userInfoModel);
}
