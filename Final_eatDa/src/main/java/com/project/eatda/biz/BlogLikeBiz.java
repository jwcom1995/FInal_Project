package com.project.eatda.biz;

import com.project.eatda.dto.BlogDto;
import com.project.eatda.dto.BlogLikeDto;

public interface BlogLikeBiz {
	public int count(int blog_no);
	public int clickLike(BlogDto blogDto, BlogLikeDto like);
	public int clickUnLike(BlogDto blogDto, BlogLikeDto like);
}
