package com.project.eatda.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class OrderAdminDto {
	private String order_id;
	private String user_id;
	private Date order_date;
	private String order_phone;
	private String shipping_status;
	private String order_status;
	
	public OrderAdminDto() {
		super();
	}
	
	public OrderAdminDto(String order_id, String user_id, Date order_date, String order_phone, String shipping_status,
			String order_status) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.order_date = order_date;
		this.order_phone = order_phone;
		this.shipping_status = shipping_status;
		this.order_status = order_status;
	}
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getShipping_status() {
		return shipping_status;
	}
	public void setShipping_status(String shipping_status) {
		this.shipping_status = shipping_status;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
}