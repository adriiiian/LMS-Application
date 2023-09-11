package biz.global77.lms_application.model;

import jakarta.validation.constraints.NotNull;

public class StudentCourse {
	
	@NotNull
	private int student_id;
	@NotNull
	private int course_id;
	
	public StudentCourse() {}
	
	public StudentCourse(int student_id, int course_id) {
		super();
		this.student_id = student_id;
		this.course_id = course_id;
	}

	public int getStudent_id() {
		return student_id;
	}

	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}

	public int getCourse_id() {
		return course_id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}

	@Override
	public String toString() {
		return "StudentCourse [student_id=" + student_id + ", course_id=" + course_id + "]";
	}
}
