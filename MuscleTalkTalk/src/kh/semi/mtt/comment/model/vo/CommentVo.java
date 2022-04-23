package kh.semi.mtt.comment.model.vo;

import java.sql.Timestamp;
import java.util.ArrayList;



public class CommentVo {

//	COMMENT_NO        NOT NULL NUMBER        
//	BOARD_NO                   NUMBER        
//	ROUTINE_BOARD_NO           NUMBER        
//	MEMBER_NO         NOT NULL NUMBER        
//	COMMENT_CONTENT   NOT NULL VARCHAR2(300) 
//	COMMENT_DATE      NOT NULL DATE          
//	COMMENT_EDIT_DATE          DATE      
//	
//	- commentNo: int
//	- commentContent: String
//	- commentCount: int
//	- commentDate: date
//	- commentEditDate: date

	private int commentNo;
	private int boardNo;
	private int routineboardNo;
	private int memberNo;
	private String commentContent;
	private int commentCount;
	private Timestamp commentDate;
	private Timestamp commentEditDate;
	private int rCnt;
	private ArrayList<CommentVo> reCommentList;
	private String memberNickname;
	
	
	
	

	public String getMemberNickname() {
		return memberNickname;
	}


	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}



	
	
	public CommentVo(int commentNo, int boardNo, int routineboardNo, int memberNo, String commentContent,
			int commentCount, Timestamp commentDate, Timestamp commentEditDate, int rCnt,
			ArrayList<CommentVo> reCommentList, String memberNickname) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.routineboardNo = routineboardNo;
		this.memberNo = memberNo;
		this.commentContent = commentContent;
		this.commentCount = commentCount;
		this.commentDate = commentDate;
		this.commentEditDate = commentEditDate;
		this.rCnt = rCnt;
		this.reCommentList = reCommentList;
		this.memberNickname = memberNickname;
	}


	@Override
	public String toString() {
		return "CommentVo [commentNo=" + commentNo + ", boardNo=" + boardNo + ", routineboardNo=" + routineboardNo
				+ ", memberNo=" + memberNo + ", commentContent=" + commentContent + ", commentCount=" + commentCount
				+ ", commentDate=" + commentDate + ", commentEditDate=" + commentEditDate + ", rCnt=" + rCnt
				+ ", reCommentList=" + reCommentList + ", memberNickname=" + memberNickname + "]";
	}


	public int getMemberNo() {
		return memberNo;
	}
	
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public CommentVo(int commentNo, int boardNo, int routineboardNo, String commentContent, int commentCount,
			Timestamp commentDate, Timestamp commentEditDate, int rCnt, ArrayList<CommentVo> reCommentList) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.routineboardNo = routineboardNo;
		this.commentContent = commentContent;
		this.commentCount = commentCount;
		this.commentDate = commentDate;
		this.commentEditDate = commentEditDate;
		this.rCnt = rCnt;
		this.reCommentList = reCommentList;
	}

	public int getrCnt() {
		return rCnt;
	}

	public void setrCnt(int rCnt) {
		this.rCnt = rCnt;
	}

	public ArrayList<CommentVo> getReCommentList() {
		return reCommentList;
	}

	public void setReCommentList(ArrayList<CommentVo> reCommentList) {
		this.reCommentList = reCommentList;
	}

	public CommentVo() {
		super();
	}

	public CommentVo(int commentNo, int boardNo, int routineboardNo, String commentContent, int commentCount,
			Timestamp commentDate, Timestamp commentEditDate) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.routineboardNo = routineboardNo;
		this.commentContent = commentContent;
		this.commentCount = commentCount;
		this.commentDate = commentDate;
		this.commentEditDate = commentEditDate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
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

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public Timestamp getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}

	public Timestamp getCommentEditDate() {
		return commentEditDate;
	}

	public void setCommentEditDate(Timestamp commentEditDate) {
		this.commentEditDate = commentEditDate;
	}

}
