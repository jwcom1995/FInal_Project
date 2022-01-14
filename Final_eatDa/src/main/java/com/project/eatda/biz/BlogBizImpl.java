package com.project.eatda.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.eatda.dao.BlogDao;
import com.project.eatda.dto.BlogDto;

@Service
public class BlogBizImpl implements BlogBiz{
	
	@Autowired
	public BlogDao dao;
	
	@Override
	public List<BlogDto> takeBlogList(int num) {
		return dao.takeBlogList(num);
	}

	@Override
	public int paging() {
		return dao.paging();
	}
	
	@Override
	public List<BlogDto> searchBlog(String keyword) {
		return dao.searchBlog(keyword);
	}
	
	@Override
	public BlogDto selectOne(int blog_no) {
		return dao.selectOne(blog_no);
	}
	
	@Override
	public int insert(BlogDto dto) {
		return dao.insert(dto);
	}
	
	@Override
	public int update(BlogDto dto) {
		System.out.println("update biz");
		return dao.update(dto);
	}
	
	@Override
	public int selectBlogNo(String blog_title) {
		return dao.selectBlogNo(blog_title);
	}
	
	@Override
	public int delete(int blog_no) {
		System.out.println("delete biz");
		return dao.delete(blog_no);
	}
	
	@Override
	public int blogCount(int blog_no) {
		return dao.blogCount(blog_no);
	}
	
	/* 관리자 블로그 리스트 (전체 조회) */
	@Override
	public List<BlogDto> adminBlogList(){
		return dao.adminBlogList();
	}

	
	// 관리자 블로그 삭제
	public int adminBlogDelete(int blog_no) {
		return dao.adminBlogDelete(blog_no);
	}
	
	// 관리자 블로그 count
	public int adminBlogCount() {
		return dao.adminBlogCount();
	}
	
	public int newAdminBlogCount() {
		return dao.newAdminBlogCount();
	}

}
