package com.project.eatda.dto;

import org.springframework.stereotype.Component;

@Component
public class OrderProductDto {
	private String order_id;
	private String p_id;
	private int p_count;
	private int price;
	private String p_name;
	private String img_path;

	public OrderProductDto() {
		super();
	}

	public OrderProductDto(String order_id, String p_id, int p_count, int price, String p_name, String img_path) {
		super();
		this.order_id = order_id;
		this.p_id = p_id;
		this.p_count = p_count;
		this.price = price;
		this.p_name = p_name;
		this.img_path = img_path;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public int getP_count() {
		return p_count;
	}

	public void setP_count(int p_count) {
		this.p_count = p_count;
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

	@Override
	public String toString() {
		return "OrderProductDto [order_id=" + order_id + ", p_id=" + p_id + ", p_count=" + p_count + ", price=" + price
				+ ", p_name=" + p_name + ", img_path=" + img_path + "]";
	}

}
