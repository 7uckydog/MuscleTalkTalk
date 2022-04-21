package kh.semi.mtt.board.model.vo;

//import java.sql.Date;
import java.util.Date;

public class BoardVo {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private Date boardDate;
	private int boardType;
	private String memberNickname;
	private int boardCategoryNumber;
	public BoardVo() {}
	
	
	
	public BoardVo(int boardNo, String boardTitle, String boardContent, int boardCount, Date boardDate, int boardType,
			int memberNo) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.boardDate = boardDate;
		this.boardType = boardType;
		this.memberNickname = memberNickname;
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
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}



	@Override
	public String toString() {
		return "BoardVo [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardCount=" + boardCount + ", boardDate=" + boardDate + ", boardType=" + boardType
				+ ", memberNickname=" + memberNickname + ", boardCategoryNumber=" + boardCategoryNumber + "]";
	}

	public BoardVo(int boardNo, String boardTitle, String boardContent, int boardCount, Date boardDate, int boardType,
			String memberNickname, int boardCategoryNumber) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.boardDate = boardDate;
		this.boardType = boardType;
		this.memberNickname = memberNickname;
		this.boardCategoryNumber = boardCategoryNumber;
	}



	public int getBoardCategoryNumber() {
		return boardCategoryNumber;
	}



	public void setBoardCategoryNumber(int boardCategoryNumber) {
		this.boardCategoryNumber = boardCategoryNumber;
	}
	
	
	
	
	
	
	
}
