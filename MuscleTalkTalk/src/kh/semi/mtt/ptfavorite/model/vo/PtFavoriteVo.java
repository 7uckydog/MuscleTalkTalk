package kh.semi.mtt.ptfavorite.model.vo;

public class PtFavoriteVo {
	private int favoriteNo;
	private int memberNo;
	private int ptNo;
	
	@Override
	public String toString() {
		return "PtFavoriteVo [favoriteNo=" + favoriteNo + ", memberNo=" + memberNo + ", ptNo=" + ptNo + "]";
	}
	
	public int getFavoriteNo() {
		return favoriteNo;
	}
	public void setFavoriteNo(int favoriteNo) {
		this.favoriteNo = favoriteNo;
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
	
	
	
}
