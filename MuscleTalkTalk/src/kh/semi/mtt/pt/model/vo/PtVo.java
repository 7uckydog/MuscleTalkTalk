package kh.semi.mtt.pt.model.vo;

import java.util.ArrayList;

public class PtVo {
	private int ptNo;
	private int trainerNo;
	private String ptName;
	private int ptCategory;
	private int ptPrice;
	private String ptIntroduce;
	private String ptInformation;
	private String ptTargetStudent;
	private String ptNotice;
	private String ptTrainerInfo;
	private String ptTimeInfo;
	private ArrayList<String> ptFilePathList = null;
	private String ptTrainerName;
	private String ptLocation;
	private int ptFavorite;

	@Override
	public String toString() {
		return "PtVo [ptNo=" + ptNo + ", trainerNo=" + trainerNo + ", ptName=" + ptName + ", ptCategory=" + ptCategory
				+ ", ptPrice=" + ptPrice + ", ptIntroduce=" + ptIntroduce + ", ptInformation=" + ptInformation
				+ ", ptTargetStudent=" + ptTargetStudent + ", ptNotice=" + ptNotice + ", ptTrainerInfo=" + ptTrainerInfo
				+ ", ptTimeInfo=" + ptTimeInfo + ", ptFilePathList=" + ptFilePathList + ", ptTrainerName="
				+ ptTrainerName + ", ptLocation=" + ptLocation + ", ptFavorite=" + ptFavorite + "]";
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

}
