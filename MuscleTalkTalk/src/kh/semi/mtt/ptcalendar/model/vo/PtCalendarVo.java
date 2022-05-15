package kh.semi.mtt.ptcalendar.model.vo;

import java.sql.Timestamp;

public class PtCalendarVo {
	private int ptCalendarNo;
	private int ptNo;
	private int memberNo;
	private Timestamp ptCalendarStartTime;
	private String ptCalendarReservationState;
	private String ptName;
	private String memberName;
	private String memberId;
	private String gymName;
	private String gymLocation;
	private int ptPrice;
	
	
	@Override
	public String toString() {
		return "PtCalendarVo [ptCalendarNo=" + ptCalendarNo + ", ptNo=" + ptNo + ", memberNo=" + memberNo + ", ptCalendarStartTime=" + ptCalendarStartTime + ", ptCalendarReservationState="
				+ ptCalendarReservationState + ", ptName=" + ptName + ", memberName=" + memberName + ", memberId=" + memberId + ", gymName=" + gymName + ", gymLocation=" + gymLocation + ", ptPrice="
				+ ptPrice + "]";
	}

	

	public String getGymName() {
		return gymName;
	}



	public void setGymName(String gymName) {
		this.gymName = gymName;
	}



	public String getGymLocation() {
		return gymLocation;
	}



	public void setGymLocation(String gymLocation) {
		this.gymLocation = gymLocation;
	}



	public int getPtPrice() {
		return ptPrice;
	}



	public void setPtPrice(int ptPrice) {
		this.ptPrice = ptPrice;
	}



	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getPtCalendarNo() {
		return ptCalendarNo;
	}
	
	public void setPtCalendarNo(int ptCalendarNo) {
		this.ptCalendarNo = ptCalendarNo;
	}

	public int getPtNo() {
		return ptNo;
	}

	public void setPtNo(int ptNo) {
		this.ptNo = ptNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Timestamp getPtCalendarStartTime() {
		return ptCalendarStartTime;
	}

	public void setPtCalendarStartTime(Timestamp ptCalendarStartTime) {
		this.ptCalendarStartTime = ptCalendarStartTime;
	}

	public String getPtCalendarReservationState() {
		return ptCalendarReservationState;
	}

	public void setPtCalendarReservationState(String ptCalendarReservationState) {
		this.ptCalendarReservationState = ptCalendarReservationState;
	}

	public String getPtName() {
		return ptName;
	}

	public void setPtName(String ptName) {
		this.ptName = ptName;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	
	
	
	
}
