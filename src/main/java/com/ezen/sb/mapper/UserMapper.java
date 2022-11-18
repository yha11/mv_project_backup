package com.ezen.sb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.sb.model.UserModel;

public interface UserMapper {

	UserModel findUser(@Param("userId")String userId);
	List<UserModel> selectUserInfos();

	String checkUserPhone(@Param("phone")String phone);
	String checkUserPhoneName(@Param("phone")String phone, @Param("userName")String userName);
	String checkUserPhoneNameId(@Param("userName")String userName, @Param("userId")String userId, @Param("phone")String phone);
	int updatePassword(@Param("userId")String userId, @Param("password")String password);
	int insertMember(UserModel userModel);
	UserModel getMember(@Param("userId")String userId);
	String userCheck(@Param("userId")String userId);
	int deleteMember(@Param("userId")String userId);
	int updateMember(UserModel userModel);
	int updateUser(UserModel userModel);
}
