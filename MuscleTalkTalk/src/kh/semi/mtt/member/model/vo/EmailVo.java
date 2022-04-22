package kh.semi.mtt.member.model.vo;

import java.util.Date;

public class EmailVo {
	private int emailCertificationNo;
	private String emailCertificationEmail;
	private String emailCertificationCode;
	@Override
	public String toString() {
		return "EmailVo [emailCertificationNo=" + emailCertificationNo + ", emailCertificationEmail="
				+ emailCertificationEmail + ", emailCertificationCode=" + emailCertificationCode + "]";
	}
	public int getEmailCertificationNo() {
		return emailCertificationNo;
	}
	public void setEmailCertificationNo(int emailCertificationNo) {
		this.emailCertificationNo = emailCertificationNo;
	}
	public String getEmailCertificationEmail() {
		return emailCertificationEmail;
	}
	public void setEmailCertificationEmail(String emailCertificationEmail) {
		this.emailCertificationEmail = emailCertificationEmail;
	}
	public String getEmailCertificationCode() {
		return emailCertificationCode;
	}
	public void setEmailCertificationCode(String emailCertificationCode) {
		this.emailCertificationCode = emailCertificationCode;
	}

}
