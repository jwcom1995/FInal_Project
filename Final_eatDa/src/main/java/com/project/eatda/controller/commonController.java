package com.project.eatda.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.eatda.biz.CommonBiz;
import com.project.eatda.dto.BlogDto;
import com.project.eatda.dto.MbtiDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.RecipeDto;
import com.project.eatda.dto.UserDto;

@Controller
public class commonController {
	private static final Logger logger = LoggerFactory.getLogger(commonController.class);
	
	@Autowired
	private CommonBiz commonBiz;
	
	@RequestMapping("/index.do")
	public String goIndex() {
		logger.info("Index page");
		return "../../index";
	}
	
	@RequestMapping("/foodbti.do")
	public String goFoodbti() {
		return "/market/foodbti";
	}
	
	@RequestMapping(value="/getMarketData.do", method=RequestMethod.POST) 
	@ResponseBody
	public List<ProductDto> getMarketData() {
		List<ProductDto> tempList = new ArrayList<ProductDto>();
		List<ProductDto> list = commonBiz.getMarketData();
		
		for (int i = 9; i < list.size(); i++) {
			String desc = list.get(i).getP_description();
			String s_desc = list.get(i).getP_short_desc();
			
			if (s_desc.length() > 16) {
				list.get(i).setP_short_desc(s_desc.substring(0,16)+"...");
			}
			
			if (desc.length() > 60) {
				list.get(i).setP_description(desc.substring(0,50)+"...");
			}
			tempList.add(list.get(i));
		}
		return tempList;
	}
	
	@RequestMapping(value="/getRecentRecipe.do", method=RequestMethod.POST) 
	@ResponseBody
	public List<RecipeDto> getRecentRecipe() {
		List<RecipeDto> list = commonBiz.getRecentRecipe();
		
		for (int i = 0; i < list.size(); i++) {
			String temp = list.get(i).getR_short_desc();
			if (temp.length() > 90) {
				list.get(i).setR_short_desc(temp.substring(0, 90)+"...");
			}
		}
		return list;
	}
	
	@RequestMapping(value="/getMbtiProduct.do", method=RequestMethod.GET) 
	@ResponseBody
	public List<MbtiDto> getMbtiProduct(String m_name) {
		List<MbtiDto> list = commonBiz.getMbtiProduct(m_name);
		
		String desc = list.get(0).getP_description();
		
		if (desc.length() > 60) {
			desc = desc.substring(0,57) + "...";
			list.get(0).setP_description(desc);
		}
		
		return list;
	}
	
	@RequestMapping(value="/getPopularBlog.do", method=RequestMethod.POST) 
	@ResponseBody
	public List<BlogDto> getPopularBlog() {
		List<BlogDto> list = commonBiz.getPopularBlog();
		
		for (int i = 0; i < 3; i++) {
			if (list.get(i).getBlog_content().length() > 80) {
				String s = list.get(i).getBlog_content().substring(0, 80) + "....";
				list.get(i).setBlog_content(s);
			}
		}
		return list;
	}
	
	@RequestMapping(value="/getLovingRecipe.do", method=RequestMethod.POST) 
	@ResponseBody
	public List<RecipeDto> getLovingRecipe() {
		List<RecipeDto> list = commonBiz.getLovingRecipe();
		
		for (int i = 0; i < list.size(); i++) {
			String temp = list.get(i).getR_short_desc();
			if (temp.length() > 90) {
				list.get(i).setR_short_desc(temp.substring(0, 90)+"...");
			}
		}
		
		return list;
	}
	
	@RequestMapping("/goOrderSuccess.do")
	public String goOrderSuccess(Model model, String order_id, HttpServletRequest request) {
		logger.info("goOrderSuccess, order_id : " + order_id);
		UserDto user = (UserDto)request.getSession().getAttribute("member");
		OrderDto order = new OrderDto();
		order.setUser_id(user.getUser_id());
		order.setOrder_id(order_id);
		
		OrderDto dto = commonBiz.getOrderDto(order);
		
		model.addAttribute("order", dto);
		return "/market/orderSuccess";
	}
}
