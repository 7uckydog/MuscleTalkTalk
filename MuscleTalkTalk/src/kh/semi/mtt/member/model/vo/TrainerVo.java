package kh.semi.mtt.member.model.vo;

public class TrainerVo {
	private int trainerNo;
	private String trainerFile;
	private String gymName;
	private String gymLocation;

	@Override
	public String toString() {
		return "TrainerVo [trainerNo=" + trainerNo + ", trainerFile=" + trainerFile + ", gymName=" + gymName
				+ ", gymLocation=" + gymLocation + "]";
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
