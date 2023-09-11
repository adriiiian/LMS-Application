package biz.global77.lms_application.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import biz.global77.lms_application.model.Student;
import biz.global77.lms_application.repository.StudentRepository;
import jakarta.validation.Valid;

@Validated
@Service
public class StudentService {
	
	@Autowired
	private StudentRepository studentRepository;
	
	public void insertStudent(@Valid Student student) {
		studentRepository.addStudent(student);
	}
	
	public void editStudent(@Valid Student student) {
		studentRepository.editStudent(student.getId(), student.getFirstname(), student.getLastname(), student.getEmail());
	}
	
	public List<Student> getStudents(){
		return studentRepository.getStudents();
	}
}
