package biz.global77.lms_application.dao;

import java.util.List;

import biz.global77.lms_application.model.Course;

public interface CourseDao {
	
	public void addCourses(Course course);
	
	public void editCourse(int id, String code, String title, String description, int teacher_id);
	
	public List<Course> getCourses();
	
	public void deleteCourse(int id);
}
