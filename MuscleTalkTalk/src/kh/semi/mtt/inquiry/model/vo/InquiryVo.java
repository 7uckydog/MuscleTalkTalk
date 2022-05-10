package kh.semi.mtt.inquiry.model.vo;

import java.sql.Date;

public class InquiryVo {
	public int inquiryNo;
	public String inquiryTitle;
	public String inquiryContent;
	public Date inquiryDate;
	public String inquiryCheck;
	public String inquiryAnswer;
	public String memberNickname;
	public int Rownum;
	@Override
	public String toString() {
		return "InquiryVo [inquiryNo=" + inquiryNo + ", inquiryTitle=" + inquiryTitle + ", inquiryContent="
				+ inquiryContent + ", inquiryDate=" + inquiryDate + ", inquiryCheck=" + inquiryCheck
				+ ", inquiryAnswer=" + inquiryAnswer + ", memberNickname=" + memberNickname + ", Rownum=" + Rownum
				+ "]";
	}
	public InquiryVo(int inquiryNo, String inquiryTitle, String inquiryContent, Date inquiryDate, String inquiryCheck,
			String inquiryAnswer, String memberNickname, int rownum) {
		super();
		this.inquiryNo = inquiryNo;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.inquiryDate = inquiryDate;
		this.inquiryCheck = inquiryCheck;
		this.inquiryAnswer = inquiryAnswer;
		this.memberNickname = memberNickname;
		Rownum = rownum;
	}
	public InquiryVo() {
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
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public int getRownum() {
		return Rownum;
	}
	public void setRownum(int rownum) {
		Rownum = rownum;
	}
	
	
	
	
}
