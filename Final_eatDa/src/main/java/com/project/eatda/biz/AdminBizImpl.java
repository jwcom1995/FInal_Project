package com.project.eatda.biz;

import java.util.List;

import javax.inject.Inject;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.eatda.dao.AdminDao;
import com.project.eatda.dto.BlogReplyDto;
import com.project.eatda.dto.EmailDto;
import com.project.eatda.dto.OrderDto;
import com.project.eatda.dto.ProductDto;
import com.project.eatda.dto.ReportDto;
import com.project.eatda.dto.UserDto;

@Service
public class AdminBizImpl implements AdminBiz{

	@Inject
	JavaMailSender mailSender;	
	
	/* 관리자 MAIN */
		@Autowired
		AdminDao adminDao;
		
		@Override
		public int adminOrderCount() {
			return adminDao.adminOrderCount();
		}
		
		@Override
		public int newAdminOrderCount() {
			return adminDao.newAdminOrderCount();
		}
		
		
		@Override
		public int adminUserCount() {
			return userDao.adminUserCount();
		}
		
		@Override
		public int newAdminUserCount() {
			return userDao.newAdminUserCount();
		}
		

		@Override
		public int adminReportCount() {
			return reportDao.adminReportCount();
		}

		@Override
		public int newAdminReportCount() {
			return reportDao.newAdminReportCount();
		}
	
	/* 댓글 리스트 */
		@Autowired
		public AdminDao replyDao;
		
		@Override
		public List<BlogReplyDto> adminReplyList() {
			return replyDao.adminReplyList();
		}
		
		// 댓글 리스트 삭제
		@Override
		public int adminReplyDelete(int reply_no) {
			return replyDao.adminReplyDelete(reply_no);
		}
		
	/* 상품 리스트 */
		@Autowired
		public AdminDao productDao;
		
		@Override
		public List<ProductDto> adminProductList() {
			return productDao.adminProductList();
		}
		
		//selectOne
		@Override
		public ProductDto selectOne(String p_id) {
			return productDao.selectOne(p_id);
		}
		
		// 상품 등록
		@Override
		public int adminProductInsert(ProductDto dto) {
			return productDao.adminProductInsert(dto);
		}
		
		// 상품 수정
		@Override
		public int adminProductUpdate(ProductDto dto) {
			return productDao.adminProductUpdate(dto);
		}
		
		// 상품 삭제
		@Override
		public int adminProductDelete(String p_id) {
			return productDao.adminProductDelete(p_id);
		}


	/* 주문 리스트 */
		@Autowired
		public AdminDao orderDao;
		
		@Override
		public List<OrderDto> adminOrderList() {
			return orderDao.adminOrderList();
		}
		
		// 주문 추가(무통장입금 : default=결제대기)
		@Override
		public int adminOrderInsert(OrderDto dto) {
			return orderDao.adminOrderInsert(dto);
		}
		
		// 주문 추가(무통장입금 이외 결제 : default=결제완료)
		@Override
		public int adminOrderInsert2(OrderDto dto) {
			return orderDao.adminOrderInsert2(dto);
		}
		
		// 배송 현황 update
		@Override
		public int shippingStatusUpdate(OrderDto dto) {
			return orderDao.shippingStatusUpdate(dto);
		}
		
		// 진행 현황 udpate
		public int orderStatusUpdate(OrderDto dto) {
			return orderDao.orderStatusUpdate(dto);
		}
		
		// 주문 리스트 삭제
		@Override
		public int adminOrderDelete(String order_id) {
			return orderDao.adminOrderDelete(order_id);
		}
		
		
	/* 회원 리스트 */	
		@Autowired
		public AdminDao userDao;
		
		@Override
		public List<UserDto> adminUserList() {
			return userDao.adminUserList();
		}
		
		// 회원 활성화 update
		@Override
		public int adminUserUpdate(UserDto dto) {
			return userDao.adminUserUpdate(dto);
		}
		
		// 회원 리스트 삭제
		@Override
		public int adminUserDelete(String user_id) {
			return userDao.adminUserDelete(user_id);
		}
		
		// 이메일
		public void sendMail(EmailDto dto) {
			try {
				// 이메일 객체
				MimeMessage msg = this.mailSender.createMimeMessage();

				String charset = "UTF-8";
				
				// 받는 사람 설정(수신자)
				msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
				//보내는 사람 (발신자 이메일 주소 + 이름)
				msg.addFrom(new InternetAddress[] { new InternetAddress(dto.getSenderMail(), dto.getSenderName()) });
				// 이메일 제목과 본문내용 (인코딩)
				msg.setSubject(dto.getSubject(), charset);
				msg.setText(dto.getMessage(), charset);
				
				// 이메일 보내기
				mailSender.send(msg);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	
	/* 신고 리스트 */
		@Autowired
		public AdminDao reportDao;
		
		@Override
		public List<ReportDto> adminReportList(){
			return reportDao.adminReportList();
		}
		
		// 신고 리스트 삭제
		@Override
		public int adminReportDelete(int report_no) {
			return reportDao.adminReportDelete(report_no);
		}

		// 신고 status update
		@Override
		public int reportStatusUpdate(ReportDto dto) {
			return reportDao.reportStatusUpdate(dto);
		}

}
