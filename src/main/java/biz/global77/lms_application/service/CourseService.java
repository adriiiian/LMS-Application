package biz.global77.lms_application.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import biz.global77.lms_application.model.Course;
import biz.global77.lms_application.repository.CourseRepository;
import jakarta.validation.Valid;

@Validated
@Service
public class CourseService {
	
	@Autowired
	private CourseRepository courseRepository;
	
	public void insertCourse(@Valid Course course) {
		courseRepository.addCourses(course);
	}
	
	public List<Course> getCourses(){
		return courseRepository.getCourses();
	}
	
	public void editCourse(@Valid Course course) {
		courseRepository.editCourse(course.getId(), course.getCode(), course.getTitle(), course.getDescription(), course.getTeacher_id());
	}
	
	public void deleteCourse(int course_id) {
		courseRepository.deleteCourse(course_id);
	}
}
