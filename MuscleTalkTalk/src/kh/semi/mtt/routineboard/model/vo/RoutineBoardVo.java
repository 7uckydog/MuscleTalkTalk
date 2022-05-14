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
	
	private	int memberNo;
	private String routineName;
	private	String routineDisable;
	private	String routineTarget;
	private String routineContent;
	private	int routineExplanation;
	private int routineSetRestTime;
	private int routineExerciseRestTime;
	
	
	public RoutineBoardVo() {
		super();
	}


	
	
	
	
	
	@Override
	public String toString() {
		return "RoutineBoardVo [routineboardNo=" + routineboardNo + ", memberNickname=" + memberNickname
				+ ", routineNo=" + routineNo + ", routineboardTitle=" + routineboardTitle + ", routineboardContent="
				+ routineboardContent + ", routineboardCount=" + routineboardCount + ", routineboardDate="
				+ routineboardDate + ", routineboardShare=" + routineboardShare + ", boardCategoryNumber="
				+ boardCategoryNumber + ", rCnt=" + rCnt + ", memberNo=" + memberNo + ", routineName=" + routineName
				+ ", routineDisable=" + routineDisable + ", routineTarget=" + routineTarget + ", routineContent="
				+ routineContent + ", routineExplanation=" + routineExplanation + ", routineSetRestTime="
				+ routineSetRestTime + ", routineExerciseRestTime=" + routineExerciseRestTime + "]";
	}







	public RoutineBoardVo(int routineboardNo, String memberNickname, int routineNo, String routineboardTitle,
			String routineboardContent, int routineboardCount, Date routineboardDate, int routineboardShare,
			int boardCategoryNumber, int rCnt, int memberNo, String routineName, String routineDisable,
			String routineTarget, String routineContent, int routineExplanation, int routineSetRestTime,
			int routineExerciseRestTime) {
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
		this.memberNo = memberNo;
		this.routineName = routineName;
		this.routineDisable = routineDisable;
		this.routineTarget = routineTarget;
		this.routineContent = routineContent;
		this.routineExplanation = routineExplanation;
		this.routineSetRestTime = routineSetRestTime;
		this.routineExerciseRestTime = routineExerciseRestTime;
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


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getRoutineName() {
		return routineName;
	}


	public void setRoutineName(String routineName) {
		this.routineName = routineName;
	}


	public String getRoutineDisable() {
		return routineDisable;
	}


	public void setRoutineDisable(String routineDisable) {
		this.routineDisable = routineDisable;
	}


	public String getRoutineTarget() {
		return routineTarget;
	}


	public void setRoutineTarget(String routineTarget) {
		this.routineTarget = routineTarget;
	}


	public String getRoutineContent() {
		return routineContent;
	}


	public void setRoutineContent(String routineContent) {
		this.routineContent = routineContent;
	}


	public int getRoutineExplanation() {
		return routineExplanation;
	}


	public void setRoutineExplanation(int routineExplanation) {
		this.routineExplanation = routineExplanation;
	}


	public int getRoutineSetRestTime() {
		return routineSetRestTime;
	}


	public void setRoutineSetRestTime(int routineSetRestTime) {
		this.routineSetRestTime = routineSetRestTime;
	}


	public int getRoutineExerciseRestTime() {
		return routineExerciseRestTime;
	}


	public void setRoutineExerciseRestTime(int routineExerciseRestTime) {
		this.routineExerciseRestTime = routineExerciseRestTime;
	}
	
	
	
	
	
	
	
	
	
	
}
