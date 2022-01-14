package com.project.eatda.dto;

import org.springframework.stereotype.Component;

@Component
public class SubscriptionDto {
	private String subscription_id;
	private String user_id;
	private String subscription_title;
	private int subscription_price;
	private String subscription_type;
	private String subscription_term;
	
	public SubscriptionDto() {
		super();
	}

	public SubscriptionDto(String subscription_id, String user_id, String subscription_title, int subscription_price,
			String subscription_type, String subscription_term) {
		super();
		this.subscription_id = subscription_id;
		this.user_id = user_id;
		this.subscription_title = subscription_title;
		this.subscription_price = subscription_price;
		this.subscription_type = subscription_type;
		this.subscription_term = subscription_term;
	}

	public String getSubscription_id() {
		return subscription_id;
	}

	public void setSubscription_id(String subscription_id) {
		this.subscription_id = subscription_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSubscription_title() {
		return subscription_title;
	}

	public void setSubscription_title(String subscription_title) {
		this.subscription_title = subscription_title;
	}

	public int getSubscription_price() {
		return subscription_price;
	}

	public void setSubscription_price(int subscription_price) {
		this.subscription_price = subscription_price;
	}

	public String getSubscription_type() {
		return subscription_type;
	}

	public void setSubscription_type(String subscription_type) {
		this.subscription_type = subscription_type;
	}

	public String getSubscription_term() {
		return subscription_term;
	}

	public void setSubscription_term(String subscription_term) {
		this.subscription_term = subscription_term;
	}

	@Override
	public String toString() {
		return "SubscriptionDto [subscription_id=" + subscription_id + ", user_id=" + user_id + ", subscription_title="
				+ subscription_title + ", subscription_price=" + subscription_price + ", subscription_type="
				+ subscription_type + ", subscription_term=" + subscription_term + "]";
	}

	
	
}
