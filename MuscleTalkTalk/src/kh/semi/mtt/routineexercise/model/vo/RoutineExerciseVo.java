package kh.semi.mtt.routineexercise.model.vo;

import java.sql.Date;

public class RoutineExerciseVo {
	
	
//	ROUTINE_EXERCISE_NO          NOT NULL NUMBER  
//	EXERCISE_NO                  NOT NULL NUMBER  
//	ROUTINE_NO                   NOT NULL NUMBER  
//	ROUTINE_EXERCISE_DAY                  NUMBER  
//	ROUTINE_WEEK                          NUMBER  
//	ROUTINE_DAY                           NUMBER  
//	ROUTINE_EXERCISE_SET                  NUMBER  
//	ROUTINE_EXERCISE_REPEAT               NUMBER  
//	ROUTINE_EXERCISE_WEIGHT               NUMBER  
//	ROUTINE_EXERCISE_TIME                 NUMBER  
//	ROUTINE_EXERCISE_DISTANCE             NUMBER  
//	ROUTINE_EXERCISE_PERFORM_DAY          DATE    
//	ROUTINE_EXERCISE_D_DAY                DATE    
//	ROUTINE_EXERCISE_SEQUENCE             NUMBER  
//	ROUTINE_EXERCISE_COPY        NOT NULL CHAR(1) 
	
	private int routineExerciseNo;
	private int exerciseNo;
	private int routineNo;
	private int routineExerciseDay;
	private int routineWeek;
	private int routineDay;
	private int routineExerciseSet;
	private int routineExerciseRepeat;
	private int routineExerciseWeight;
	private int routineExerciseTime;
	private int routineExerciseDistance;
	private Date routineExercisePerformDay;
	private Date routineExerciseDDay;
	private int routineExerciseSequence;
	private String routineExerciseCopy;
	@Override
	public String toString() {
		return "RoutineExerciseVo [routineExerciseNo=" + routineExerciseNo + ", exerciseNo=" + exerciseNo
				+ ", routineNo=" + routineNo + ", routineExerciseDay=" + routineExerciseDay + ", routineWeek="
				+ routineWeek + ", routineDay=" + routineDay + ", routineExerciseSet=" + routineExerciseSet
				+ ", routineExerciseRepeat=" + routineExerciseRepeat + ", routineExerciseWeight="
				+ routineExerciseWeight + ", routineExerciseTime=" + routineExerciseTime + ", routineExerciseDistance="
				+ routineExerciseDistance + ", routineExercisePerformDay=" + routineExercisePerformDay
				+ ", routineExerciseDDay=" + routineExerciseDDay + ", routineExerciseSequence="
				+ routineExerciseSequence + ", routineExerciseCopy=" + routineExerciseCopy + "]";
	}
	public int getRoutineExerciseNo() {
		return routineExerciseNo;
	}
	public void setRoutineExerciseNo(int routineExerciseNo) {
		this.routineExerciseNo = routineExerciseNo;
	}
	public int getExerciseNo() {
		return exerciseNo;
	}
	public void setExerciseNo(int exerciseNo) {
		this.exerciseNo = exerciseNo;
	}
	public int getRoutineNo() {
		return routineNo;
	}
	public void setRoutineNo(int routineNo) {
		this.routineNo = routineNo;
	}
	public int getRoutineExerciseDay() {
		return routineExerciseDay;
	}
	public void setRoutineExerciseDay(int routineExerciseDay) {
		this.routineExerciseDay = routineExerciseDay;
	}
	public int getRoutineWeek() {
		return routineWeek;
	}
	public void setRoutineWeek(int routineWeek) {
		this.routineWeek = routineWeek;
	}
	public int getRoutineDay() {
		return routineDay;
	}
	public void setRoutineDay(int routineDay) {
		this.routineDay = routineDay;
	}
	public int getRoutineExerciseSet() {
		return routineExerciseSet;
	}
	public void setRoutineExerciseSet(int routineExerciseSet) {
		this.routineExerciseSet = routineExerciseSet;
	}
	public int getRoutineExerciseRepeat() {
		return routineExerciseRepeat;
	}
	public void setRoutineExerciseRepeat(int routineExerciseRepeat) {
		this.routineExerciseRepeat = routineExerciseRepeat;
	}
	public int getRoutineExerciseWeight() {
		return routineExerciseWeight;
	}
	public void setRoutineExerciseWeight(int routineExerciseWeight) {
		this.routineExerciseWeight = routineExerciseWeight;
	}
	public int getRoutineExerciseTime() {
		return routineExerciseTime;
	}
	public void setRoutineExerciseTime(int routineExerciseTime) {
		this.routineExerciseTime = routineExerciseTime;
	}
	public int getRoutineExerciseDistance() {
		return routineExerciseDistance;
	}
	public void setRoutineExerciseDistance(int routineExerciseDistance) {
		this.routineExerciseDistance = routineExerciseDistance;
	}
	public Date getRoutineExercisePerformDay() {
		return routineExercisePerformDay;
	}
	public void setRoutineExercisePerformDay(Date routineExercisePerformDay) {
		this.routineExercisePerformDay = routineExercisePerformDay;
	}
	public Date getRoutineExerciseDDay() {
		return routineExerciseDDay;
	}
	public void setRoutineExerciseDDay(Date routineExerciseDDay) {
		this.routineExerciseDDay = routineExerciseDDay;
	}
	public int getRoutineExerciseSequence() {
		return routineExerciseSequence;
	}
	public void setRoutineExerciseSequence(int routineExerciseSequence) {
		this.routineExerciseSequence = routineExerciseSequence;
	}
	public String getRoutineExerciseCopy() {
		return routineExerciseCopy;
	}
	public void setRoutineExerciseCopy(String routineExerciseCopy) {
		this.routineExerciseCopy = routineExerciseCopy;
	}
	
	
}
