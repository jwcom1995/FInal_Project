package com.project.eatda.dto;

import org.springframework.stereotype.Component;

@Component
public class ProductLikeDto {
	private String user_id;
	private String p_id;

	public ProductLikeDto(String user_id, String p_id) {
		super();
		this.user_id = user_id;
		this.p_id = p_id;
	}

	public ProductLikeDto() {
		super();
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	@Override
	public String toString() {
		return "ProductLike [user_id=" + user_id + ", p_id=" + p_id + "]";
	}

}
