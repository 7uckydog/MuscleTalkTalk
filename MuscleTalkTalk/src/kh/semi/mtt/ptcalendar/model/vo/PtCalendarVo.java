package kh.semi.mtt.ptcalendar.model.vo;

import java.sql.Timestamp;

public class PtCalendarVo {
	private int ptCalendarNo;
	private int ptNo;
	private int memberNo;
	private Timestamp ptCalendarStartTime;
	private String ptCalendarReservationState;

	
	@Override
	public String toString() {
		return "PtCalendarVo [ptCalendarNo=" + ptCalendarNo + ", ptNo=" + ptNo + ", memberNo=" + memberNo + ", ptCalendarStartTime=" + ptCalendarStartTime + ", ptCalendarReservationState="
				+ ptCalendarReservationState + "]";
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
	
	
	
	
}
