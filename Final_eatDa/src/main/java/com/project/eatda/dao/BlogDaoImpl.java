package com.project.eatda.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.eatda.dto.BlogDto;

@Repository
public class BlogDaoImpl implements BlogDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<BlogDto> takeBlogList(int num) {
		//0 -> 15    13
		//1 -> 12 11 10
		//2 -> 9 8 7
		//3 -> 6 5 4
		//4 -> 3 2 1
		//넘어오는 데이터가 페이지
		List<BlogDto> temp = null;
		List<BlogDto> list = new ArrayList<BlogDto>();
		num = num*3;
		try {
			temp = sqlSession.selectList(BLOG_NAMESPACE+"blogList");
			for (int i = num-3; i < num; i++) {
				list.add(temp.get(i));
			}
		} catch (Exception e) {
			System.out.println("takeBlogList DAO ERROR");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int paging() {
		int blogCount = 0;
		
		try {
			blogCount = sqlSession.selectOne(BLOG_NAMESPACE+"pagingBlog");
		} catch (Exception e) {
			System.out.println("paging DAO ERROR");
			e.printStackTrace();
		}
		
		return blogCount;
	}
	
	@Override
	public List<BlogDto> searchBlog(String keyword){
		List<BlogDto> list = new ArrayList<BlogDto>();
		String makekeyword = "%"+keyword+"%";
		try {
			System.out.println("keyword: " + makekeyword);
			list = sqlSession.selectList(BLOG_NAMESPACE+"searchBlog", makekeyword);
		} catch (Exception e) {
			System.out.println("[error]: search blog");
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public BlogDto selectOne(int blog_no) {
		BlogDto dto = null;
		try {
			dto = sqlSession.selectOne(BLOG_NAMESPACE+"blogDetail",blog_no);
		} catch (Exception e) {
			System.out.println("[error] : blog detail");
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public int insert(BlogDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(BLOG_NAMESPACE+"blogInsert",dto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int update(BlogDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(BLOG_NAMESPACE+"blogUpdate",dto);
			System.out.println("update dao : update blog where blog_no :"+dto.getBlog_no());
		} catch (Exception e) {
			System.out.println("[error] : update");
			e.printStackTrace();
		}
		return res;
	}
	

	@Override
	public int selectBlogNo(String blog_title) {
		BlogDto dto = null;
		try {
			dto = sqlSession.selectOne(BLOG_NAMESPACE+"selectBlogNo",blog_title);
			System.out.println(dto.toString());
		} catch (Exception e) {
			System.out.println("[error] : selectBlogNo");
			e.printStackTrace();
		}
		return dto.getBlog_no();
	}
	
	@Override
	public int delete(int blog_no) {
		int res = 0;
		try {
			res = sqlSession.delete(BLOG_NAMESPACE+"blogDelete",blog_no);
			System.out.println("delete dao : delete blog where blog_no :"+blog_no);
		} catch (Exception e) {
			System.out.println("[error] : delete");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int blogCount(int blog_no) {
		int res = 0;
		
		try {
			res = sqlSession.update(BLOG_NAMESPACE+"blogCount", blog_no);
		} catch (Exception e) {
			System.out.println("error : blog count");
			e.printStackTrace();
		}
		return res;
	}
	
	/* 관리자 블로그 리스트(전체 조회) */
	@Override
	public List<BlogDto> adminBlogList() {
		List<BlogDto> adminBlogList = new ArrayList<BlogDto>();
		try {
			adminBlogList = sqlSession.selectList(BLOG_NAMESPACE+"adminBlogList");
		} catch (Exception e) {
			System.out.println("[error] : admin blog list");
			e.printStackTrace();
		}
		return adminBlogList;
	}

	// 관리자 블로그 삭제
	@Override
	public int adminBlogDelete(int blog_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(BLOG_NAMESPACE+"adminBlogDelete",blog_no);
		} catch (Exception e) {
			System.out.println("[error] : admin blog delete");
			e.printStackTrace();
		}
		return res;
	}
	
	//관리자 블로그 count
	@Override
	public int adminBlogCount() {
		int count = 0;
		
		try {
			count = sqlSession.selectOne(BLOG_NAMESPACE+"adminBlogCount");
			System.out.println(count);
		} catch (Exception e) {
			System.out.println("[error] : admin blog count");
			e.printStackTrace();
		}
		
		return count;
	}
	
	@Override
	public int newAdminBlogCount() {
		int count = 0;
		
		try {
			count = sqlSession.selectOne(BLOG_NAMESPACE+"newAdminBlogCount");
			System.out.println(count);
		} catch (Exception e) {
			System.out.println("[error] : admin blog count");
			e.printStackTrace();
		}
		
		return count;
	}
}
