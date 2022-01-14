package com.project.eatda.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.eatda.biz.BlogBiz;
import com.project.eatda.biz.BlogReplyBiz;
import com.project.eatda.dto.BlogReplyDto;
import com.project.eatda.dto.UserDto;

@Controller
public class BlogReplyController {
	private Logger logger = LoggerFactory.getLogger(BlogReplyController.class);
	
	@Autowired
	private BlogReplyBiz replyBiz;
	
	@Autowired
	private BlogBiz blogBiz;
	

	@RequestMapping(value="/reply-insert.do", method=RequestMethod.POST) 
	@ResponseBody
	public List<BlogReplyDto> insert(@RequestBody String param, HttpServletRequest request) {
		logger.info("paging, param: " + param);

		String[] temp = param.split(",");
		
		String reply_content = temp[0].substring(18, temp[0].length()-1);
		String blog_no = temp[1].substring(11, temp[1].length()-2);
		UserDto user = (UserDto)request.getSession().getAttribute("member");
		
		BlogReplyDto dto = new BlogReplyDto();
		dto.setUser_id(user.getUser_id());
		dto.setBlog_no(Integer.parseInt(blog_no));
		dto.setReply_content(reply_content);
		
		System.out.println(dto.toString());
		
		int res = replyBiz.insert(dto);
		List<BlogReplyDto> list = new ArrayList<BlogReplyDto>();
		
		list.add(dto);
		
		return list;
	}
	
	@RequestMapping(value="/reply-update.do", method=RequestMethod.GET) 
	@ResponseBody
	public List<BlogReplyDto> update(String blog_no, String reply_no, String user_id, String reply_content, HttpServletRequest request) {
		logger.info("update, blog_no: " + blog_no);
		logger.info("update, reply_no: " + reply_no);
		logger.info("update, user_id: " + user_id);
		logger.info("update, reply_content: " + reply_content);
		
		BlogReplyDto dto = new BlogReplyDto();
		dto.setReply_content(reply_content);
		dto.setBlog_no(Integer.parseInt(blog_no));
		dto.setReply_no(Integer.parseInt(reply_no));
		dto.setUser_id(user_id);
		
		System.out.println(dto.toString());
		
		int res = replyBiz.update(dto);
		List<BlogReplyDto> list = replyBiz.list(Integer.parseInt(blog_no));
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setUpdateDateString(transformDate(list.get(i).getUpdatedate()));
			System.out.println(list.get(i).toString());
		}
		
		return list;
	}
	public String transformDate(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd am HH:mm");
		if (date == null) {
			return format.format(new Date());
		} else {
			return format.format(date);
		}
	}
	
	// 댓글 삭제
	@RequestMapping(value="/reply-delete.do", method=RequestMethod.GET)
	@ResponseBody
	public String delete(String blog_no, String reply_no) {
		logger.info("delete _ blog_no: "+blog_no);
		logger.info("delete _ reply_no: "+reply_no);

		replyBiz.delete(Integer.parseInt(blog_no), Integer.parseInt(reply_no));
		
		System.out.println("detail.do 가기 전 ");
		return "true";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
