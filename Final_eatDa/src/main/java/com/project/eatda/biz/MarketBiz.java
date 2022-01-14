package com.project.eatda.biz;

import java.util.List;

import com.project.eatda.dto.CartProductDto;
import com.project.eatda.dto.CouponDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.OrderProductDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.ProductLikeDto;
import com.project.eatda.dto.ReviewDto;

public interface MarketBiz {

	public List<ProductDto> takeProductList();

	public int paging();

	public List<ProductDto> likeProductList(String user_id);

	public List<ProductDto> hashTagSearch(String tagName);

	public List<ProductDto> searchKeyword(String tagName);

	public ProductDto getProduct(String p_id);

	public int putShoppingBag(CartProductDto cpDto);

	public List<ReviewDto> getReview(String p_id);

	public int likeProductInsert(ProductLikeDto dto);

	public int deleteProductLike(ProductLikeDto dto);

	public List<CartProductDto> getCartList(String user_id);

	public int deleteProductBag(List<String> list);

	public List<CouponDto> getCouponList(String user_id);

	public int paySuccess(OrderDto order);

	public OrderDto getOrder(String user_id);

	public int deleteCartList(String user_id);

	public int deleteCoupon(OrderDto dto);

	public int insertOrderProduct(List<OrderProductDto> list);

	public int updateCartList(List<CartProductDto> list);

	public List<OrderProductDto> getOrderList(String order_id);

	public List<CartProductDto> directPurchase(CartProductDto dto);
	
	public List<CartProductDto> getSubCartList(String user_id);
}
