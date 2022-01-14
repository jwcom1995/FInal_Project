package com.project.eatda.dao;

import java.util.List;

import com.project.eatda.dto.BlogDto;

public interface BlogDao {
	String BLOG_NAMESPACE = "blog.";
	
	public List<BlogDto> takeBlogList(int num);
	public int paging();
	
	public List<BlogDto> searchBlog(String keyword);
	public BlogDto selectOne(int blog_no);
	public int insert(BlogDto dto);
	public int update(BlogDto dto);
	public int delete(int blog_no);
	
	public int selectBlogNo(String blog_title);
	
	public int blogCount(int blog_no);
	
	/* 관리자 블로그 리스트 (전체 조회) */
	public List<BlogDto> adminBlogList();
	
	// 관리자 블로그 삭제
	public int adminBlogDelete(int blog_no);
	
	//관리자 블로그 count
	public int adminBlogCount();
	
	public int newAdminBlogCount();
}
