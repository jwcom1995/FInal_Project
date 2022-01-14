package com.project.eatda.dto;

import org.springframework.stereotype.Component;

@Component
public class CartProductDto {
	private String user_id;
	private String p_id;
	private int cart_count;
	private int cart_price;
	private String p_name;
	private String img_path;
	private String category;

	public CartProductDto() {
		super();
	}

	public CartProductDto(String user_id, String p_id, int cart_count, int cart_price, String p_name, String img_path,
			String category) {
		super();
		this.user_id = user_id;
		this.p_id = p_id;
		this.cart_count = cart_count;
		this.cart_price = cart_price;
		this.p_name = p_name;
		this.img_path = img_path;
		this.category = category;
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

	public int getCart_count() {
		return cart_count;
	}

	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}

	public int getCart_price() {
		return cart_price;
	}

	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "CartProductDto [user_id=" + user_id + ", p_id=" + p_id + ", cart_count=" + cart_count + ", cart_price="
				+ cart_price + ", p_name=" + p_name + ", img_path=" + img_path + ", category=" + category + "]";
	}

}
