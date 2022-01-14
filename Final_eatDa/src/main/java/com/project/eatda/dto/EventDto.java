package com.project.eatda.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class EventDto {
	private int event_no;
	private String event_title;
	private String event_content;
	private String event_img;
	private Date regdate;
	private String status;
	
	public EventDto() {
		super();
	}

	public EventDto(int event_no, String event_title, String event_content, String event_img, Date regdate,String status) {
		super();
		this.event_no = event_no;
		this.event_title = event_title;
		this.event_content = event_content;
		this.event_img = event_img;
		this.regdate = regdate;
		this.status = status;
	}
	
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public String getEvent_img() {
		return event_img;
	}
	public void setEvent_img(String event_img) {
		this.event_img = event_img;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "EventDto [event_no=" + event_no + ", event_title=" + event_title + ", event_content=" + event_content
				+ ", event_img=" + event_img + ", regdate=" + regdate +", status=" + status + "]";
	}
}
