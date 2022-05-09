package kh.semi.mtt.member.model.vo;

import java.sql.Date;

public class MemberVo {
	private int memberNo;
	private String memberId;
	private String memberPassword;
	private String memberEmail;
	private String memberName;
	private String memberPhone;
	private String memberGender;
	private int memberAge;
	private int memberHeight;
	private int memberWeight;
	private int memberPurpose;
	private int memberConcern;
	private String memberPhoto;
	private String memberPhotoName;
	private String memberTrainer;
	private String memberAbsence;
	private Date memberJoinDate;
	private Date memberLeaveDate;
	private String memberNickname;
	
	private int trainerNo;
	private String trainerFile;
	private String gymName;
	private String gymLocation;

	@Override
	public String toString() {
		return "MemberVo [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPassword=" + memberPassword
				+ ", memberEmail=" + memberEmail + ", memberName=" + memberName + ", memberPhone=" + memberPhone
				+ ", memberGender=" + memberGender + ", memberAge=" + memberAge + ", memberHeight=" + memberHeight
				+ ", memberWeight=" + memberWeight + ", memberPurpose=" + memberPurpose + ", memberConcern="
				+ memberConcern + ", memberPhoto=" + memberPhoto + ", memberPhotoName=" + memberPhotoName
				+ ", memberTrainer=" + memberTrainer + ", memberAbsence=" + memberAbsence + ", memberJoinDate="
				+ memberJoinDate + ", memberLeaveDate=" + memberLeaveDate + ", memberNickname=" + memberNickname
				+ ", trainerNo=" + trainerNo + ", trainerFile=" + trainerFile + ", gymName=" + gymName
				+ ", gymLocation=" + gymLocation + "]";
	}

	
	public String getMemberPhotoName() {
		return memberPhotoName;
	}


	public void setMemberPhotoName(String memberPhotoName) {
		this.memberPhotoName = memberPhotoName;
	}


	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public int getMemberAge() {
		return memberAge;
	}
	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}
	public int getMemberHeight() {
		return memberHeight;
	}
	public void setMemberHeight(int memberHeight) {
		this.memberHeight = memberHeight;
	}
	public int getMemberWeight() {
		return memberWeight;
	}
	public void setMemberWeight(int memberWeight) {
		this.memberWeight = memberWeight;
	}
	public int getMemberPurpose() {
		return memberPurpose;
	}
	public void setMemberPurpose(int memberPurpose) {
		this.memberPurpose = memberPurpose;
	}
	public int getMemberConcern() {
		return memberConcern;
	}
	public void setMemberConcern(int memberConcern) {
		this.memberConcern = memberConcern;
	}
	public String getMemberPhoto() {
		return memberPhoto;
	}
	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}
	public String getMemberTrainer() {
		return memberTrainer;
	}
	public void setMemberTrainer(String memberTrainer) {
		this.memberTrainer = memberTrainer;
	}
	public String getMemberAbsence() {
		return memberAbsence;
	}
	public void setMemberAbsence(String memberAbsence) {
		this.memberAbsence = memberAbsence;
	}
	public Date getMemberJoinDate() {
		return memberJoinDate;
	}
	public void setMemberJoinDate(Date memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}
	public Date getMemberLeaveDate() {
		return memberLeaveDate;
	}
	public void setMemberLeaveDate(Date memberLeaveDate) {
		this.memberLeaveDate = memberLeaveDate;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
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
	
	
}
