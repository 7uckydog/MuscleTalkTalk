package kh.semi.mtt.pt.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class PtVo {
	private int ptNo;
	private int trainerNo;
	private String ptName;
	private int ptCategory;
	private String ptCategoryStr;
	private int ptPrice;
	private String ptIntroduce;
	private String ptInformation;
	private String ptTargetStudent;
	private String ptNotice;
	private String ptTrainerInfo;
	private String ptTimeInfo;
	private ArrayList<String> ptFilePathList = null;
	private String ptTrainerName;
	private String ptGymName;
	private String ptLocation;
	private int ptFavorite;
	private String ptStartDate;
	private String ptEndDate;
	private Date ptRegistDate;
	private int favoriteCnt;
	private String ptDelete;
	
	
	
	public String getPtDelete() {
		return ptDelete;
	}

	public void setPtDelete(String ptDelete) {
		this.ptDelete = ptDelete;
	}

	public int getFavoriteCnt() {
		return favoriteCnt;
	}

	public void setFavoriteCnt(int favoriteCnt) {
		this.favoriteCnt = favoriteCnt;
	}


	@Override
	public String toString() {
		return "PtVo [ptNo=" + ptNo + ", trainerNo=" + trainerNo + ", ptName=" + ptName + ", ptCategory=" + ptCategory + ", ptCategoryStr=" + ptCategoryStr + ", ptPrice=" + ptPrice + ", ptIntroduce="
				+ ptIntroduce + ", ptInformation=" + ptInformation + ", ptTargetStudent=" + ptTargetStudent + ", ptNotice=" + ptNotice + ", ptTrainerInfo=" + ptTrainerInfo + ", ptTimeInfo="
				+ ptTimeInfo + ", ptFilePathList=" + ptFilePathList + ", ptTrainerName=" + ptTrainerName + ", ptGymName=" + ptGymName + ", ptLocation=" + ptLocation + ", ptFavorite=" + ptFavorite
				+ ", ptStartDate=" + ptStartDate + ", ptEndDate=" + ptEndDate + ", ptRegistDate=" + ptRegistDate + ", favoriteCnt=" + favoriteCnt + ", ptDelete=" + ptDelete + "]";
	}

	public int getPtNo() {
		return ptNo;
	}

	public void setPtNo(int ptNo) {
		this.ptNo = ptNo;
	}

	public int getTrainerNo() {
		return trainerNo;
	}

	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}

	public String getPtName() {
		return ptName;
	}

	public void setPtName(String ptName) {
		this.ptName = ptName;
	}

	public int getPtCategory() {
		return ptCategory;
	}

	public void setPtCategory(int ptCategory) {
		this.ptCategory = ptCategory;
	}

	public String getPtCategoryStr() {
		return ptCategoryStr;
	}

	public void setPtCategoryStr(String ptCategoryStr) {
		this.ptCategoryStr = ptCategoryStr;
	}

	public int getPtPrice() {
		return ptPrice;
	}

	public void setPtPrice(int ptPrice) {
		this.ptPrice = ptPrice;
	}

	public String getPtIntroduce() {
		return ptIntroduce;
	}

	public void setPtIntroduce(String ptIntroduce) {
		this.ptIntroduce = ptIntroduce;
	}

	public String getPtInformation() {
		return ptInformation;
	}

	public void setPtInformation(String ptInformation) {
		this.ptInformation = ptInformation;
	}

	public String getPtTargetStudent() {
		return ptTargetStudent;
	}

	public void setPtTargetStudent(String ptTargetStudent) {
		this.ptTargetStudent = ptTargetStudent;
	}

	public String getPtNotice() {
		return ptNotice;
	}

	public void setPtNotice(String ptNotice) {
		this.ptNotice = ptNotice;
	}

	public String getPtTrainerInfo() {
		return ptTrainerInfo;
	}

	public void setPtTrainerInfo(String ptTrainerInfo) {
		this.ptTrainerInfo = ptTrainerInfo;
	}

	public String getPtTimeInfo() {
		return ptTimeInfo;
	}

	public void setPtTimeInfo(String ptTimeInfo) {
		this.ptTimeInfo = ptTimeInfo;
	}

	public ArrayList<String> getPtFilePathList() {
		return ptFilePathList;
	}

	public void setPtFilePathList(ArrayList<String> ptFilePathList) {
		this.ptFilePathList = ptFilePathList;
	}

	public String getPtTrainerName() {
		return ptTrainerName;
	}

	public void setPtTrainerName(String ptTrainerName) {
		this.ptTrainerName = ptTrainerName;
	}

	public String getPtGymName() {
		return ptGymName;
	}

	public void setPtGymName(String ptGymName) {
		this.ptGymName = ptGymName;
	}

	public String getPtLocation() {
		return ptLocation;
	}

	public void setPtLocation(String ptLocation) {
		this.ptLocation = ptLocation;
	}

	public int getPtFavorite() {
		return ptFavorite;
	}

	public void setPtFavorite(int ptFavorite) {
		this.ptFavorite = ptFavorite;
	}

	public String getPtStartDate() {
		return ptStartDate;
	}

	public void setPtStartDate(String ptStartDate) {
		this.ptStartDate = ptStartDate;
	}

	public String getPtEndDate() {
		return ptEndDate;
	}

	public void setPtEndDate(String ptEndDate) {
		this.ptEndDate = ptEndDate;
	}

	public Date getPtRegistDate() {
		return ptRegistDate;
	}

	public void setPtRegistDate(Date ptRegistDate) {
		this.ptRegistDate = ptRegistDate;
	}
	
	
	
	
}
