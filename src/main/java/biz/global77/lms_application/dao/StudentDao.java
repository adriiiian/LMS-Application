package biz.global77.lms_application.dao;

import java.util.List;

import biz.global77.lms_application.model.Student;

public interface StudentDao {
	
	public void addStudent(Student student);
	
	public void editStudent(int id, String firstname, String lastname, String email);
	
	public List<Student> getStudents();
}
