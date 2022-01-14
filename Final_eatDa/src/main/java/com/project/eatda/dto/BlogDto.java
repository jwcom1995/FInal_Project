package com.project.eatda.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class BlogDto {
	private int blog_no;			// 게시글 번호
	private String user_id;			// 게시글 작성자
	private String blog_title;		// 게시글 제목
	private String blog_content;		// 게시글 내용
	private int blog_count;			// 게시글 조회수
	private int blog_like;			// 게시글 좋아요 갯수
	private String blog_img;			// 게시글 이미지( 썸머노트 해결후 컬럼 삭제 예상 )
	private Date regdate;			// 게시글 작성일자
	private int reply_count;		// 게시글 댓글 수 ( 2021 12 30 추가 )
	
	public BlogDto() {
		super();
	}
	
	public BlogDto(int blog_no, String user_id, String blog_title, String blog_content, int blog_count,
			int blog_like, String blog_img, Date regdate, int reply_count) {
		super();
		this.blog_no = blog_no;
		this.user_id = user_id;
		this.blog_title = blog_title;
		this.blog_content = blog_content;
		this.blog_count = blog_count;
		this.blog_like = blog_like;
		this.blog_img = blog_img;
		this.regdate = regdate;
		this.reply_count = reply_count;
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
	public String getBlog_title() {
		return blog_title;
	}
	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}
	public String getBlog_content() {
		return blog_content;
	}
	public void setBlog_content(String blog_content) {
		this.blog_content = blog_content;
	}
	public int getBlog_count() {
		return blog_count;
	}
	public void setBlog_count(int blog_count) {
		this.blog_count = blog_count;
	}
	public int getBlog_like() {
		return blog_like;
	}
	public void setBlog_like(int blog_like) {
		this.blog_like = blog_like;
	}
	public String getBlog_img() {
		return blog_img;
	}
	public void setBlog_img(String blog_img) {
		this.blog_img = blog_img;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public int getReply_count() {
		return reply_count;
	}
	
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	@Override
	public String toString() {
		return "BlogDto [blog_no=" + blog_no + ", user_id=" + user_id + ", blog_title=" + blog_title + ", blog_content="
				+ blog_content + ", blog_count=" + blog_count + ", blog_like=" + blog_like + ", blog_img=" + blog_img
				+ ", regdate=" + regdate + ",reply_count=" + reply_count + "]";
	}
}
