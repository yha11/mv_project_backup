package com.ezen.sb.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.sb.mapper.UserMapper;

@Repository
public class UserDAO {

	@Autowired
	private UserMapper userMapper;

	public DAOResult deleteMember(String userId) {
		DAOResult result;
		int checkResult = userMapper.deleteMember(userId);

		if (checkResult > 0) {
			result = DAOResult.Success;
		} else {
			result = DAOResult.Failed;
		}
		return result;
	}

	// 회원 정보 수정
	public DAOResult updateMember(UserModel userModel) {

		int checkDAO = userMapper.updateMember(userModel);
		DAOResult result;

		if (checkDAO > 0) {
			result = DAOResult.Success;
		} else {
			result = DAOResult.Failed;
		}
		return result;
	}

	// 전체 회원정보 가져오기
	public List<UserModel> selectUserInfos() {
		List<UserModel> memberInfo = userMapper.selectUserInfos();

		return memberInfo;
	}

	// 회원가입 (회원정보 DB insert)
	public DAOResult insertMember(UserModel userModel) {
		DAOResult result;
		int insertResult = userMapper.insertMember(userModel);
		if (insertResult > 0) {
			result = DAOResult.Success;
		} else {
			result = DAOResult.Failed;
		}
		return result;
	}

	// userId로 유저 정보 DB에서 확인 후 리턴
	public UserModel findUser(String userId) throws Exception {
		UserModel umodel = userMapper.findUser(userId);

		if (umodel == null) {
			throw new IllegalArgumentException("존재하지 않는 회원입니다. 확인부탁드립니다.");
		}
		return umodel;
	}

	// 비밀번호 변경
	public DAOResult updatePassword(String userid, String password) {
		int updateResult = userMapper.updatePassword(userid, password);
		DAOResult result;

		if (updateResult > 0) {
			result = DAOResult.Success;
		} else {
			result = DAOResult.Failed;
		}
		return result;
	}

	// userid 값 찾기 (매개변수 = phone,name,userid)
	public DataStatus checkUserPhoneNameId(String phone, String userName, String userId) {
		String checkedUserid = userMapper.checkUserPhoneNameId(phone, userName, userId);
		DataStatus result;

		if (checkedUserid == null) {
			result = DataStatus.Not_Exist;
		} else {
			result = DataStatus.Exist;
		}
		return result;
	}

	// userid 값 찾기 (매개변수 = phone,name)
	public String checkUserPhoneName(String phone, String userName) {
		String userid = userMapper.checkUserPhoneName(phone, userName);
		return userid;
	}

	// userid 값 찾기 (매개변수 = phone)
	public DataStatus checkUserPhone(String phone) {
		DataStatus result;
		String userid = userMapper.checkUserPhone(phone);
		if (userid == null) {
			result = DataStatus.Not_Exist;
		} else {
			result = DataStatus.Exist;
		}

		return result;
	}
	
	public UserModel getMember(String userId) {
		UserModel umdel = userMapper.getMember(userId);
		
		return umdel;
	}
	
	public String userCheck(String userId) {
		String userPwd = userMapper.userCheck(userId);
		return userPwd;
	}
}
