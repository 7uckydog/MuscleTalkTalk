package kh.semi.mtt.inquiry.model.vo;

import java.sql.Date;

public class InquiryVo {
	public int inquiryNo;
	public String inquiryTitle;
	public String inquiryContent;
	public Date inquiryDate;
	public String inquiryCheck;
	public String inquiryAnswer;
	
	@Override
	public String toString() {
		return "InquiryVo [inquiryNo=" + inquiryNo + ", inquiryTitle=" + inquiryTitle + ", inquiryContent="
				+ inquiryContent + ", inquiryDate=" + inquiryDate + ", inquiryCheck=" + inquiryCheck
				+ ", inquiryAnswer=" + inquiryAnswer + "]";
	}

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public String getInquiryCheck() {
		return inquiryCheck;
	}

	public void setInquiryCheck(String inquiryCheck) {
		this.inquiryCheck = inquiryCheck;
	}

	public String getInquiryAnswer() {
		return inquiryAnswer;
	}

	public void setInquiryAnswer(String inquiryAnswer) {
		this.inquiryAnswer = inquiryAnswer;
	}
	
}
