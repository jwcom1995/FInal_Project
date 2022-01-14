package com.project.eatda.controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubscriptionController {
	
	@RequestMapping("/subMain.do")
    public String subMain() {
        System.out.println("subMain");
        return "/subscription/subscriptionMain";
    }
	@RequestMapping("/subForm.do")
    public String subForm(Model model, String type) {
        System.out.println("subForm");
        
        String str = "";
        String term = "";
        String title = "구독";
        int price=0;
        
        if(type.equals("weekly")) {
        	str ="주간 구독";
        	term = "주간";
        	price=8000;
        }else if(type.equals("monthly")) {
        	str ="월간 구독";
        	term = "월간";
        	price=30000;
        }else {
        	str ="분기 구독";
        	term = "분기";
        	price=89000;
        }
        
        System.out.println(price);
        
        model.addAttribute("type", str);
        model.addAttribute("term", term);
        model.addAttribute("price", price);
        model.addAttribute("title", title);
        
        return "/subscription/subscriptionForm";
    }
	
	@RequestMapping("/subFinish.do")
	public String subFinish(HttpServletRequest httpServletRequest, Model model) {
		System.out.println("subscription list");
		
		// title :"구독"
		String subscription_title = httpServletRequest.getParameter("title");
		// 아이디
		String user_id = httpServletRequest.getParameter("userid");
		// term(주간/월간/분기)
		String subscription_term = httpServletRequest.getParameter("term");
		// price : 가격
		String price = httpServletRequest.getParameter("price");
		// type(일반/제철)
		String[] subscription_type  = httpServletRequest.getParameterValues("chk");
		// 남기는 메세지 값
		String msg = httpServletRequest.getParameter("msg");
		
		model.addAttribute("user_id", user_id);
        model.addAttribute("price", price);
        model.addAttribute("subscription_term", subscription_term);
        model.addAttribute("subscription_type", Arrays.toString(subscription_type));
        model.addAttribute("subscription_title", subscription_title);
        model.addAttribute("msg", msg);
		
		System.out.println(user_id);
		
		System.out.println("chk : "+subscription_type+", msg: "+msg+", price: "+price);
		
		
		return "/subscription/subscriptionPayment";
	}
	

}
