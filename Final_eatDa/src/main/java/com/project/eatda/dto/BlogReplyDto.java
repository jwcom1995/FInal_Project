package com.project.eatda.dto;

import java.util.Date;
import org.springframework.stereotype.Component;

@Component
public class BlogReplyDto {
	private int reply_no; // 댓글 번호
	private int blog_no; // 게시글 번호
	private String user_id; // 댓글 작성자
	private String reply_content; // 댓글 내용
	private Date regdate; // 댓글 작성일자
	private Date updatedate; // 댓글 수정일자
	private String updateDateString;

	public BlogReplyDto() {
		super();
	}

	public BlogReplyDto(int reply_no, int blog_no, String user_id, String reply_content, Date regdate, Date updatedate,
			String updateDateString) {
		super();
		this.reply_no = reply_no;
		this.blog_no = blog_no;
		this.user_id = user_id;
		this.reply_content = reply_content;
		this.regdate = regdate;
		this.updatedate = updatedate;
		this.updateDateString = updateDateString;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
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

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public String getUpdateDateString() {
		return updateDateString;
	}

	public void setUpdateDateString(String updateDateString) {
		this.updateDateString = updateDateString;
	}

	@Override
	public String toString() {
		return "BlogReplyDto [reply_no=" + reply_no + ", blog_no=" + blog_no + ", user_id=" + user_id
				+ ", reply_content=" + reply_content + ", regdate=" + regdate + ", updatedate=" + updatedate
				+ ", updateDateString=" + updateDateString + "]";
	}

}
