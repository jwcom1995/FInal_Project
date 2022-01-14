package com.project.eatda.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.eatda.dto.BlogReplyDto;

@Repository
public class BlogReplyDaoImpl implements BlogReplyDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 댓글 목록
	@Override
	public List<BlogReplyDto> list(int blog_no) {
		System.out.println("[dao] reply list, blog_no : " + blog_no);
		return sqlSession.selectList(REPLY_NAMESPACE+"listReply", blog_no);
	}
	
	// 댓글 작성
	@Override
	public int insert(BlogReplyDto dto) {
		int res = 0;
		System.out.println("[dao] reply insert");
		try {
			res = sqlSession.insert(REPLY_NAMESPACE+"insertReply", dto);
			System.out.println("[dao] insert result : "+dto);
		} catch (Exception e) {
			System.out.println("[error] : insert reply");
			e.printStackTrace();
		}
		return res;
	}
	
	// 댓글 수정
	@Override
	public BlogReplyDto selectOne(int reply_no) {
		BlogReplyDto dto = null;
		try {
			dto = sqlSession.selectOne(REPLY_NAMESPACE+"selectReply", reply_no);
		} catch (Exception e) {
			System.out.println("[error] select reply for update");
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public int update(BlogReplyDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(REPLY_NAMESPACE+"updateReply", dto);
			System.out.println("update reply dao / reply_no :"+dto.getReply_no());
		} catch (Exception e) {
			System.out.println("[error] : update reply");
			e.printStackTrace();
		}
		return res;
	}
	
	// 댓글 삭제
	@Override
	public int delete(int blog_no, int reply_no) {
		int res = 0;
		BlogReplyDto dto = new BlogReplyDto();
		dto.setBlog_no(blog_no);
		dto.setReply_no(reply_no);
		try {
			res = sqlSession.delete(REPLY_NAMESPACE+"deleteReply", dto);
		} catch (Exception e) {
			System.out.println("[error] : delete reply");
			e.printStackTrace();
		}
		return res;
	}


}
