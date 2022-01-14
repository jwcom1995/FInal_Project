package com.project.eatda.dto;

import org.springframework.stereotype.Component;

@Component
public class ReviewDto {
	private int review_no;
	private String order_id;
	private String p_id;
	private String review_content;
	private String review_regdate;
	private String user_id;
	private String user_name;
	private String user_img;

	public ReviewDto() {
		super();
	}

	public ReviewDto(int review_no, String order_id, String p_id, String review_content, String review_regdate,
			String user_id, String user_name, String user_img) {
		super();
		this.review_no = review_no;
		this.order_id = order_id;
		this.p_id = p_id;
		this.review_content = review_content;
		this.review_regdate = review_regdate;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_img = user_img;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_regdate() {
		return review_regdate;
	}

	public void setReview_regdate(String review_regdate) {
		this.review_regdate = review_regdate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	@Override
	public String toString() {
		return "ReviewDto [review_no=" + review_no + ", order_id=" + order_id + ", p_id=" + p_id + ", review_content="
				+ review_content + ", review_regdate=" + review_regdate + ", user_id=" + user_id + ", user_name="
				+ user_name + ", user_img=" + user_img + "]";
	}
}
