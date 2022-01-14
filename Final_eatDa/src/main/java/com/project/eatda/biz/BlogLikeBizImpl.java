package com.project.eatda.biz;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.eatda.dao.BlogLikeDao;
import com.project.eatda.dto.BlogDto;
import com.project.eatda.dto.BlogLikeDto;

@Service
public class BlogLikeBizImpl implements BlogLikeBiz{
	
	@Autowired
	private BlogLikeDao likeDao;

	@Override
	public int count(int blog_no) {
		return likeDao.count(blog_no);
	}
	
	@Override
	public int clickLike(BlogDto blogDto, BlogLikeDto like) {
		return likeDao.clickLike(blogDto, like);
	}

	@Override
	public int clickUnLike(BlogDto blogDto, BlogLikeDto like) {
		return likeDao.clickUnLike(blogDto, like);
	}
	
	
}
