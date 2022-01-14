package com.project.eatda.dto;

import org.springframework.stereotype.Component;

@Component
public class BlogLikeDto {
	private int blog_no;
	private String user_id;
	
	public BlogLikeDto() {
		super();
	}
	
	public BlogLikeDto(int blog_no, String user_id) {
		super();
		this.blog_no = blog_no;
		this.user_id = user_id;
	}
	
	public int getBlog_no() {
		return blog_no;
	}
	public void setBlog_no(int blog_no) {
		this.blog_no = blog_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "BlogLikeDto [blog_no=" + blog_no + ", user_id=" + user_id + "]";
	}
	
	
}
