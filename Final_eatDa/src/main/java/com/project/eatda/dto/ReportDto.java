package com.project.eatda.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ReportDto {
		private int report_no;
		private String reporter;
		private String reported;
		private int reply_no;
		private Date report_date;
		private String report_content;
		private int report_status;		//신고 처리 상황 (Default : "처리대기")
		private int report_penalty;		// penalty count
		private String reply_content;
		
		public ReportDto() {
			super();
		}
		
		public ReportDto(int report_no, String reporter, String reported, int reply_no, Date report_date,
				int report_status, String report_content, int report_penalty, String reply_content) {
			super();
			this.report_no = report_no;
			this.reporter = reporter;
			this.reported = reported;
			this.reply_no = reply_no;
			this.report_date = report_date;
			this.report_status = report_status;
			this.report_content = report_content;
			this.report_penalty = report_penalty;
			this.reply_content = reply_content;
		}
		
		public int getReport_no() {
			return report_no;
		}
		public void setReport_no(int report_no) {
			this.report_no = report_no;
		}
		public String getReporter() {
			return reporter;
		}
		public void setReporter(String reporter) {
			this.reporter = reporter;
		}
		public String getReported() {
			return reported;
		}
		public void setReported(String reported) {
			this.reported = reported;
		}
		public int getReply_no() {
			return reply_no;
		}
		public void setReply_no(int reply_no) {
			this.reply_no = reply_no;
		}
		public Date getReport_date() {
			return report_date;
		}
		public void setReport_date(Date report_date) {
			this.report_date = report_date;
		}
		public int getReport_status() {
			return report_status;
		}
		public void setReport_status(int report_status) {
			this.report_status = report_status;
		}
		public String getReport_content() {
			return report_content;
		}
		public void setReport_content(String report_content) {
			this.report_content = report_content;
		}

		public int getReport_penalty() {
			return report_penalty;
		}

		public void setReport_penalty(int report_penalty) {
			this.report_penalty = report_penalty;
		}
		
		public String getReply_content() {
			return reply_content;
		}

		public void setReply_content(String reply_content) {
			this.reply_content = reply_content;
		}

		@Override
		public String toString() {
			return "ReportDto [report_no=" + report_no+", reporter="+reporter+",reported="+reported+", reply_no="+reply_no+", report_date="+report_date+", report_content="
					+report_content+", report_status="+report_status+", report_penalty="+report_penalty+", reply_content=" +reply_content+"]";
		}
		
}
