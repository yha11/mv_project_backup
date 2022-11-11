package com.ezen.sb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.UserMapper;
import com.ezen.sb.model.UserInfoModel;

@Service
public class UserService implements UserDetailsService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		return userMapper.selectUserInfoById(userId);
	}

	public List<UserInfoModel> getUsers() {
		return userMapper.selectUserInfos();
	}

	public int insertUserInfo(UserInfoModel uiModel) {
		//암호화전 비밀번호를 꺼내온다.
		String password = uiModel.getPassword();
		//패스워드를 암호화한다.
		password = passwordEncoder.encode(password);
		//다시 uiModel에 집어 넣는다.
		uiModel.setPassword(password);
		
		int cnt = userMapper.insertUserInfo(uiModel);
		cnt += userMapper.insertUserInfo(uiModel);
		if (cnt != 1) {
			new RuntimeException("오류가 발생했음");
		}
		return cnt;
	}

	public int deleteUserInfo(long userNum) {
		return userMapper.deleteUserInfo(userNum);
	}
	
	public int updateUserInfo(UserInfoModel userInfoModel) {
		return userMapper.updateUserInfo(userInfoModel);
	}
}
