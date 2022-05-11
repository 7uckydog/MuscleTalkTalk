package kh.semi.mtt.review.model.vo;

public class ReviewVo {
	private int reviewNo;
	private int memberNo;
	private int ptNo;
	private String reviewContent;
	private String memberNickname;
	private String memberPhoto;
	
	@Override
	public String toString() {
		return "ReviewVo [reviewNo=" + reviewNo + ", memberNo=" + memberNo + ", ptNo=" + ptNo + ", reviewContent=" + reviewContent + ", memberNickname=" + memberNickname + ", memberPhoto="
				+ memberPhoto + "]";
	}
	
	
	
	public String getMemberNickname() {
		return memberNickname;
	}



	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}



	public String getMemberPhoto() {
		return memberPhoto;
	}



	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}



	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getPtNo() {
		return ptNo;
	}
	public void setPtNo(int ptNo) {
		this.ptNo = ptNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	
	
}
