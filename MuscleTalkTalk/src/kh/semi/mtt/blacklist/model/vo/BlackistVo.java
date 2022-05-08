package kh.semi.mtt.blacklist.model.vo;

import java.sql.Date;

public class BlackistVo {
	private int blacklistNo;
	private int trainerNo;
	private int memberNo;
	private Date blacklistDate;
	private String memberName;
	
	@Override
	public String toString() {
		return "BlackistVo [blacklistNo=" + blacklistNo + ", trainerNo=" + trainerNo + ", memberNo=" + memberNo + ", blacklistDate=" + blacklistDate + ", memberName=" + memberName + "]";
	}
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getBlacklistNo() {
		return blacklistNo;
	}
	public void setBlacklistNo(int blacklistNo) {
		this.blacklistNo = blacklistNo;
	}
	public int getTrainerNo() {
		return trainerNo;
	}
	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public Date getBlacklistDate() {
		return blacklistDate;
	}
	public void setBlacklistDate(Date blacklistDate) {
		this.blacklistDate = blacklistDate;
	}
	
	
}
