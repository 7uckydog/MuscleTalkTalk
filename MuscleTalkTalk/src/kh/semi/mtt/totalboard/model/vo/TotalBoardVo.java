package kh.semi.mtt.totalboard.model.vo;

import java.util.Date;

public class TotalBoardVo {
	
	private int totalboardR;
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private Date boardDate;
	private String memberNickname;
	private int boardCategoryNumber;
	private int rCnt;
	private int memberNo;
	private int routineboardNo;
	private int routineNo;
	private String routineboardTitle;
	private String routineboardContent;
	private int routineboardCount;
	private Date routineboardDate;
	private int routineboardShare;
	
	
	
	
	public int getTotalboardR() {
		return totalboardR;
	}




	public void setTotalboardR(int totalboardR) {
		this.totalboardR = totalboardR;
	}




	public int getBoardNo() {
		return boardNo;
	}




	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}




	public String getBoardTitle() {
		return boardTitle;
	}




	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}




	public String getBoardContent() {
		return boardContent;
	}




	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}




	public int getBoardCount() {
		return boardCount;
	}




	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}




	public Date getBoardDate() {
		return boardDate;
	}




	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}




	public String getMemberNickname() {
		return memberNickname;
	}




	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
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




	public int getRoutineboardNo() {
		return routineboardNo;
	}




	public void setRoutineboardNo(int routineboardNo) {
		this.routineboardNo = routineboardNo;
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




	public TotalBoardVo() {
		super();
	}




	public TotalBoardVo(int totalboardR, int boardNo, String boardTitle, String boardContent, int boardCount,
			Date boardDate, String memberNickname, int boardCategoryNumber, int rCnt, int memberNo, int routineboardNo,
			int routineNo, String routineboardTitle, String routineboardContent, int routineboardCount,
			Date routineboardDate, int routineboardShare) {
		super();
		this.totalboardR = totalboardR;
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.boardDate = boardDate;
		this.memberNickname = memberNickname;
		this.boardCategoryNumber = boardCategoryNumber;
		this.rCnt = rCnt;
		this.memberNo = memberNo;
		this.routineboardNo = routineboardNo;
		this.routineNo = routineNo;
		this.routineboardTitle = routineboardTitle;
		this.routineboardContent = routineboardContent;
		this.routineboardCount = routineboardCount;
		this.routineboardDate = routineboardDate;
		this.routineboardShare = routineboardShare;
	}




	@Override
	public String toString() {
		return "TotalBoardVo [totalboardR=" + totalboardR + ", boardNo=" + boardNo + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardCount=" + boardCount + ", boardDate=" + boardDate
				+ ", memberNickname=" + memberNickname + ", boardCategoryNumber=" + boardCategoryNumber + ", rCnt="
				+ rCnt + ", memberNo=" + memberNo + ", routineboardNo=" + routineboardNo + ", routineNo=" + routineNo
				+ ", routineboardTitle=" + routineboardTitle + ", routineboardContent=" + routineboardContent
				+ ", routineboardCount=" + routineboardCount + ", routineboardDate=" + routineboardDate
				+ ", routineboardShare=" + routineboardShare + "]";
	}
	
	
	
	
	
	
	
	
}
