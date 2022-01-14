package com.project.eatda.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.eatda.dto.SubscriptionDto;
import com.project.eatda.dto.UserDto;

public interface MemberDao {
String NAMESPACE_MEMBER = "mymember.";
	
	//로그인 체크
	public UserDto loginCheck(UserDto dto) throws Exception;

	//로그아웃
	public void logout(HttpSession session);
	
	//아이디 중복체크
	public int idCheck(UserDto dto) throws Exception;
	
	//회원가입
	public void memberRegist(UserDto dto);
	
	//회원정보 수정
	public void memberUpdate(UserDto dto) throws Exception;
	
	//회원탈퇴
	public void memberDelete(UserDto dto) throws Exception;
	
}
   