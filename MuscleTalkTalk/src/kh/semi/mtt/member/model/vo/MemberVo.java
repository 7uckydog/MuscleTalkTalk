package kh.semi.mtt.member.model.vo;

public class MemberVo {
//	private String mId;
//	private String mNickname;
//	private String email;
//	private String phone;
//	private String password;
	
	private String memberId;
	private String memberPassword;
	private String memberEmail;
	private String memberName;
	private String memberPhone;
	private String memberGender;
	private String memberAge;
	private String memberHeight;
	private String memberWeight;
	private String memberPurpose;
	private String memberConcern;
	private String memberPhoto;
	private String memberTrainer;
	private String memberAbsence;
	private String memberJoinDate;
	private String memberLeaveDate;
	private String memberNickname;
	
	@Override
	public String toString() {
		return "MemberVo [memberId=" + memberId + ", memberPassword=" + memberPassword + ", memberEmail=" + memberEmail
				+ ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", memberGender=" + memberGender
				+ ", memberAge=" + memberAge + ", memberHeight=" + memberHeight + ", memberWeight=" + memberWeight
				+ ", memberPurpose=" + memberPurpose + ", memberConcern=" + memberConcern + ", memberPhoto="
				+ memberPhoto + ", memberTrainer=" + memberTrainer + ", memberAbsence=" + memberAbsence
				+ ", memberJoinDate=" + memberJoinDate + ", memberLeaveDate=" + memberLeaveDate + ", memberNickname="
				+ memberNickname + "]";
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
	public String getMemberAge() {
		return memberAge;
	}
	public void setMemberAge(String memberAge) {
		this.memberAge = memberAge;
	}
	public String getMemberHeight() {
		return memberHeight;
	}
	public void setMemberHeight(String memberHeight) {
		this.memberHeight = memberHeight;
	}
	public String getMemberWeight() {
		return memberWeight;
	}
	public void setMemberWeight(String memberWeight) {
		this.memberWeight = memberWeight;
	}
	public String getMemberPurpose() {
		return memberPurpose;
	}
	public void setMemberPurpose(String memberPurpose) {
		this.memberPurpose = memberPurpose;
	}
	public String getMemberConcern() {
		return memberConcern;
	}
	public void setMemberConcern(String memberConcern) {
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
	public String getMemberJoinDate() {
		return memberJoinDate;
	}
	public void setMemberJoinDate(String memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}
	public String getMemberLeaveDate() {
		return memberLeaveDate;
	}
	public void setMemberLeaveDate(String memberLeaveDate) {
		this.memberLeaveDate = memberLeaveDate;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	
	
	
}
