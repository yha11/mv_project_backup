package com.ezen.sb.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.sb.mapper.UserMapper;
import com.ezen.sb.model.DAOResult;
import com.ezen.sb.model.DataStatus;
import com.ezen.sb.model.UserDAO;
import com.ezen.sb.model.UserModel;

@Repository
public class UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private UserMapper userMapper;

	public String deleteMember(String userId) {
		String message;
		DAOResult result = userDAO.deleteMember(userId);

		if (result == DAOResult.Success) {
			message = "삭제되었습니다";
		} else {
			message = "오류 확인";
		}

		return message;
	}

	public String updateMember(UserModel userModel) {

		DAOResult result = userDAO.updateMember(userModel);
		String message;
		if (result == DAOResult.Success) {
			message = "수정되었습니다";
		} else {
			message = "오류 확인";
		}

		return message;
	}
	
	//전체 회원정보 가져오기
	public List<UserModel> selectUserInfos(){
		List<UserModel> memberInfo = userDAO.selectUserInfos();
		
		return memberInfo;
	}

	public DataStatus comfirmId(String userId) {
		DataStatus result;
		UserModel userModel;

		if (userId.length() < 4) {
			result = DataStatus.Invalid_InputValue;
			return result;
		} else {
			try {
				userModel = userDAO.findUser(userId);
				result = DataStatus.Exist;
			}
			// 존재하지 않는 회원일 경우 (exception 발생)
			catch (Exception e) {
				result = DataStatus.Not_Exist;
			}
		}

		return result;
	}
	
	public UserModel findUser(String userId) throws Exception{
		//userid로 찾기
		UserModel userModel = userDAO.findUser(userId);
		
		return userModel;
	}
	
	public String updatePassword(String userId, String password) {
		String message;
		UserModel userModel;

		// 1. 새 비밀번호가 이전 비밀번호와 일치하는지 확인하기
		try {
			userModel = userDAO.findUser(userId);
			if (userModel.getPassword().equals(password)) {
				message = "비밀번호가 이전 비밀번호와 같습니다. 새로운 비밀번호를 입력해주세요";
				return message;
			}
			// DB에 존재하지 않는 id가 들어왔을경우 에러발생
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 2. 새 비밀번호가 이전 비밀번호와 일치하지 않다면
		DAOResult result = userDAO.updatePassword(userId, password);
		if (result == DAOResult.Success) {
			message = "비밀번호 변경에 성공했습니다";
		} else {
			message = "비밀번호 변경에 실패했습니다";
		}

		return message;
	}
	
	public String insertMember(UserModel userModel) {
		DAOResult result;
		String message;

		result = userDAO.insertMember(userModel);
		if (result == DAOResult.Success) {
			message = "회원 가입에 성공했습니다.";
		} else {
			message = "회원 가입에 실패했습니다.";
		}

		return message;
	}
	
	public UserModel getMember(String userId) {
		UserModel umodel = userDAO.getMember(userId);

		return umodel;
	}

	public int userCheck(String userId, String password) {
		int result = -1;
		String checkPwd = userDAO.userCheck(userId);
		if (checkPwd.equals(password)) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}
	
	public int updateUser(HttpSession session, UserModel userModel) throws Exception {
		UserModel user = (UserModel) session.getAttribute("user");
		userModel.setUserNum(user.getUserNum());
		
		int result = userMapper.updateUser(userModel);
		userModel = userDAO.findUser(user.getUserId());
		session.setAttribute("user", userModel);
		return result;
	}
}
