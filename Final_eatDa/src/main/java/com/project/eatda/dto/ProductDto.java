package com.project.eatda.dto;

import org.springframework.stereotype.Component;

@Component
public class ProductDto {

	private String p_id;
	private String p_name;
	private String p_short_desc;
	private String p_price;
	private String p_description;
	private int p_cal;
	private int p_amount;
	private String p_category;
	private String img_path;
	private String seller_desc;
	private int p_no;

	public ProductDto() {
		super();
	}

	public ProductDto(String p_id, String p_name, String p_short_desc, String p_price, String p_description, int p_cal,
			int p_amount, String p_category, String img_path, String seller_desc, int p_no) {
		super();
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_short_desc = p_short_desc;
		this.p_price = p_price;
		this.p_description = p_description;
		this.p_cal = p_cal;
		this.p_amount = p_amount;
		this.p_category = p_category;
		this.img_path = img_path;
		this.seller_desc = seller_desc;
		this.p_no = p_no;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getSeller_desc() {
		return seller_desc;
	}

	public void setSeller_desc(String seller_desc) {
		this.seller_desc = seller_desc;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_short_desc() {
		return p_short_desc;
	}

	public void setP_short_desc(String p_short_desc) {
		this.p_short_desc = p_short_desc;
	}

	public String getP_price() {
		return p_price;
	}

	public void setP_price(String p_price) {
		this.p_price = p_price;
	}

	public String getP_description() {
		return p_description;
	}

	public void setP_description(String p_description) {
		this.p_description = p_description;
	}

	public int getP_cal() {
		return p_cal;
	}

	public void setP_cal(int p_cal) {
		this.p_cal = p_cal;
	}

	public int getP_amount() {
		return p_amount;
	}

	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	
	public int getP_no() {
		return p_no;
	}
	
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	@Override
	public String toString() {
		return "ProductDto [p_id=" + p_id + ", p_name=" + p_name + ", p_short_desc=" + p_short_desc + ", p_price="
				+ p_price + ", p_description=" + p_description + ", p_cal=" + p_cal + ", p_amount=" + p_amount
				+ ", p_category=" + p_category + ", img_path=" + img_path + ", seller_desc=" + seller_desc + ",p_no="+p_no +"]";
	}

	

}
