package com.project.eatda.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.eatda.biz.AdminBiz;
import com.project.eatda.biz.MarketBiz;
import com.project.eatda.dto.CartProductDto;
import com.project.eatda.dto.CouponDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.OrderProductDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.ProductLikeDto;
import com.project.eatda.dto.ReviewDto;
import com.project.eatda.dto.UserDto;

@Controller
public class MarketController {
	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);
	
	@Autowired
	private MarketBiz marketBiz;
	
	@Autowired
	private AdminBiz adminBiz;
	
	@RequestMapping(value="/product.do", method=RequestMethod.POST)
	@ResponseBody
	public List<ProductDto> takeProductList(@RequestBody String num) {
		logger.info("takeProductList");
		List<ProductDto> list = marketBiz.takeProductList();
		
		return list;
	}
	
	@RequestMapping(value="/paging.do", method=RequestMethod.POST) 
	@ResponseBody
	public List<Integer> paging() {
		logger.info("paging");
		
		int count = marketBiz.paging();
		List<Integer> list = new ArrayList<Integer>();
		list.add(count);
		
		return list;
	}
	
	@RequestMapping(value="/likeProduct-main.do", method=RequestMethod.POST)
	@ResponseBody
	public List<ProductDto> likeProductList(HttpServletRequest request) {
		logger.info("likeProductList");
		List<ProductDto> list = marketBiz.likeProductList(getLoginUser(request).getUser_id());
		return list;
	}
	
	@RequestMapping(value="/hashTagSearch.do", method=RequestMethod.POST)
	@ResponseBody
	public List<ProductDto> hashTagSearch(@RequestBody String tagname) {
		logger.info("hashTagSearch, tagName : " + tagname);
		String hashTag = tagname.substring(1, tagname.length()-1);
		
		List<ProductDto> list = marketBiz.hashTagSearch(hashTag);
		return list;
	}
	
	@RequestMapping(value="/searching.do", method=RequestMethod.POST)
	@ResponseBody
	public List<ProductDto> searchKeyword(@RequestBody String tagname) {
		logger.info("hashTagSearch, tagName : " + tagname);
		String hashTag = tagname.substring(1, tagname.length()-1);
		
		List<ProductDto> list = marketBiz.searchKeyword(hashTag);
		return list;
	}
	
	
	@RequestMapping(value="/goProductPage.do", method=RequestMethod.GET)
	public String goProductPage(Model model, String p_id) {
		logger.info("goProductPage, p_id : " + p_id);
		ProductDto dto = marketBiz.getProduct(p_id);
		model.addAttribute("product",dto);
		
		List<ReviewDto> list = marketBiz.getReview(p_id);
		model.addAttribute("list",list);
		
		return "/market/marketPage";
	}
	
	@RequestMapping(value="/putShoppingBag.do", method=RequestMethod.POST)
	@ResponseBody
	public String putShoppingBag(@RequestBody String data, HttpServletRequest request) {
		logger.info("putShoppingBag, data : " + data);
		String[] sArr = data.split(",");
		
		String p_id = sArr[0].substring(9, sArr[0].length()-1);;
		int p_price = 0;
		int quantity = 1;
		
		if (sArr.length == 2) {
			p_price = Integer.parseInt(sArr[1].substring(11, sArr[1].length()-2));
			
		} else if (sArr.length == 3) {
			p_price = Integer.parseInt(sArr[1].substring(10, sArr[1].length()));
			quantity = Integer.parseInt(sArr[2].substring(12,sArr[2].length()-2));
			
		}
		
		CartProductDto cpDto = new CartProductDto(getLoginUser(request).getUser_id(),p_id,quantity,p_price,null,null, "NORMAL");
		int res = marketBiz.putShoppingBag(cpDto);
		
		return res > 0? "true":"false";
	}
	
	@RequestMapping("/marketMain.do")
	public String goMarketMain(Model model) {
		logger.info("Market Main Page");
		return "/market/marketMain";
	}
	
	
	@RequestMapping(value="/likeProductInsert.do", method=RequestMethod.POST)
	@ResponseBody
	public String likeProductInsert(@RequestBody String p_id, HttpServletRequest request) {
		logger.info("likeProductInsert, p_id : " + p_id);
		
		int res = marketBiz.likeProductInsert(new ProductLikeDto(getLoginUser(request).getUser_id(), p_id.substring(0,p_id.length()-1)));
		return res > 0 ? "true":"false";
	}
	
	@RequestMapping(value="/deleteProductLike.do", method=RequestMethod.POST)
	@ResponseBody
	public String deleteProductLike(@RequestBody String p_id, HttpServletRequest request) {
		logger.info("deleteProductLike, p_id : " + p_id);
		
		int res = marketBiz.deleteProductLike(new ProductLikeDto(getLoginUser(request).getUser_id(), p_id.substring(0,p_id.length()-1)));
		return res > 0 ? "true":"false";
	}
	
	@RequestMapping("/goShoppingBag.do")
	public String goShoppingBag(Model model, HttpServletRequest request) {
		logger.info("goShoppingBag");
		List<CartProductDto> cart = marketBiz.getCartList(getLoginUser(request).getUser_id());
		
		model.addAttribute("list", cart);
		return "/market/shoppingBag";
	}
	
	@RequestMapping(value="/deleteProductBag.do", method=RequestMethod.POST)
	@ResponseBody
	public String deleteProductBag(@RequestBody String data, HttpServletRequest request) {
		logger.info("deleteProductLike, p_id : " + data);
		int res = marketBiz.deleteProductBag(convertList(data, request));
		
		return res>0?"true":"false";
	}
	
	@RequestMapping(value="/directPurchase.do", method=RequestMethod.POST)
	@ResponseBody
	public String directPurchase(@RequestBody String data, HttpServletRequest request) {
		logger.info("directPurchase, product : " + data);
		CartProductDto dto = convertCartProduct(data);
		dto.setUser_id(getLoginUser(request).getUser_id());
		int res = marketBiz.putShoppingBag(dto);
		return res>0?"true":"false";
	}
	
	@RequestMapping(value="/updateCartList.do", method=RequestMethod.POST)
	@ResponseBody
	public String updateCartList(@RequestBody String data, HttpServletRequest request) {
		logger.info("updateCartList, product : " + data);
		List<CartProductDto> list = convertCartList(data, getLoginUser(request).getUser_id());
		int res = marketBiz.updateCartList(list);
		
		return res>0?"true":"false";
	}
	@RequestMapping(value="/getCartProduct.do", method=RequestMethod.GET)
	@ResponseBody
	public List<CartProductDto> getCartProduct(String command, HttpServletRequest request) {
		logger.info("getCartProduct, product : " + command);
		List<CartProductDto> list = null;
		
		if (command.equals("NORMAL")) {
			list = marketBiz.getCartList(getLoginUser(request).getUser_id());
		} else if (command.equals("SUBSCRIPTION")) {
			list = marketBiz.getSubCartList(getLoginUser(request).getUser_id());
		}
		return list;
	}
	
	public List<CartProductDto> convertCartList(String data, String user_id) {
		String[] temp = data.split("},");
		List<CartProductDto> list = new ArrayList<CartProductDto>();
		
		for(int i = 0; i < temp.length; i++) {
			String[] array = temp[i].split(",");
			String p_price = null;
			String p_id = null;
			int quantity = 0;
			
			if (temp.length != 1) {
				p_id = array[0].substring(9, array[0].length()-1);
				p_price = array[2].substring(9, array[2].length()-1);
				quantity = Integer.parseInt(array[1].substring(12, array[1].length()-1)); 
				
				if (i == 0) {
					p_id = array[0].substring(10, array[0].length()-1);
				} else if (i == temp.length-1) {
					p_price = array[2].substring(9, array[2].length()-3);
				}
			} else if (temp.length == 1) {
				p_id = array[0].substring(10, array[0].length()-1);
				p_price = array[2].substring(9, array[2].length()-3);
				quantity = Integer.parseInt(array[1].substring(12, array[1].length()-1));
			}
			
			list.add(new CartProductDto(user_id, p_id, quantity, Integer.parseInt(p_price), null, null, "NORMAL"));
		}
		return list;
	}
	
	
	@RequestMapping("/makeOrder.do")
	public String makeOrder(Model model, HttpServletRequest request, String p_id, String quantity, String price) {
		logger.info("makeOrder, p_id : " + p_id + ", quantity : " + quantity + ", p_price : " + price);
		List<CartProductDto> cart = null;
		
		if (p_id == null) {
			cart = marketBiz.getCartList(getLoginUser(request).getUser_id());
		} else {
			CartProductDto cp = new CartProductDto(getLoginUser(request).getUser_id(),p_id, Integer.parseInt(quantity), Integer.parseInt(price), null, null, "NORMAL");
			cart = marketBiz.directPurchase(cp);
			
			while(true) {
				List<CartProductDto> temp = marketBiz.getCartList(getLoginUser(request).getUser_id());
				if (temp.get(0).getP_id().equals(cp.getP_id())) {break;}
			}
		}
		
		model.addAttribute("list", cart);
		return "/market/payment";
	}

	@RequestMapping(value="/getUserInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public UserDto getUserInfo(HttpServletRequest request) {
		logger.info("getUserInfo");
		UserDto dto = (UserDto)request.getSession().getAttribute("member");
		return dto;
	}
	
	@RequestMapping(value="/getCouponList.do", method=RequestMethod.POST)
	@ResponseBody
	public List<CouponDto> getCouponList(HttpServletRequest request) {
		logger.info("getCouponList");
		UserDto user = getLoginUser(request);
		
		List<CouponDto> list = marketBiz.getCouponList(user.getUser_id());
		
		return list;
	}
	
	@RequestMapping(value="/paySuccess.do", method=RequestMethod.POST)
	@ResponseBody
	public String paySuccess(HttpServletRequest request, @RequestBody String data) {
		logger.info("paySuccess, data: " + data);
		OrderDto order = convertOrder(data, getLoginUser(request).getUser_id());
		
		int res = marketBiz.paySuccess(order); //insert (order insert)
		res += insertOrderProduct(order.getOrder_id(), marketBiz.getCartList(getLoginUser(request).getUser_id())); //order product insert
		
		if(res != 0) {
			System.out.println(order.getPay_option());
			if(order.getPay_option().equals("무통장")) {
				System.out.println("무통장.");
				int rest = adminBiz.adminOrderInsert(order);
			}else {
				System.out.println("다른결제.");
				int rest = adminBiz.adminOrderInsert2(order);
			}
		}
		
		return res>0?"true":"false";
	}
	
	
	@RequestMapping("/orderSuccess.do")
	public String orderSuccess(Model model, HttpServletRequest request, String order_id) {
		logger.info("orderSuccess.do, order_id : " + order_id);
		while(true) {
			String chk_order = marketBiz.getOrder(getLoginUser(request).getUser_id()).getOrder_id();
			if (order_id.equals(chk_order)) { break; }
		}
		
		return "redirect:successDirect.do?user_id="+getLoginUser(request).getUser_id();
	}
	
	@RequestMapping("/successDirect.do")
	public String successDirect(Model model, String user_id) {
		logger.info("successDirect.do, user_id : " + user_id);
		OrderDto order = marketBiz.getOrder(user_id);
		model.addAttribute("order", order);
		
		return "/market/orderSuccess";
	}
	
	@RequestMapping(value="/getOrderList.do", method=RequestMethod.GET)
	@ResponseBody
	public List<OrderProductDto> getOrderList(HttpServletRequest request, String order_id) {
		logger.info("getOrderList, order_id: " + order_id);
		List<OrderProductDto> order_list = marketBiz.getOrderList(order_id);
		return order_list;
	}
	
	@RequestMapping(value="/deleteCartList.do", method=RequestMethod.POST)
	@ResponseBody
	public String deleteCartList(HttpServletRequest request) {
		logger.info("deleteCartList");
		int res = marketBiz.deleteCartList(getLoginUser(request).getUser_id());
		return res>0?"true":"false";
	}
	
	@RequestMapping(value="/deleteCoupon.do", method=RequestMethod.POST)
	@ResponseBody
	public String deleteCoupon(HttpServletRequest request, @RequestBody String data) {
		logger.info("deleteCoupon, data : " + data);
		
		OrderDto dto = new OrderDto();
		dto.setCoupon_id(data.substring(14,data.length()-2));
		dto.setUser_id(getLoginUser(request).getUser_id());
		
		int res = marketBiz.deleteCoupon(dto);
		
		return res>0?"true":"false";
	}
	
	public int insertOrderProduct(String order_id, List<CartProductDto> list) {
		List<OrderProductDto> opList = new ArrayList<OrderProductDto>();
		int res = 0;
		
		for (int i = 0; i < list.size(); i++) {
			OrderProductDto dto = new OrderProductDto(order_id, list.get(i).getP_id(), list.get(i).getCart_count(), list.get(i).getCart_price(),null,null);
			opList.add(dto);
		}
		
		res = marketBiz.insertOrderProduct(opList);
		
		return res;
		
	}
	
	public CartProductDto convertCartProduct(String data) {
		String[] temp = data.split(",");
		CartProductDto dto = new CartProductDto();
		
		dto.setP_name(temp[0].substring(11,temp[0].length()-1));
		dto.setImg_path(temp[1].substring(12, temp[1].length()-1));
		dto.setCart_price(Integer.parseInt(temp[2].substring(11, temp[2].length()-1)));
		dto.setCart_count(Integer.parseInt(temp[3].substring(12, temp[3].length()-1)));
		dto.setP_id(temp[4].substring(8, temp[4].length()-2));
		
		return dto;
	}
	
	public UserDto getLoginUser(HttpServletRequest request) {
		UserDto dto = (UserDto)request.getSession().getAttribute("member");
		return dto;
	}
	
	public OrderDto convertOrder(String data, String user_id) {
		OrderDto order = new OrderDto();
		String[] temp = data.split(",");
		String pay_option = temp[5].substring(17, temp[5].length()-1);
		
		order.setUser_id(user_id);
		order.setOrder_id(temp[0].substring(15, temp[0].length()-1));
		order.setOrder_name(temp[1].substring(14, temp[1].length()-1));
		order.setOrder_phone(temp[3].substring(13, temp[3].length()-1));
		order.setOrder_addr(temp[4].substring(14, temp[4].length()-1));
		order.setPay_option(getPayOption(pay_option));
		order.setOrder_price(Integer.parseInt(temp[6].substring(15, temp[6].length()-1)));
		order.setOriginal_price(Integer.parseInt(temp[7].substring(18, temp[7].length()-1)));
		order.setDiscount_price(Integer.parseInt(temp[8].substring(18, temp[8].length()-1)));
		order.setCoupon_rate(Double.parseDouble(temp[9].substring(15, temp[9].length()-1)));
		order.setOrder_message(temp[10].substring(17, temp[10].length()-1));
		order.setCoupon_id(temp[11].substring(13, temp[11].length()-2));
		order.setOrder_date(new Date());
		
		return order;
	}
	
	public String getPayOption(String pay_option) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("basic", "무통장");
		map.put("kcp", "카드");
		map.put("kakaopay", "카카오페이");
		map.put("smile", "스마일페이");
		
		return map.get(pay_option);
	}
	
	
	public List<String> convertList(String data, HttpServletRequest request) {
		List<String> list = new ArrayList<String>();
		String temp = data.substring(10, data.length()-2);
		String[] sarr = temp.split(",");
		
		for (int i = 0; i < sarr.length; i++) {
			list.add(sarr[i].substring(1, sarr[i].length()-1));
		}
		list.add(getLoginUser(request).getUser_id());
		
		return list;
	}
	
	public Map<String, CouponDto> convertMap(List<CouponDto> list) {
		Map<String, CouponDto> map = new HashMap<String, CouponDto>();
		
		for (int i = 0; i < list.size(); i++) {
			map.put(list.get(i).getCoupon_id(), list.get(i));
		}
		return map;
	}
}
