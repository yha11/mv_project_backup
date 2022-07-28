package com.runtime.sendbug.mapper;

import com.runtime.sendbug.model.UserInfoModel;

public interface UserMapper {

	UserInfoModel selectUserInfoById(String userId);
}
