package com.project.eatda.dto;

import org.springframework.stereotype.Component;

@Component
public class MbtiDto {
	private String m_name;
	private String m_content;
	private String p_id;
	private String p_name;
	private String p_short_desc;
	private String p_description;
	private String img_path;
	private int p_price;

	public MbtiDto() {
		super();
	}

	public MbtiDto(String m_name, String m_content, String p_id, String p_name, String p_short_desc,
			String p_description, String img_path, int p_price) {
		super();
		this.m_name = m_name;
		this.m_content = m_content;
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_short_desc = p_short_desc;
		this.p_description = p_description;
		this.img_path = img_path;
		this.p_price = p_price;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_content() {
		return m_content;
	}

	public void setM_content(String m_content) {
		this.m_content = m_content;
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

	public String getP_description() {
		return p_description;
	}

	public void setP_description(String p_description) {
		this.p_description = p_description;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	@Override
	public String toString() {
		return "MbtiDto [m_name=" + m_name + ", m_content=" + m_content + ", p_id=" + p_id + ", p_name=" + p_name
				+ ", p_short_desc=" + p_short_desc + ", p_description=" + p_description + ", img_path=" + img_path
				+ ", p_price=" + p_price + "]";
	}

}
