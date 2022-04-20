package kh.semi.mtt.notice.model.vo;

import java.sql.Timestamp;

public class NoticeVo {
	
	private int noticeNo;
	private int memberNo;
	private String notiTitle;
	private String notiContent;
	private int notiCnt;
	private Timestamp notiDate;
	
	
	public NoticeVo(int noticeNo, int memberNo, String notiTitle, String notiContent, int notiCnt, Timestamp notiDate) {
		super();
		this.noticeNo = noticeNo;
		this.memberNo = memberNo;
		this.notiTitle = notiTitle;
		this.notiContent = notiContent;
		this.notiCnt = notiCnt;
		this.notiDate = notiDate;
	}
	
	public NoticeVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "NoticeVo [noticeNo=" + noticeNo + ", memberNo=" + memberNo + ", notiTitle=" + notiTitle
				+ ", notiContent=" + notiContent + ", notiCnt=" + notiCnt + ", notiDate=" + notiDate + "]";
	}
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getNotiTitle() {
		return notiTitle;
	}
	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}
	public String getNotiContent() {
		return notiContent;
	}
	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}
	public int getNotiCnt() {
		return notiCnt;
	}
	public void setNotiCnt(int notiCnt) {
		this.notiCnt = notiCnt;
	}
	public Timestamp getNotiDate() {
		return notiDate;
	}
	public void setNotiDate(Timestamp notiDate) {
		this.notiDate = notiDate;
	}
	
	

}
