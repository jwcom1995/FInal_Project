package com.project.eatda.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class OrderDto {
	private String order_id;
	private String user_id;
	private Date order_date;
	private String order_addr;
	private String order_name; // 받는사람 이름
	private String order_phone;
	private String order_message; // 배송메세지
	private int order_price; // 최종 결제가
	private String pay_option; // 결제 방법
	private int original_price; // 쿠폰 전 가격
	private int discount_price; // 할인 가격
	private double coupon_rate; // 쿠폰 할인률
	private String coupon_id;
	private String shipping_status;
	private String order_status;

	public OrderDto() {
		super();
	}

	public OrderDto(String order_id, String user_id, Date order_date, String order_addr, String order_name,
			String order_phone, String order_message, int order_price, String pay_option, int original_price,
			int discount_price, double coupon_rate, String coupon_id, String shipping_status, String order_status) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.order_date = order_date;
		this.order_addr = order_addr;
		this.order_name = order_name;
		this.order_phone = order_phone;
		this.order_message = order_message;
		this.order_price = order_price;
		this.pay_option = pay_option;
		this.original_price = original_price;
		this.discount_price = discount_price;
		this.coupon_rate = coupon_rate;
		this.coupon_id = coupon_id;
		this.shipping_status =shipping_status;
		this.order_status =order_status;
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

	public String getOrder_addr() {
		return order_addr;
	}

	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_phone() {
		return order_phone;
	}

	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}

	public String getOrder_message() {
		return order_message;
	}

	public void setOrder_message(String order_message) {
		this.order_message = order_message;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public String getPay_option() {
		return pay_option;
	}

	public void setPay_option(String pay_option) {
		this.pay_option = pay_option;
	}

	public int getOriginal_price() {
		return original_price;
	}

	public void setOriginal_price(int original_price) {
		this.original_price = original_price;
	}

	public int getDiscount_price() {
		return discount_price;
	}

	public void setDiscount_price(int discount_price) {
		this.discount_price = discount_price;
	}

	public double getCoupon_rate() {
		return coupon_rate;
	}

	public void setCoupon_rate(double coupon_rate) {
		this.coupon_rate = coupon_rate;
	}

	public String getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(String coupon_id) {
		this.coupon_id = coupon_id;
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
	

	@Override
	public String toString() {
		return "OrderDto [order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date
				+ ", order_addr=" + order_addr + ", order_name=" + order_name + ", order_phone=" + order_phone
				+ ", order_message=" + order_message + ", order_price=" + order_price + ", pay_option=" + pay_option
				+ ", original_price=" + original_price + ", discount_price=" + discount_price + ", coupon_rate="
				+ coupon_rate + ", coupon_id=" + coupon_id + ", shipping_status=" + shipping_status + ", order_status=" + order_status+ "]";
	}

}
