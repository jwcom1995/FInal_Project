package com.project.eatda.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.eatda.dao.CommonDao;
import com.project.eatda.dto.BlogDto;
import com.project.eatda.dto.MbtiDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.RecipeDto;

@Service
public class CommonBizImpl implements CommonBiz{
	
	@Autowired
	public CommonDao dao;

	@Override
	public List<ProductDto> getMarketData() {
		return dao.getMarketData();
	}

	@Override
	public List<RecipeDto> getRecentRecipe() {
		return dao.getRecentRecipe();
	}

	@Override
	public List<MbtiDto> getMbtiProduct(String m_name) {
		return dao.getMbtiProduct(m_name);
	}

	@Override
	public List<BlogDto> getPopularBlog() {
		return dao.getPopularBlog();
	}

	@Override
	public List<RecipeDto> getLovingRecipe() {
		return dao.getLovingRecipe();
	}

	@Override
	public OrderDto getOrderDto(OrderDto dto) {
		return dao.getOrderDto(dto);
	}
	
}
