package kh.semi.mtt.exercise.model.vo;

public class ExerciseVo {
//	EXERCISE_NO   NOT NULL NUMBER        
//	EXERCISE_NAME NOT NULL VARCHAR2(100) 
//	EXERCISE_PART NOT NULL CHAR(1) 
	
	private int exerciseNo;
	private String exerciseName;
	private String exercisePart;
	
	
	public ExerciseVo() {
		super();
	}
	
	

	public ExerciseVo(int exerciseNo, String exerciseName, String exercisePart) {
		super();
		this.exerciseNo = exerciseNo;
		this.exerciseName = exerciseName;
		this.exercisePart = exercisePart;
	}



	public int getExerciseNo() {
		return exerciseNo;
	}

	public void setExerciseNo(int exerciseNo) {
		this.exerciseNo = exerciseNo;
	}

	public String getExerciseName() {
		return exerciseName;
	}

	public void setExerciseName(String exerciseName) {
		this.exerciseName = exerciseName;
	}

	public String getExercisePart() {
		return exercisePart;
	}

	
	public void setExercisePart(String exercisePart) {
		this.exercisePart = exercisePart;
	}



	@Override
	public String toString() {
		return "ExerciseVo [exerciseNo=" + exerciseNo + ", exerciseName=" + exerciseName + ", exercisePart="
				+ exercisePart + "]";
	}
	
	
	
}
