package biz.global77.lms_application.dao;

import java.util.List;

import biz.global77.lms_application.model.Teacher;

public interface TeacherDao {
	
	public void addTeacher(Teacher teacher);
	
	public void editTeacher(int id, String firstname, String lastname, String email);
	
	public List<Teacher> getTeachers();
}
