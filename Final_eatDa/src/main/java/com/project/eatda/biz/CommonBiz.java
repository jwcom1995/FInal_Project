package com.project.eatda.biz;

import java.util.List;

import com.project.eatda.dto.BlogDto;
import com.project.eatda.dto.MbtiDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.RecipeDto;

public interface CommonBiz {
	
	public List<ProductDto> getMarketData();
	
	public List<RecipeDto> getRecentRecipe();
	public List<RecipeDto> getLovingRecipe();
	
	public List<MbtiDto> getMbtiProduct(String m_name);
	
	public List<BlogDto> getPopularBlog();
	public OrderDto getOrderDto(OrderDto dto);

}
