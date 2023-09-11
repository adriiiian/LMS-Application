package biz.global77.lms_application.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import biz.global77.lms_application.model.Teacher;
import biz.global77.lms_application.repository.TeacherRepository;
import jakarta.validation.Valid;

@Validated
@Service
public class TeacherService {
	
	@Autowired
	private TeacherRepository teacherRepository;
	
	public void insertTeacher(@Valid Teacher teacher) {
		teacherRepository.addTeacher(teacher);
	}
	
	public void editTeacher(@Valid Teacher teacher) {
		teacherRepository.editTeacher(teacher.getId(), teacher.getFirstname(), teacher.getLastname(), teacher.getEmail());
	}
	
	public List<Teacher> getTeachers(){
		return teacherRepository.getTeachers();
	}
}
