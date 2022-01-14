package com.project.eatda.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.project.eatda.biz.BlogBiz;
import com.project.eatda.biz.BlogLikeBiz;
import com.project.eatda.biz.BlogReplyBiz;
import com.project.eatda.dto.BlogDto;
import com.project.eatda.dto.BlogLikeDto;
import com.project.eatda.dto.BlogReplyDto;
import com.project.eatda.dto.UserDto;

@Controller
public class BlogController {
	private Logger logger = LoggerFactory.getLogger(BlogController.class);

	@Autowired
	private BlogBiz biz;
	
	//reply
	@Autowired
	private BlogReplyBiz replyBiz;
	
	//like
	@Autowired
	private BlogLikeBiz likeBiz;
	
	//블로그 리스트 
	@RequestMapping(value="/takeBlog.do", method=RequestMethod.GET)
	@ResponseBody
	public List<BlogDto> takeBlog(String num) {
		logger.info("take Blog List, num :" + num);
		int page = Integer.parseInt(num);

		List<BlogDto> list = biz.takeBlogList(page);
		for (BlogDto dto : list) {
			System.out.println(dto.toString());
		}
		return list;
	}
	
	//페이징
	@RequestMapping(value="/blog-paging.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Integer> paging() {
		logger.info("paging");

		int count = biz.paging();
		List<Integer> list = new ArrayList<Integer>();
		list.add(count);

		return list;
	}
	
	//블로그 메인
	@RequestMapping("/blog.do")
	public String list() {
		logger.info("Blog list page");
		return "/blog/blog-main2";
	}
	
	// 블로그 검색
	@RequestMapping(value="/blog-search.do", method=RequestMethod.POST)
	@ResponseBody
	public List<BlogDto> search(@RequestBody String keyword) {
		logger.info("search Blog List");
		String search_keyword = keyword.substring(12,keyword.length()-2);
		System.out.println("controller -> search_keyword: "+search_keyword);
		List<BlogDto> list = biz.searchBlog(search_keyword);
		return list;
	}

	// 상세 보기
	@RequestMapping("/blog-detail.do")
	public String detail(Model model, int blog_no) {
		logger.info("Blog detail page,");
		System.out.println("blog.do: "+blog_no);
		BlogDto dto = biz.selectOne(blog_no);
		System.out.println(dto.toString());
		model.addAttribute("dto", dto);
		
		List<BlogReplyDto> replyDto =  replyBiz.list(blog_no);
		model.addAttribute("list", replyDto);
		
		biz.blogCount(blog_no); //조회수
		return "/blog/blog-detail";
	}
	
	// 하트 클릭
	@RequestMapping(value="/blog-like.do", method=RequestMethod.GET)
	public String clickLike(int blog_no, String user_id, int like_count, HttpServletRequest request) {
		logger.info("blog_no: "+blog_no+", user_id: "+user_id+", like_count"+like_count);
		BlogDto blogDto = new BlogDto();
		blogDto.setBlog_no(blog_no);
		blogDto.setUser_id(user_id);
		blogDto.setBlog_like(like_count);
		System.out.println(blogDto.toString());
		UserDto dto = (UserDto)request.getSession().getAttribute("member");
		BlogLikeDto like = new BlogLikeDto(blog_no, dto.getUser_id());
		
		int res = likeBiz.clickLike(blogDto, like);
		
		return res>0?"true":"false";
	}
	
	//하트 취소
	@RequestMapping(value="/blog-unlike.do", method=RequestMethod.GET)
	public String clickUnLike(int blog_no, String user_id, int like_count, HttpServletRequest request) {
		logger.info("blog_no: "+blog_no+", user_id: "+user_id+", like_count"+like_count);
		BlogDto blogDto = new BlogDto();
		blogDto.setBlog_no(blog_no);
		blogDto.setUser_id(user_id);
		blogDto.setBlog_like(like_count);
		System.out.println(blogDto.toString());
		UserDto dto = (UserDto)request.getSession().getAttribute("member");
		BlogLikeDto like = new BlogLikeDto(blog_no, dto.getUser_id());
		
		int res = likeBiz.clickUnLike(blogDto, like);
		
		return res>0?"true":"false";
	}

	
	// 글 작성 페이지
	@RequestMapping(value="/blog-writeform.do", method=RequestMethod.GET)
	public String write() {
		logger.info("Blog write form page");
		return "/blog/blog-write";
	}
	
	//글 작성 결과
	@RequestMapping("/blog-write.do")
	public String write(BlogDto dto) {
		logger.info("Blog write page - post");
		System.out.println(dto.toString());
		int res = biz.insert(dto);
		int blogNo = biz.selectBlogNo(dto.getBlog_title());
		if(res>0) {
			return "redirect:blog-detail.do?blog_no="+blogNo;
		} else {
			return "redirect:blog-writeform.do";
		}
	}

	// 글 수정 페이지
	@RequestMapping(value="/blog-updateform.do", method=RequestMethod.GET)
	public String update(Model model, int blog_no) {
		logger.info("Blog update form page");
		System.out.println("update -> "+blog_no);
		BlogDto dto = biz.selectOne(blog_no);
		model.addAttribute("dto",dto);
		System.out.println(dto.toString());
		return "/blog/blog-update";
	}
	// 글 수정 결과
	@RequestMapping("/blog-update.do")
	public String update(BlogDto dto) {
		logger.info("Blog update result - post");
		System.out.println(dto.toString());
		biz.update(dto);

		return "redirect:blog-detail.do?blog_no="+dto.getBlog_no();

	}

	// 글 삭제
	@RequestMapping(value="/blog-delete.do", method=RequestMethod.GET)
	public String delete(int blog_no) {
		logger.info("Blog delete");
		biz.delete(blog_no);
		return "redirect:blog.do";
	}
	
	//썸머노트 파일처리
	@RequestMapping(value="/uploadImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
			
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/images/blog/";
		System.out.println(fileRoot +"//" +contextRoot);
		
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지널 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "resources/images/blog/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	
	/* 관리자 블로그 리스트 (전체 조회) */
	@RequestMapping(value="/adminPostBlog.do", method=RequestMethod.GET)
	public String adminBlogList(Model model){
		logger.info("admin blog list");
		model.addAttribute("list", biz.adminBlogList());
		
		return "/admin/adminPostBlog";
	}
	
	// 관리자 블로그 삭제
	@RequestMapping(value="/adminBlogDelete.do", method=RequestMethod.GET)
	public String adminProductDelete(Model model, HttpServletRequest httpServletRequest){
		System.out.println("admin blog delete");
		
		String[] chk  = httpServletRequest.getParameterValues("RowCheck[]");
		System.out.println(chk);
		int chk_l = chk.length;
		System.out.println(chk_l);
		
		for(int i = 0; i < chk_l; i++) {
			System.out.println(chk[i]);
			biz.adminBlogDelete(Integer.parseInt(chk[i]));
		}
		
		return "redirect:/adminPostBlog.do";
	}
	
}
