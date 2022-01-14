package com.project.eatda.dto;

import java.util.Date;
import org.springframework.stereotype.Component;

@Component
public class RecipeDto {

	private int recipe_no;
	private String recipe_title;
	private String recipe_category;
	private String recipe_content;
	private String recipe_count;
	private String recipe_img;
	private String recipe_enabled;
	private Date regdate;
	private String r_short_desc;

	public RecipeDto() {
		super();
	}

	public RecipeDto(int recipe_no, String recipe_title, String recipe_category, String recipe_content,
			String recipe_count, String recipe_img, String recipe_enabled, Date regdate, String r_short_desc) {
		super();
		this.recipe_no = recipe_no;
		this.recipe_title = recipe_title;
		this.recipe_category = recipe_category;
		this.recipe_content = recipe_content;
		this.recipe_count = recipe_count;
		this.recipe_img = recipe_img;
		this.recipe_enabled = recipe_enabled;
		this.regdate = regdate;
		this.r_short_desc = r_short_desc;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	public String getRecipe_title() {
		return recipe_title;
	}

	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}

	public String getRecipe_category() {
		return recipe_category;
	}

	public void setRecipe_category(String recipe_category) {
		this.recipe_category = recipe_category;
	}

	public String getRecipe_content() {
		return recipe_content;
	}

	public void setRecipe_content(String recipe_content) {
		this.recipe_content = recipe_content;
	}

	public String getRecipe_count() {
		return recipe_count;
	}

	public void setRecipe_count(String recipe_count) {
		this.recipe_count = recipe_count;
	}

	public String getRecipe_img() {
		return recipe_img;
	}

	public void setRecipe_img(String recipe_img) {
		this.recipe_img = recipe_img;
	}

	public String getRecipe_enabled() {
		return recipe_enabled;
	}

	public void setRecipe_enabled(String recipe_enabled) {
		this.recipe_enabled = recipe_enabled;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getR_short_desc() {
		return r_short_desc;
	}

	public void setR_short_desc(String r_short_desc) {
		this.r_short_desc = r_short_desc;
	}

	@Override
	public String toString() {
		return "RecipeDto [recipe_no=" + recipe_no + ", recipe_title=" + recipe_title + ", recipe_category="
				+ recipe_category + ", recipe_content=" + recipe_content + ", recipe_count=" + recipe_count
				+ ", recipe_img=" + recipe_img + ", recipe_enabled=" + recipe_enabled + ", regdate=" + regdate
				+ ", r_short_desc=" + r_short_desc + "]";
	}

}
