package com.ezen.sb.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.UserMapper;
import com.ezen.sb.model.UserInfoModel;

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
		int cnt = userMapper.insertUserInfo(uiModel);
		cnt += userMapper.insertUserInfo(uiModel);
		if(cnt!=1) {
			new RuntimeException("오류가 발생했음");
		}
		return cnt;
	}
	public int deleteUserInfo(long userNum) {
		return userMapper.deleteUserInfo(userNum);
	}
}
