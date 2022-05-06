package kh.semi.mtt.payment.model.Vo;

import java.sql.Timestamp;

public class PaymentVo {
	private int paymentNo;
	private int memberNo;
	private Timestamp paymentTime;
	private int paymentPrice;
	private int ptCalendarNo;
	
	@Override
	public String toString() {
		return "PaymentVo [paymentNo=" + paymentNo + ", memberNo=" + memberNo + ", paymentTime=" + paymentTime + ", paymentPrice=" + paymentPrice + ", ptCalendarNo=" + ptCalendarNo + "]";
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Timestamp getPaymentTime() {
		return paymentTime;
	}

	public void setPaymentTime(Timestamp paymentTime) {
		this.paymentTime = paymentTime;
	}

	public int getPaymentPrice() {
		return paymentPrice;
	}

	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}

	public int getPtCalendarNo() {
		return ptCalendarNo;
	}

	public void setPtCalendarNo(int ptCalendarNo) {
		this.ptCalendarNo = ptCalendarNo;
	}
	
	
}
