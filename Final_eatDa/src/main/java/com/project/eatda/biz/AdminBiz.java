package com.project.eatda.biz;

import java.util.List;

import com.project.eatda.dto.BlogReplyDto;
import com.project.eatda.dto.EmailDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.ReportDto;
import com.project.eatda.dto.UserDto;

public interface AdminBiz {

	/* 관리자 MAIN */
	public int adminOrderCount();
	public int newAdminOrderCount();
	
	public int adminUserCount();
	public int newAdminUserCount();

	public int adminReportCount();
	public int newAdminReportCount();
	
	/* 댓글 리스트 */
	public List<BlogReplyDto> adminReplyList();
	public int adminReplyDelete(int reply_no);
	
	/* 상품 리스트 */
	public List<ProductDto> adminProductList();
	public ProductDto selectOne(String p_id);
	
	public int adminProductInsert(ProductDto dto);
	public int adminProductUpdate(ProductDto dto);
	public int adminProductDelete(String p_id);
	
	/* 주문 리스트 */
	public List<OrderDto> adminOrderList();

	public int adminOrderInsert(OrderDto order);
	public int adminOrderInsert2(OrderDto order);
	public int shippingStatusUpdate(OrderDto dto);
	public int orderStatusUpdate(OrderDto dto);
	public int adminOrderDelete(String order_id);

	/* 회원 리스트 */
	public List<UserDto> adminUserList();
	public int adminUserUpdate(UserDto dto);
	public int adminUserDelete(String user_id);
	//이메일
	public void sendMail(EmailDto dto);
	
	/* 신고 리스트 */
	public List<ReportDto> adminReportList();
	public int adminReportDelete(int report_no);
	public int reportStatusUpdate(ReportDto dto);

}
