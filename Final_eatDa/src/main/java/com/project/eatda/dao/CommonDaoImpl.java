package com.project.eatda.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.eatda.dto.BlogDto;
import com.project.eatda.dto.MbtiDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.RecipeDto;

@Repository
public class CommonDaoImpl implements CommonDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ProductDto> getMarketData() {
		List<ProductDto> list = null;
		
		try {
			list = sqlSession.selectList(COMMON_NAMESPACE+"getMarketData");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<RecipeDto> getRecentRecipe() {
		List<RecipeDto> temp = null;
		List<RecipeDto> list = new ArrayList<RecipeDto>();
		
		try {
			temp = sqlSession.selectList(COMMON_NAMESPACE+"getRecentRecipe");
			
			for (int i = 0; i < 3; i++) {
				list.add(temp.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<MbtiDto> getMbtiProduct(String m_name) {
		List<MbtiDto> list = null;
		
		try {
			list = sqlSession.selectList(COMMON_NAMESPACE+"getMbtiProduct", m_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BlogDto> getPopularBlog() {
		List<BlogDto> list = null;
		
		try {
			list = sqlSession.selectList(COMMON_NAMESPACE+"getPopularBlog");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<RecipeDto> getLovingRecipe() {
		List<RecipeDto> list = null;
		
		try {
			list = sqlSession.selectList(COMMON_NAMESPACE+"getLovingRecipe");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public OrderDto getOrderDto(OrderDto dto) {
		OrderDto order = null;
		
		try {
			order = sqlSession.selectOne(COMMON_NAMESPACE+"getOrderDto", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return order;
	}
	
	
}
