package kh.semi.mtt.reservation.model.vo;

import java.sql.Timestamp;

public class ReservationVo {
	private int rNo;
	private int ptNo;
	private int memberNo;
	private String ptName;
	private Timestamp ptCalendarStartTime;
	private String ptCalendarReservationState;
	private int ptCalendarNo;
	
	@Override
	public String toString() {
		return "ReservationVo [rNo=" + rNo + ", ptNo=" + ptNo + ", memberNo=" + memberNo + ", ptName=" + ptName
				+ ", ptCalendarStartTime=" + ptCalendarStartTime + ", ptCalendarReservationState="
				+ ptCalendarReservationState + ", ptCalendarNo=" + ptCalendarNo + "]";
	}

	
	public int getPtCalendarNo() {
		return ptCalendarNo;
	}

	public void setPtCalendarNo(int ptCalendarNo) {
		this.ptCalendarNo = ptCalendarNo;
	}

	public int getrNo() {
		return rNo;
	}


	public void setrNo(int rNo) {
		this.rNo = rNo;
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

	public String getPtName() {
		return ptName;
	}

	public void setPtName(String ptName) {
		this.ptName = ptName;
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
}
