package com.project.eatda.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.eatda.dto.BlogDto;
import com.project.eatda.dto.BlogLikeDto;

@Repository
public class BlogLikeDaoImpl implements BlogLikeDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int count(int blog_no) {
		int likeCount = 0;
		try {
			likeCount = sqlSession.selectOne(BLOGLIKE_NAMESPACE+"countLike", blog_no);
			System.out.println("like count dao!");
		} catch (Exception e) {
			System.out.println("[error] like count dao");
			e.printStackTrace();
		}
		return likeCount;
	}

	@Override
	public int clickLike(BlogDto blogDto, BlogLikeDto like) {
		int res = 0;
		try {
			BlogLikeDto dto = sqlSession.selectOne(BLOGLIKE_NAMESPACE+"flagLikeUser",like);
			if (dto == null) {
				//if(dto.getUser_id() != blogDto.getUser_id() && dto.getBlog_no() != blogDto.getBlog_no()) {
				res += sqlSession.update(BLOGLIKE_NAMESPACE+"clickLike",blogDto);
				res += sqlSession.insert(BLOGLIKE_NAMESPACE+"insertBlogLikeUser",like); 
				//}
			}
			System.out.println("click like dao! : "+ res);
		} catch (Exception e) {
			System.out.println("[error] click like dao");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int clickUnLike(BlogDto blogDto, BlogLikeDto like) {
		int res = 0;
		try {
			res += sqlSession.update(BLOGLIKE_NAMESPACE+"clickLike",blogDto);
			res += sqlSession.delete(BLOGLIKE_NAMESPACE+"deleteBlogLikeUser",like);
			System.out.println("unclick like dao!");
		} catch (Exception e) {
			System.out.println("[error] unclick like dao");
			e.printStackTrace();
		} 
		return res;
	}
	

}
