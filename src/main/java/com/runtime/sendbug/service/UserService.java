package com.runtime.sendbug.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.runtime.sendbug.mapper.UserMapper;
import com.runtime.sendbug.model.UserInfoModel;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService implements UserDetailsService {
    private final UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		return userMapper.selectUserInfoById(userId);
	}
	
	public List<UserInfoModel> getUsers(){
		return userMapper.selectUserInfos();
	}

	public int insertUserInfo(UserInfoModel uiModel) {
		return userMapper.insertUserInfo(uiModel);
	}
	public int deleteUserInfo(long userNum) {
		return userMapper.deleteUserInfo(userNum);
	}
}
