package com.project.eatda.dto;

import org.springframework.stereotype.Component;

@Component
public class CouponDto {
	private String coupon_id;
	private String user_id;
	private String coupon_name;
	private String coupon_des;
	private double coupon_rate;
	private int coupon_term;

	public CouponDto() {
		super();
	}

	public CouponDto(String coupon_id, String user_id, String coupon_name, String coupon_des, double coupon_rate,
			int coupon_term) {
		super();
		this.coupon_id = coupon_id;
		this.user_id = user_id;
		this.coupon_name = coupon_name;
		this.coupon_des = coupon_des;
		this.coupon_rate = coupon_rate;
		this.coupon_term = coupon_term;
	}

	public String getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(String coupon_id) {
		this.coupon_id = coupon_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public String getCoupon_des() {
		return coupon_des;
	}

	public void setCoupon_des(String coupon_des) {
		this.coupon_des = coupon_des;
	}

	public double getCoupon_rate() {
		return coupon_rate;
	}

	public void setCoupon_rate(double coupon_rate) {
		this.coupon_rate = coupon_rate;
	}

	public int getCoupon_term() {
		return coupon_term;
	}

	public void setCoupon_term(int coupon_term) {
		this.coupon_term = coupon_term;
	}

	@Override
	public String toString() {
		return "CouponDto [coupon_id=" + coupon_id + ", user_id=" + user_id + ", coupon_name=" + coupon_name
				+ ", coupon_des=" + coupon_des + ", coupon_rate=" + coupon_rate + ", coupon_term=" + coupon_term
				+ "]";
	}

}
