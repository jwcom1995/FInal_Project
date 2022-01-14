package com.project.eatda.dto;

import org.springframework.stereotype.Component;

@Component
public class RecipePageBaseDto {
	private int pageNum;	//페이지번호
	private int amount;		//페이지당 게시물 갯수
	
	//검색에 필요한 키워드
	private String searchType; 
	private String keyword;
	
	//카테고리에 필요한 키워드
	private String category;
	
	public RecipePageBaseDto() {
		this(1, 9); //입력값 없을때 기준값
	}

	public RecipePageBaseDto(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	
	
	
}
