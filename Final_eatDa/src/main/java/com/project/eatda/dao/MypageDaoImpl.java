package com.project.eatda.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.introspect.AnnotatedParameter;
import org.springframework.stereotype.Repository;

import com.project.eatda.dto.BlogDto;
import com.project.eatda.dto.CouponDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.OrderProductDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.ReviewDto;
import com.project.eatda.dto.SubscriptionDto;

@Repository
public class MypageDaoImpl implements MypageDao{

	@Inject
	SqlSession sqlSession;

	//구독내역
	@Override
	public SubscriptionDto subscriptionList(SubscriptionDto dto) {
		SubscriptionDto dto2 = null;
		
		try {
			dto2 = sqlSession.selectOne(NAMESPACE_MYPAGE + "subscriptionList", dto);
		} catch (Exception e) {
			System.out.println("subscriptionList Dao ERROR");
			e.printStackTrace();
		}
		
		return dto2;
	} 
	
	//배송예정상품
	@Override
	public List<ProductDto> deliveryProduct() {
		List<ProductDto> temp = null;
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			temp = sqlSession.selectList(NAMESPACE_MYPAGE + "deliveryProduct");
			
			for(int i=0; i<1; i++) {
				list.add(temp.get(i));
			}
			
		} catch (Exception e) {
			System.out.println("deliveryProduct Dao ERROR");
			e.printStackTrace();
		}
		return list;
	}
	
	//대체상품
	@Override
	public List<ProductDto> getMarketProduct() {
		List<ProductDto> temp = null;
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			temp = sqlSession.selectList(NAMESPACE_MYPAGE + "getMarketProduct");
			
			for(int i=0; i<3; i++) {
				list.add(temp.get(i));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	//쿠폰함
	@Override
	public List<CouponDto> couponList(CouponDto dto) {
		List<CouponDto> list = new ArrayList<CouponDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE_MYPAGE + "couponList", dto);
		} catch (Exception e) {
			System.out.println("couponList Dao ERROR");
			e.printStackTrace();
		}
		
		return list;
		
	}

	//블로그 찜
	@Override
	public List<BlogDto> blogLikeList(String user_id) {
		List<BlogDto> blogList = null;
		
		try {
			blogList = sqlSession.selectList(NAMESPACE_MYPAGE + "blogLikeList", user_id);
		} catch (Exception e) {
			System.out.println("blogLikeList Dao ERROR");
			e.printStackTrace();
		}
		return blogList;
	}

	//주문한 상품
	@Override
	public List<OrderProductDto> marketOrderList(String user_id) {
		List<OrderProductDto> orderList = null;
		
		try {
			orderList = sqlSession.selectList(NAMESPACE_MYPAGE + "marketOrderList", user_id);
		} catch (Exception e) {
			System.out.println("marketOrderList Dao ERROR");
			e.printStackTrace();
		}
		
		return orderList;
	}
	
	//주문내역
	@Override
	public List<OrderDto> marketOrderList2(OrderDto dto) {
		List<OrderDto> orderList = new ArrayList<OrderDto>();
		
		try {
			orderList = sqlSession.selectList(NAMESPACE_MYPAGE + "marketOrderList2", dto);
		} catch (Exception e) {
			System.out.println("marketOrderList2 Dao ERROR");
			e.printStackTrace();
		} 
		return orderList;
	}

	//리뷰작성
	@Override
	public int registReview(ReviewDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE_MYPAGE + "registReview", dto);
		} catch (Exception e) {
			System.out.println("registReview Dao ERROR");
			e.printStackTrace();
		}
		return res;
	}

	





	
}
