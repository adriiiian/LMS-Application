package biz.global77.lms_application.dao;

import java.util.List;

import biz.global77.lms_application.model.StudentCourse;

public interface StudentCourseDao {
	
	public void enrollCourse(StudentCourse studentCourse);
	
	public List<StudentCourse> getEnrolledCourse();
	
	public void deleteCourse(int course_id);
}
