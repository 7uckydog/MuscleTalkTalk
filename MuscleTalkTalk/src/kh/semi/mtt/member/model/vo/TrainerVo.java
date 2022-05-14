package kh.semi.mtt.member.model.vo;

import java.sql.Date;

public class TrainerVo {
	private int trainerNo;
	private String trainerFile;
	private String gymName;
	private String gymLocation;
	//readall기능으로 인해 변수추가 (진정)
	private String memberNickname;
	private Date memberJoinDate;
	private int sumPrice;
	private String trainerConfirm;
	private int rownum;
	private int ptNo;
	
	@Override
	public String toString() {
		return "TrainerVo [trainerNo=" + trainerNo + ", trainerFile=" + trainerFile + ", gymName=" + gymName
				+ ", gymLocation=" + gymLocation + ", memberNickname=" + memberNickname + ", memberJoinDate="
				+ memberJoinDate + ", sumPrice=" + sumPrice + ", trainerConfirm=" + trainerConfirm + ", rownum="
				+ rownum + ", ptNo=" + ptNo + "]";
	}
	public TrainerVo(int trainerNo, String trainerFile, String gymName, String gymLocation, String memberNickname,
			Date memberJoinDate, int sumPrice, String trainerConfirm, int rownum, int ptNo) {
		super();
		this.trainerNo = trainerNo;
		this.trainerFile = trainerFile;
		this.gymName = gymName;
		this.gymLocation = gymLocation;
		this.memberNickname = memberNickname;
		this.memberJoinDate = memberJoinDate;
		this.sumPrice = sumPrice;
		this.trainerConfirm = trainerConfirm;
		this.rownum = rownum;
		this.ptNo = ptNo;
	}
	public TrainerVo() {
		super();
	}
	public int getTrainerNo() {
		return trainerNo;
	}
	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}
	public String getTrainerFile() {
		return trainerFile;
	}
	public void setTrainerFile(String trainerFile) {
		this.trainerFile = trainerFile;
	}
	public String getGymName() {
		return gymName;
	}
	public void setGymName(String gymName) {
		this.gymName = gymName;
	}
	public String getGymLocation() {
		return gymLocation;
	}
	public void setGymLocation(String gymLocation) {
		this.gymLocation = gymLocation;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public Date getMemberJoinDate() {
		return memberJoinDate;
	}
	public void setMemberJoinDate(Date memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}
	public int getSumPrice() {
		return sumPrice;
	}
	public void setSumPrice(int sumPrice) {
		this.sumPrice = sumPrice;
	}
	public String getTrainerConfirm() {
		return trainerConfirm;
	}
	public void setTrainerConfirm(String trainerConfirm) {
		this.trainerConfirm = trainerConfirm;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getPtNo() {
		return ptNo;
	}
	public void setPtNo(int ptNo) {
		this.ptNo = ptNo;
	}
	
}
