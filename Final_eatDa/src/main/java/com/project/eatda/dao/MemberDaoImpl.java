package com.project.eatda.dao;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.eatda.dto.SubscriptionDto;
import com.project.eatda.dto.UserDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Inject
	SqlSession sqlSession;

	//로그인
	@Override
	public UserDto loginCheck(UserDto dto) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE_MEMBER + "loginCheck", dto);
	}

	//로그아웃
	@Override
	public void logout(HttpSession session) {
		
	}

	//아이디 중복체크
	@Override
	public int idCheck(UserDto dto) throws Exception {
		return sqlSession.selectOne(NAMESPACE_MEMBER + "idCheck", dto);
	}

	//회원가입
	@Override
	public void memberRegist(UserDto dto) {
		sqlSession.insert(NAMESPACE_MEMBER + "memberRegist", dto);
	}

	//회원정보 수정
	@Override
	public void memberUpdate(UserDto dto) throws Exception {
		sqlSession.update(NAMESPACE_MEMBER + "memberUpdate", dto);
	}

	//회원탈퇴
	@Override
	public void memberDelete(UserDto dto) throws Exception {
		sqlSession.update(NAMESPACE_MEMBER + "memberDelete", dto);
	}



}
