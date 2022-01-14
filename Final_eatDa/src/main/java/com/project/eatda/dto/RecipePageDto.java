package com.project.eatda.dto;

import org.springframework.stereotype.Component;

@Component
public class RecipePageDto {
	private int startPage;	//첫페이지
	private int endPage;	//마지막페이지
	private boolean next;	//다음버튼
	private boolean prev;	//이전버튼
	private int total;		//총 게시글 수
	private int pageNum;	//페이지번호 (rpbdto에 존재)
	private int amount;		//페이지당 게시물 갯수(rpbdto 존재)
	
	private RecipePageBaseDto rpbdto;
	
	public RecipePageDto() {
	}

	public RecipePageDto(RecipePageBaseDto rpbdto, int total) {
		this.pageNum = rpbdto.getPageNum();
		this.amount = rpbdto.getAmount();
		this.total = total;
		this.rpbdto = rpbdto;
		
		//(int)Math.ceil(this.pageNum / 페이지당 게시물갯수 ) * 페이지당 게시물갯수
		this.endPage = (int)Math.ceil(this.pageNum / 9.0 ) * 9;
		
		this.startPage = this.endPage - 9 + 1;
		
		int realEnd = (int)Math.ceil( this.total / (double)this.amount );
		
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
	}
	public RecipePageDto(int startPage, int endPage, boolean next, boolean prev, int total, int pageNum, int amount,
			RecipePageBaseDto rpbdto) {
		super();
		this.startPage = startPage;
		this.endPage = endPage;
		this.next = next;
		this.prev = prev;
		this.total = total;
		this.pageNum = pageNum;
		this.amount = amount;
		this.rpbdto = rpbdto;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
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

	public RecipePageBaseDto getRpbdto() {
		return rpbdto;
	}

	public void setRpbdto(RecipePageBaseDto rpbdto) {
		this.rpbdto = rpbdto;
	}
	
	
	
	
}
