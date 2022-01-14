package com.project.eatda.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.eatda.dao.BlogReplyDao;
import com.project.eatda.dto.BlogReplyDto;

@Service
public class BlogReplyBizImpl implements BlogReplyBiz{
	
	@Autowired
	public BlogReplyDao replyDao;
	
	// 댓글 목록
	@Override
	public List<BlogReplyDto> list(int blog_no) {
		System.out.println("[biz] reply list");
		return replyDao.list(blog_no);
	}
	
	// 댓글 작성
	@Override
	public int insert(BlogReplyDto dto) {
		System.out.println("[biz] reply insert");
		return replyDao.insert(dto);
	}

	// 댓글 수정
	@Override
	public BlogReplyDto selectOne(int reply_no) {
		System.out.println("[biz] reply select one");
		return replyDao.selectOne(reply_no);
	}
	@Override
	public int update(BlogReplyDto dto) {
		return replyDao.update(dto);
	}
	
	// 댓글 삭제
	@Override
	public int delete(int blog_no, int reply_no) {
		System.out.println("delete reply biz");
		return replyDao.delete(blog_no, reply_no);
	}

}
