package kh.semi.mtt.routine.model.vo;

public class RoutineVo {
	
	private int routineNo;
	private String routineName;
	private	int routineDay;
	private	int routineWeight;
	private	int routineSet;
	private	int routineWeek;
	private	int routineTime;
	private	int routineDistance;
	private	String routineTarget;
	private	int routineSequence;
	private String routineContent;
	
	public RoutineVo() {}
	
	
	

	public int getRoutineNo() {
		return routineNo;
	}




	public String getRoutineName() {
		return routineName;
	}




	public void setRoutineName(String routineName) {
		this.routineName = routineName;
	}




	public int getRoutineDay() {
		return routineDay;
	}




	public void setRoutineDay(int routineDay) {
		this.routineDay = routineDay;
	}




	public int getRoutineWeight() {
		return routineWeight;
	}




	public void setRoutineWeight(int routineWeight) {
		this.routineWeight = routineWeight;
	}




	public int getRoutineSet() {
		return routineSet;
	}




	public void setRoutineSet(int routineSet) {
		this.routineSet = routineSet;
	}




	public int getRoutineWeek() {
		return routineWeek;
	}




	public void setRoutineWeek(int routineWeek) {
		this.routineWeek = routineWeek;
	}




	public int getRoutineTime() {
		return routineTime;
	}




	public void setRoutineTime(int routineTime) {
		this.routineTime = routineTime;
	}




	public int getRoutineDistance() {
		return routineDistance;
	}




	public void setRoutineDistance(int routineDistance) {
		this.routineDistance = routineDistance;
	}




	public String getRoutineTarget() {
		return routineTarget;
	}




	public void setRoutineTarget(String routineTarget) {
		this.routineTarget = routineTarget;
	}




	public int getRoutineSequence() {
		return routineSequence;
	}




	public void setRoutineSequence(int routineSequence) {
		this.routineSequence = routineSequence;
	}




	public String getRoutineContent() {
		return routineContent;
	}




	public void setRoutineContent(String routineContent) {
		this.routineContent = routineContent;
	}




	public void setRoutineNo(int routineNo) {
		this.routineNo = routineNo;
	}




	@Override
	public String toString() {
		return "RoutineVo [routineNo=" + routineNo + ", routineName=" + routineName + ", routineDay=" + routineDay
				+ ", routineWeight=" + routineWeight + ", routineSet=" + routineSet + ", routineWeek=" + routineWeek
				+ ", routineTime=" + routineTime + ", routineDistance=" + routineDistance + ", routineTarget="
				+ routineTarget + ", routineSequence=" + routineSequence + ", routineContent=" + routineContent + "]";
	}




	public RoutineVo(int routineNo, String routineName, int routineDay, int routineWeight, int routineSet,
			int routineWeek, int routineTime, int routineDistance, String routineTarget, int routineSequence,
			String routineContent) {
		super();
		this.routineNo = routineNo;
		this.routineName = routineName;
		this.routineDay = routineDay;
		this.routineWeight = routineWeight;
		this.routineSet = routineSet;
		this.routineWeek = routineWeek;
		this.routineTime = routineTime;
		this.routineDistance = routineDistance;
		this.routineTarget = routineTarget;
		this.routineSequence = routineSequence;
		this.routineContent = routineContent;
	}




	

	

	
	
	
	
	
}
