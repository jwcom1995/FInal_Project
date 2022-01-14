package com.project.eatda.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.eatda.dao.MarketDao;
import com.project.eatda.dto.CartProductDto;
import com.project.eatda.dto.CouponDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.OrderProductDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.ProductLikeDto;
import com.project.eatda.dto.ReviewDto;

@Service
public class MarketBizImpl implements MarketBiz {

	@Autowired
	private MarketDao marketDao;

	@Override
	public List<ProductDto> takeProductList() {
		return marketDao.takeProductList();
	}

	@Override
	public int paging() {
		return marketDao.paging();
	}

	@Override
	public List<ProductDto> likeProductList(String user_id) {
		return marketDao.likeProductList(user_id);
	}

	@Override
	public List<ProductDto> hashTagSearch(String tagName) {
		return marketDao.hashTagSearch(tagName);
	}

	@Override
	public ProductDto getProduct(String p_id) {
		return marketDao.getProduct(p_id);
	}

	@Override
	public List<ProductDto> searchKeyword(String tagName) {
		return marketDao.searchKeyword(tagName);
	}

	@Override
	@Transactional
	public int putShoppingBag(CartProductDto dto) {
		int res = marketDao.putShoppingBag(dto);

		return res;
	}

	@Override
	public List<ReviewDto> getReview(String p_id) {
		return marketDao.getReview(p_id);
	}

	@Override
	@Transactional
	public int likeProductInsert(ProductLikeDto dto) {
		int res = marketDao.likeProductInsert(dto);
		return res;
	}

	@Override
	@Transactional
	public int deleteProductLike(ProductLikeDto dto) {
		int res = marketDao.deleteProductLike(dto);
		return res;
	}

	@Override
	public List<CartProductDto> getCartList(String user_id) {
		return marketDao.getCartList(user_id);
	}

	@Override
	public int deleteProductBag(List<String> list) {
		int res = marketDao.deleteProductBag(list);
		return res;
	}

	@Override
	public List<CouponDto> getCouponList(String user_id) {
		return marketDao.getCouponList(user_id);
	}

	@Override
	@Transactional
	public int paySuccess(OrderDto order) {
		int res = marketDao.paySuccess(order);
		return res;
	}

	@Override
	public OrderDto getOrder(String user_id) {
		return marketDao.getOrder(user_id);
	}

	@Override
	@Transactional
	public int deleteCartList(String user_id) {
		return marketDao.deleteCartList(user_id);
	}

	@Override
	@Transactional
	public int deleteCoupon(OrderDto dto) {
		return marketDao.deleteCoupon(dto);
	}

	@Override
	@Transactional
	public int insertOrderProduct(List<OrderProductDto> list) {
		return marketDao.insertOrderProduct(list);
	}

	@Override
	@Transactional
	public int updateCartList(List<CartProductDto> list) {
		return marketDao.updateCartList(list);
	}

	@Override
	public List<OrderProductDto> getOrderList(String order_id) {
		return marketDao.getOrderList(order_id);
	}

	@Override
	@Transactional
	public List<CartProductDto> directPurchase(CartProductDto dto) {
		return marketDao.directPurchase(dto);
	}

	@Override
	public List<CartProductDto> getSubCartList(String user_id) {
		return marketDao.getSubCartList(user_id);
	}
}
