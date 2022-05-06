package kh.semi.mtt.routineboard.model.vo;

import java.util.Date;

public class RoutineBoardVo {
//	ROUTINE_BOARD_NO      NOT NULL NUMBER         
//	MEMBER_NO             NOT NULL NUMBER         
//	ROUTINE_NO            NOT NULL NUMBER         
//	ROUTINE_BOARD_TITLE   NOT NULL VARCHAR2(200)  
//	ROUTINE_BOARD_CONTENT NOT NULL VARCHAR2(1000) 
//	ROUTINE_BOARD_COUNT   NOT NULL NUMBER         
//	ROUTINE_BOARD_DATE    NOT NULL DATE           
//	ROUTINE_BOARD_SHARE   NOT NULL NUMBER         
//	BOARD_CATEGORY_NO     NOT NULL NUMBER(1)    
	
	private int routineboardNo;
	private String memberNickname;
	private int routineNo;
	private String routineboardTitle;
	private String routineboardContent;
	private int routineboardCount;
	private Date routineboardDate;
	private int routineboardShare;
	private int boardCategoryNumber;
	private int rCnt;
	
	
	
	
	
	public RoutineBoardVo() {
		super();
	}
	
	
	public RoutineBoardVo(int routineboardNo, String memberNickname, int routineNo, String routineboardTitle,
			String routineboardContent, int routineboardCount, Date routineboardDate, int routineboardShare,
			int boardCategoryNumber, int rCnt) {
		super();
		this.routineboardNo = routineboardNo;
		this.memberNickname = memberNickname;
		this.routineNo = routineNo;
		this.routineboardTitle = routineboardTitle;
		this.routineboardContent = routineboardContent;
		this.routineboardCount = routineboardCount;
		this.routineboardDate = routineboardDate;
		this.routineboardShare = routineboardShare;
		this.boardCategoryNumber = boardCategoryNumber;
		this.rCnt = rCnt;
	}
	@Override
	public String toString() {
		return "RoutineBoardVo [routineboardNo=" + routineboardNo + ", memberNickname=" + memberNickname
				+ ", routineNo=" + routineNo + ", routineboardTitle=" + routineboardTitle + ", routineboardContent="
				+ routineboardContent + ", routineboardCount=" + routineboardCount + ", routineboardDate="
				+ routineboardDate + ", routineboardShare=" + routineboardShare + ", boardCategoryNumber="
				+ boardCategoryNumber + ", rCnt=" + rCnt + "]";
	}
	public int getRoutineboardNo() {
		return routineboardNo;
	}
	public void setRoutineboardNo(int routineboardNo) {
		this.routineboardNo = routineboardNo;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public int getRoutineNo() {
		return routineNo;
	}
	public void setRoutineNo(int routineNo) {
		this.routineNo = routineNo;
	}
	public String getRoutineboardTitle() {
		return routineboardTitle;
	}
	public void setRoutineboardTitle(String routineboardTitle) {
		this.routineboardTitle = routineboardTitle;
	}
	public String getRoutineboardContent() {
		return routineboardContent;
	}
	public void setRoutineboardContent(String routineboardContent) {
		this.routineboardContent = routineboardContent;
	}
	public int getRoutineboardCount() {
		return routineboardCount;
	}
	public void setRoutineboardCount(int routineboardCount) {
		this.routineboardCount = routineboardCount;
	}
	public Date getRoutineboardDate() {
		return routineboardDate;
	}
	public void setRoutineboardDate(Date routineboardDate) {
		this.routineboardDate = routineboardDate;
	}
	public int getRoutineboardShare() {
		return routineboardShare;
	}
	public void setRoutineboardShare(int routineboardShare) {
		this.routineboardShare = routineboardShare;
	}
	public int getBoardCategoryNumber() {
		return boardCategoryNumber;
	}
	public void setBoardCategoryNumber(int boardCategoryNumber) {
		this.boardCategoryNumber = boardCategoryNumber;
	}
	public int getrCnt() {
		return rCnt;
	}
	public void setrCnt(int rCnt) {
		this.rCnt = rCnt;
	}
	
	
	
	
	
	
	
}
