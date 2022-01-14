package com.project.eatda.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.eatda.biz.AdminBiz;
import com.project.eatda.biz.BlogBiz;
import com.project.eatda.biz.MemberBiz;
import com.project.eatda.dto.UserDto;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberBiz memberBiz;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BlogBiz blogBiz;
	
	@Autowired
	private AdminBiz adminBiz;
	
	//회원가입 폼
	@RequestMapping("/regist_form.do")
	public String mypageMain() {
		System.out.println("regist_form page");
		return "/login/login_regist_form";
	}
	
	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public int idCheck(UserDto dto) throws Exception{
		System.out.println("id_check");
		int result = memberBiz.idCheck(dto);
		return result;
	}
	
	//이메일 인증
	@ResponseBody
	@RequestMapping(value="/emailCheck.do", method=RequestMethod.GET)
	public String mailCheckGET(String user_email) throws Exception{
		
		//뷰에서 넘어온 데이터 확인
		logger.info("이메일 데이터 전송 확인");
		logger.info("입력된 주소: " + user_email);
		
		//인증번호 난수 생성(범위: 111111~999999)
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호: " + checkNum);
		
		//이메일 보내기
        String toMail = user_email;
        String title = "[EatDa] 회원가입 이메일 인증번호입니다.";
        String content = 
                "EatDa에 방문해주셔서 감사합니다:)" +
                "<br><br>" + 
                "인증번호는 " + checkNum + " 입니다." + 
                "<br>" + 
                "해당 번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            message.setFrom(new InternetAddress("TeamEatDa@gamil.com", "EatDa"));
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
	}
	
	//회원가입
	@RequestMapping(value="/memberRegist.do", method=RequestMethod.POST)
	public String memberRegistPOST(UserDto dto) throws Exception {
		logger.info("memberRegist");
		dto.setUser_img(randomPic());
		memberBiz.memberRegist(dto);
		
		return "../../index";
	}
	
	
	//로그인
	@RequestMapping("/loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute UserDto dto, HttpSession session, Model model) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		UserDto dto2 = memberBiz.loginCheck(dto, session);
		
		if(dto2 != null) {
			if(dto2.getUser_enable().equals("Y")) {
	
				//사용자
				if(dto2.getUser_role().equals("USER")) {
					session.setAttribute("member", dto2);
					session.setAttribute("user_id", dto.getUser_id());
					mav.setViewName("../../index");
					mav.addObject("msg", "success");
				
				//관리자
				}else if(dto2.getUser_role().equals("ADMIN")){
					session.setAttribute("member", dto2);
					
					model.addAttribute("newBlogCount",blogBiz.newAdminBlogCount());
					model.addAttribute("blogCount",blogBiz.adminBlogCount());
					model.addAttribute("newReportCount",adminBiz.newAdminReportCount());
					model.addAttribute("reportCount",adminBiz.adminReportCount());
					model.addAttribute("newUserCount",adminBiz.newAdminUserCount());
					model.addAttribute("userCount",adminBiz.adminUserCount());
					model.addAttribute("newAdminOrderCount",adminBiz.newAdminOrderCount());
					model.addAttribute("adminOrderCount",adminBiz.adminOrderCount());
					
					mav.setViewName("/admin/adminMain");
				}
				
			}else{
				mav.setViewName("../../index");
				mav.addObject("msg", "fail");
			}
		}else {
			mav.setViewName("../../index");
			mav.addObject("msg", "fail");
		}
		
		return mav;
	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		memberBiz.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("../../index");
		mav.addObject("msg", "logout");
		
		return mav;
	}
	
	//회원정보 수정
	@RequestMapping(value="/memberUpdate.do", method=RequestMethod.POST)
	public String memberUpdate(UserDto dto, HttpSession session) throws Exception{
		memberBiz.memberUpdate(dto);
		session.invalidate();
		
		return "../../index"; 
	}
	  
	//회원탈퇴
	@RequestMapping(value="/memberDelete.do", method=RequestMethod.GET)
	public String memberDelete(UserDto dto, HttpSession session) throws Exception{
		memberBiz.memberDelete(dto);
		session.invalidate();
		
		return "../../index";
	}
	
	public String randomPic() {
		int rNum = (int)(Math.random()*10 + 1);
		StringBuilder name = new StringBuilder("profile");
		
		name.append(rNum);
		return name.toString();
	}
	
 

	

}
