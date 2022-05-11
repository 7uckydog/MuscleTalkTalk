package kh.semi.mtt.report.model.vo;

import java.sql.Date;

public class ReportVo {
	
//	BOARD_REPORT_NO      NOT NULL NUMBER        
//	BOARD_REPORT_CONTENT NOT NULL VARCHAR2(300) 
//	BOARD_REPORT_TIME    NOT NULL TIMESTAMP(6)  
//	MEMBER_NO            NOT NULL NUMBER        
//	BOARD_NO                      NUMBER        
//	ROUTINE_BOARD_NO              NUMBER   
	
	private int boardReportNo;
	private String boardReportContent;
	private Date boardReportTime;
	private int memberNo;
	private int boardNo;
	private int routineboardNo;
	
	
	
	
	
	
	public ReportVo() {
		super();
	}
	
	public ReportVo(int boardReportNo, String boardReportContent, Date boardReportTime, int memberNo, int boardNo,
			int routineboardNo) {
		super();
		this.boardReportNo = boardReportNo;
		this.boardReportContent = boardReportContent;
		this.boardReportTime = boardReportTime;
		this.memberNo = memberNo;
		this.boardNo = boardNo;
		this.routineboardNo = routineboardNo;
	}
	@Override
	public String toString() {
		return "ReportVo [boardReportNo=" + boardReportNo + ", boardReportContent=" + boardReportContent
				+ ", boardReportTime=" + boardReportTime + ", memberNo=" + memberNo + ", boardNo=" + boardNo
				+ ", routineboardNo=" + routineboardNo + "]";
	}
	public int getBoardReportNo() {
		return boardReportNo;
	}
	public void setBoardReportNo(int boardReportNo) {
		this.boardReportNo = boardReportNo;
	}
	public String getBoardReportContent() {
		return boardReportContent;
	}
	public void setBoardReportContent(String boardReportContent) {
		this.boardReportContent = boardReportContent;
	}
	public Date getBoardReportTime() {
		return boardReportTime;
	}
	public void setBoardReportTime(Date boardReportTime) {
		this.boardReportTime = boardReportTime;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getRoutineboardNo() {
		return routineboardNo;
	}
	public void setRoutineboardNo(int routineboardNo) {
		this.routineboardNo = routineboardNo;
	}
	
	
	
	
	
	
}
