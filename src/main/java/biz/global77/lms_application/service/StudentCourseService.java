package biz.global77.lms_application.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import biz.global77.lms_application.model.StudentCourse;
import biz.global77.lms_application.repository.StudentCourseRepository;
import jakarta.validation.Valid;

@Validated
@Service
public class StudentCourseService {
	
	@Autowired
	private StudentCourseRepository studentCourseRepository;
	
	public void insertEnrollment(@Valid StudentCourse studentCourse) {
		studentCourseRepository.enrollCourse(studentCourse);
	}
	
	public List<StudentCourse> getEnrolledCourses(){
		return studentCourseRepository.getEnrolledCourse();
	}
	
	public void deleteCourse(int course_id) {
		studentCourseRepository.deleteCourse(course_id);
	}

}
