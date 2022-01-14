package com.project.eatda.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.project.eatda.biz.AdminBiz;
import com.project.eatda.biz.BlogBiz;
import com.project.eatda.biz.BlogReplyBiz;
import com.project.eatda.biz.EventBiz;
import com.project.eatda.biz.RecipeBiz;
import com.project.eatda.dto.EmailDto;
import com.project.eatda.dto.EventDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.ReportDto;
import com.project.eatda.dto.UserDto;

@Controller
public class AdminController {
	
	@Inject
	AdminBiz emailService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	AdminBiz adminBiz;
	
	@Autowired
	BlogBiz blogBiz;
	
	@Autowired
	BlogReplyBiz replyBiz;
	
	@Autowired
	EventBiz eventBiz;

	@Autowired
	RecipeBiz recipeBiz;
	
	/* 관리자 메인 */
	@RequestMapping("/adminMain.do")
	public String admin1(Model model) {
		System.out.println("adminMain");
		
		model.addAttribute("newBlogCount",blogBiz.newAdminBlogCount());
		model.addAttribute("blogCount",blogBiz.adminBlogCount());
		model.addAttribute("newReportCount",adminBiz.newAdminReportCount());
		model.addAttribute("reportCount",adminBiz.adminReportCount());
		model.addAttribute("newUserCount",adminBiz.newAdminUserCount());
		model.addAttribute("userCount",adminBiz.adminUserCount());
		model.addAttribute("newAdminOrderCount",adminBiz.newAdminOrderCount());
		model.addAttribute("adminOrderCount",adminBiz.adminOrderCount());
		
		return "/admin/adminMain";
	}
	
	/* 게시글 댓글 리스트 */
	@RequestMapping(value="/adminPostReply.do", method=RequestMethod.GET)
	public String adminReplyList(Model model){
		System.out.println("admin reply list");
		model.addAttribute("replyList", adminBiz.adminReplyList());

		return "/admin/adminPostReply";
	}
	
	// 댓글 삭제
	@RequestMapping(value="/adminPostReplyDelete.do", method=RequestMethod.GET)
	public String adminReplyDelete(Model model, HttpServletRequest httpServletRequest){
		System.out.println("admin reply delete");
		
		String[] chk  = httpServletRequest.getParameterValues("RowCheck[]");
		System.out.println(chk);
		int chk_length = chk.length;
		System.out.println(chk_length);
		
		for(int i = 0; i < chk_length; i++) {
			System.out.println(chk[i]);
			adminBiz.adminReplyDelete(Integer.parseInt(chk[i]));
		}
		
		return "redirect:/adminPostReply.do";
	}

	/* 블로그 리스트 */
	@RequestMapping("/adminPostBlog.do")
	public String adminPostBlog(Model model) {
		System.out.println("adminPostBlog");
		model.addAttribute("blogList", blogBiz.adminBlogList());

		return "/admin/adminPostBlog";
	}

	/* 이벤트 리스트 */
	@RequestMapping("/adminPostEvent.do")
	public String adminPostEvent(Model model) {
		System.out.println("adminPostEvent");
		model.addAttribute("eventList", eventBiz.eventList());

		return "/admin/adminPostEvent";
	}

	// 이벤트 status update
	@RequestMapping("/adminEventStaus.do")
	public String updateStatus(EventDto dto, String status, int e_no) {
		System.out.println(e_no);
		dto.setStatus(status);
		dto.setEvent_no(e_no);
		System.out.println(dto.toString());
		eventBiz.adminEventStatus(dto);
		
		return "redirect:/adminPostEvent.do";
	}

	/* 레시피 리스트 */
	@RequestMapping("/adminRecipe.do")
	public String adminRecipe(Model model) {
		model.addAttribute("recipeList", recipeBiz.adminRecipeList());

		return "/admin/adminRecipe";
	}
	
	/* 상품 리스트 */
	@RequestMapping("/adminProductList.do")
	public String adminProductList(Model model) {
		model.addAttribute("productList", adminBiz.adminProductList());
		
		return "/admin/adminProductList";
	}

	// 상품 등록 버튼 클릭 시, writeForm으로 페이지 이동
	@RequestMapping("/adminProductWrite.do")
	public String adminProductWrite() {
		return "/admin/adminProductWrite";
	}
	
	// 상품 등록
	@RequestMapping("adminProductInsert.do")
	public String adminProductInsert(MultipartFile uploadFile, ProductDto dto, HttpServletRequest request) {
		
		JsonObject jsonObject = new JsonObject();
		
		String path = request.getRealPath("resources/images/admin/");
		System.out.println("path : "+ path);
		
		String fname = uploadFile.getOriginalFilename();
		System.out.println(fname);
		System.out.println("uu:"+uploadFile);
		System.out.println("ff:"+fname);
		
		File saveFname = new  File(path+fname);
		System.out.println("saveF"+saveFname);
		
		
		if(fname!=null && !fname.equals("")) {
			try {
				byte[] data = uploadFile.getBytes();
				InputStream fis = uploadFile.getInputStream();
				FileUtils.copyInputStreamToFile(fis, saveFname);
				System.out.println("fis : "+fis);
				FileOutputStream fos = new FileOutputStream(path+"/"+fname);
				fos.write(data);
				fos.close();
			} catch (IOException e) {
				System.out.println("[error] : product insert controller");
				e.printStackTrace();
			}
		}
		dto.setImg_path("resources/images/admin/"+fname);
		int res = adminBiz.adminProductInsert(dto);
		
		System.out.println(dto);
		return "redirect:/adminProductList.do";
	}
	
	
	// 상품 수정 버튼 클릭 시, updateForm으로 이동
	@RequestMapping("adminProductUpdate.do")
	public String adminProductUpdate(Model model, String p_id) {
		System.out.println("admin product update");
		model.addAttribute("dto",adminBiz.selectOne(p_id));
		
		return "/admin/adminProductUpdate";
	}
	
	// 상품 수정 완료
	@RequestMapping("/adminProductUpdateRes.do")
	public String adminProductUpdateRes(ProductDto dto) {
		System.out.println("product update res");
		
		int res = adminBiz.adminProductUpdate(dto);
		if(res>0) {
			return "redirect:adminProductList.do";
		}else {
			return "redirect:adminProductUpdate.do?p_id="+dto.getP_id();
		}
	}
	
	// 상품 삭제
	@RequestMapping(value="/adminProductDelete.do",method=RequestMethod.GET)
	public String adminProductDelete(Model model, HttpServletRequest httpServletRequest){
		System.out.println("admin product delete");
		
		String[] chk  = httpServletRequest.getParameterValues("RowCheck[]");
		System.out.println(chk);
		int chk_l = chk.length;
		System.out.println(chk_l);
		
		for(int i = 0; i < chk_l; i++) {
			System.out.println(chk[i]);
			adminBiz.adminProductDelete(chk[i]);
		}
		return "redirect:/adminProductList.do";
	}

	/* 주문 리스트 */
	@RequestMapping(value="/adminOrder.do", method=RequestMethod.GET)
	public String adminOrder(Model model) {
		System.out.println("adminOrder");
		model.addAttribute("orderList", adminBiz.adminOrderList());
		
		return "/admin/adminOrder";
	}
	
	// 주문 삭제
	 @RequestMapping(value="/adminOrderDelete.do", method=RequestMethod.GET)
	 public String adminOrderDelete(Model model, HttpServletRequest httpServletRequest){ 
		System.out.println("admin blog delete");
		
	 	String[] chk = httpServletRequest.getParameterValues("RowCheck[]");
	 	System.out.println(chk); 
	 	int chk_l = chk.length;
	 	System.out.println(chk_l);
		  
			for(int i = 0; i < chk_l; i++) { 
				System.out.println(chk[i]);
			 	adminBiz.adminOrderDelete(chk[i]); 
			 }
		return "redirect:/adminOrder.do"; 
	 }
	 
	// 배송 현황 update
		@RequestMapping("/shippingStatusUpdate.do")
		public String shippingStatusUpdate(OrderDto dto, String shipping_status, String order_id) {
			System.out.println("update shipping status");
			System.out.println(shipping_status);
			System.out.println(order_id);
			
			dto.setShipping_status(shipping_status);
			dto.setOrder_id(order_id);
			System.out.println(dto.toString());
			adminBiz.shippingStatusUpdate(dto);
			
			return "redirect:/adminOrder.do";
		}
		
		// 진행 현황 update
		@RequestMapping("/orderStatusUpdate.do")
		public String orderStatusUpdate(OrderDto dto, String order_status, String order_id) {
			System.out.println("update order_status");
			System.out.println(order_status);
			System.out.println(order_id);
					
			dto.setOrder_status(order_status);
			dto.setOrder_id(order_id);
			System.out.println(dto.toString());
			adminBiz.orderStatusUpdate(dto);
					
			return "redirect:/adminOrder.do";
		}		

	/* 회원 리스트 */
	@RequestMapping("/adminUser.do")
	public String adminUser(Model model) {
		System.out.println("adminUser");
		model.addAttribute("userList", adminBiz.adminUserList());

		return "/admin/adminUser";
	}
	
	// 회원 활성화 여부 update
	@RequestMapping("/adminUserUpdate.do")
	public String adminUserUpdate(UserDto dto, String user_enable, String user_id) {
		System.out.println("update user enable");
		System.out.println(user_enable);
		System.out.println(user_id);
		
		dto.setUser_enable(user_enable);
		dto.setUser_id(user_id);
		System.out.println(dto.toString());
		adminBiz.adminUserUpdate(dto);
		
		return "redirect:/adminUser.do";
	}
	
	// 회원 삭제
	@RequestMapping("/adminUserDelete.do")
	public String adminUserDelete(Model model, HttpServletRequest httpServletRequest){ 
		System.out.println("admin user delete");
		
		String[] chk = httpServletRequest.getParameterValues("RowCheck[]");
 			System.out.println(chk); 
 			int chk_l = chk.length;
 			System.out.println(chk_l);
  
 		for(int i = 0; i < chk_l; i++) { 
 			System.out.println(chk[i]);
 			adminBiz.adminUserDelete(chk[i]); 
	 }
 
	 return "redirect:/adminUser.do"; 
	 
	}
	
	// 이메일 보내기
	@RequestMapping("emailWrite.do")
	public String emailWrite() {
		return "/admin/adminEmailWrite";
	}
	
	@RequestMapping(value="send.do", method=RequestMethod.POST)
		public String sendMail(EmailDto dto) throws Exception {
			String charset = "UTF-8";
			try {
	            MimeMessage message = this.mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
	           
	            // 발신자 이메일, 발신자 명
	            helper.setFrom(new InternetAddress("TeamEatDa@gamil.com", "EatDa"));
	            
	            // 수신자 이메일
	            message.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
	            
	            // 메일 제목
	            message.setSubject(dto.getSubject(), charset);
	            
	            
	            // 메일 본문
	            message.setText(dto.getMessage(), charset);
	            
	            // 이메일 보내기
	            mailSender.send(message);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "redirect:/adminUser.do";
		}
	

	/* 신고 리스트 */
	@RequestMapping(value="/adminReport.do", method=RequestMethod.GET)
	public String adminReport(Model model) {
		System.out.println("admin report list");
		model.addAttribute("reportList", adminBiz.adminReportList());
		
		return "/admin/adminReport";
	}
	
	// 신고 삭제 
	@RequestMapping("/adminReportDelete.do")
	public String adminReportDelete(Model model, HttpServletRequest httpServletRequest){
		System.out.println("admin report delete");
		
		String[] chk  = httpServletRequest.getParameterValues("RowCheck[]");
		System.out.println(chk);
		int chk_l = chk.length;
		System.out.println(chk_l);
		
		for(int i = 0; i < chk_l; i++) {
			System.out.println(chk[i]);
			adminBiz.adminReportDelete(Integer.parseInt(chk[i]));
		}
		
		return "redirect:/adminReport.do";
	}
	
	// 신고 status update
	@RequestMapping("reportStatusUpdate.do")
	public String reportStatusUpdate(ReportDto dto, int report_status, int report_no, int report_penalty) {
		System.out.println("update report_status");
		System.out.println(report_no);
		
		if(report_status==2) {
			report_penalty += 1;
		}
		
		dto.setReport_status(report_status);
		dto.setReport_no(report_no);
		dto.setReport_penalty(report_penalty);
		System.out.println(dto.toString());
		adminBiz.reportStatusUpdate(dto);
		
		return "redirect:/adminReport.do";
	}
	
}
