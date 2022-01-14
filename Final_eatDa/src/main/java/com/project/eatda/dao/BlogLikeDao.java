package com.project.eatda.dao;

import com.project.eatda.dto.BlogDto;
import com.project.eatda.dto.BlogLikeDto;

public interface BlogLikeDao {
	
	String BLOGLIKE_NAMESPACE = "like.";
	public int count(int blog_no);
	public int clickLike(BlogDto blogDto, BlogLikeDto like);
	public int clickUnLike(BlogDto blogDto, BlogLikeDto like);
}
