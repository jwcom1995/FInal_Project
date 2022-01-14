package com.project.eatda.dao;

import java.util.List;

import com.project.eatda.dto.BlogDto;
import com.project.eatda.dto.MbtiDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.RecipeDto;

public interface CommonDao {
	String COMMON_NAMESPACE = "common.";
	
	public List<ProductDto> getMarketData();
	
	public List<RecipeDto> getRecentRecipe();
	
	public List<MbtiDto> getMbtiProduct(String m_name);
	
	public List<BlogDto> getPopularBlog();
	
	public List<RecipeDto> getLovingRecipe();
	public OrderDto getOrderDto(OrderDto dto);
}
