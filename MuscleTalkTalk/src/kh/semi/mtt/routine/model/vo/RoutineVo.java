package kh.semi.mtt.routine.model.vo;

public class RoutineVo {
	
	
//	ROUTINE_NO          NOT NULL NUMBER         
//	MEMBER_NO           NOT NULL NUMBER         
//	ROUTINE_NAME        NOT NULL VARCHAR2(200)  
//	ROUTINE_DISABLE     NOT NULL CHAR(1)        
//	ROUTINE_TARGET      NOT NULL CHAR(1)        
//	ROUTINE_CONTENT     NOT NULL VARCHAR2(1000) 
//	ROUTINE_EXPLANATION          VARCHAR2(1000) 
//	
	
	private int routineNo;
	private	int memberNo;
	private String routineName;
	private	String routineDisable;
	private	String routineTarget;
	private String routineContent;
	private	int routineExplanation;
	private int routineSetRestTime;
	private int routineExerciseRestTime;
	
	
	
	
	
	public RoutineVo() {
		super();
	}





	public int getRoutineNo() {
		return routineNo;
	}





	public void setRoutineNo(int routineNo) {
		this.routineNo = routineNo;
	}





	public int getMemberNo() {
		return memberNo;
	}





	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}





	public String getRoutineName() {
		return routineName;
	}





	public void setRoutineName(String routineName) {
		this.routineName = routineName;
	}





	public String getRoutineDisable() {
		return routineDisable;
	}





	public void setRoutineDisable(String routineDisable) {
		this.routineDisable = routineDisable;
	}





	public String getRoutineTarget() {
		return routineTarget;
	}





	public void setRoutineTarget(String routineTarget) {
		this.routineTarget = routineTarget;
	}





	public String getRoutineContent() {
		return routineContent;
	}





	public void setRoutineContent(String routineContent) {
		this.routineContent = routineContent;
	}





	public int getRoutineExplanation() {
		return routineExplanation;
	}





	public void setRoutineExplanation(int routineExplanation) {
		this.routineExplanation = routineExplanation;
	}





	public int getRoutineSetRestTime() {
		return routineSetRestTime;
	}





	public void setRoutineSetRestTime(int routineSetRestTime) {
		this.routineSetRestTime = routineSetRestTime;
	}





	public int getRoutineExerciseRestTime() {
		return routineExerciseRestTime;
	}





	public void setRoutineExerciseRestTime(int routineExerciseRestTime) {
		this.routineExerciseRestTime = routineExerciseRestTime;
	}





	public RoutineVo(int routineNo, int memberNo, String routineName, String routineDisable, String routineTarget,
			String routineContent, int routineExplanation, int routineSetRestTime, int routineExerciseRestTime) {
		super();
		this.routineNo = routineNo;
		this.memberNo = memberNo;
		this.routineName = routineName;
		this.routineDisable = routineDisable;
		this.routineTarget = routineTarget;
		this.routineContent = routineContent;
		this.routineExplanation = routineExplanation;
		this.routineSetRestTime = routineSetRestTime;
		this.routineExerciseRestTime = routineExerciseRestTime;
	}





	@Override
	public String toString() {
		return "RoutineVo [routineNo=" + routineNo + ", memberNo=" + memberNo + ", routineName=" + routineName
				+ ", routineDisable=" + routineDisable + ", routineTarget=" + routineTarget + ", routineContent="
				+ routineContent + ", routineExplanation=" + routineExplanation + ", routineSetRestTime="
				+ routineSetRestTime + ", routineExerciseRestTime=" + routineExerciseRestTime + "]";
	}
	
	
	
	
	



	

	

	
	
	
	
	
}
