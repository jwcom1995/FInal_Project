package com.project.eatda.biz;

import javax.servlet.http.HttpSession;

import com.project.eatda.dto.UserDto;

public interface MemberBiz {
	
	//로그인
	public UserDto loginCheck(UserDto dto, HttpSession session) throws Exception;
	
	//로그아웃
	public void logout(HttpSession session);
	
	//아이디 중복체크
	public int idCheck(UserDto dto) throws Exception;
	
	//회원가입
	public void memberRegist(UserDto dto) throws Exception;
	
	//회원정보 수정
	public void memberUpdate(UserDto dto) throws Exception;
	
	//회원탈퇴 
	public void memberDelete(UserDto dto) throws Exception;

}
