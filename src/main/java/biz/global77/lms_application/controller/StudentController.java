package biz.global77.lms_application.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import biz.global77.lms_application.model.Course;
import biz.global77.lms_application.model.Student;
import biz.global77.lms_application.model.StudentCourse;
import biz.global77.lms_application.service.CourseService;
import biz.global77.lms_application.service.StudentCourseService;
import biz.global77.lms_application.service.StudentService;
import jakarta.validation.Valid;

@Controller
public class StudentController implements WebMvcConfigurer{
	
	@Autowired
	private StudentService studentService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private StudentCourseService studentCourseService;
	
	@RequestMapping(value = "/student", method = RequestMethod.GET)
	public ModelAndView student(ModelMap model) {
		List<Student> students = studentService.getStudents();
		List<Course> courses = courseService.getCourses();
		List<StudentCourse> enrolledCourses = studentCourseService.getEnrolledCourses();
		
		model.addAttribute("students", students);
		model.addAttribute("courses", courses);
		model.addAttribute("enrolledcourses", enrolledCourses);
		model.addAttribute("studentcourse", new StudentCourse());
		return new ModelAndView("student", "student", new Student());
	}
	
	@RequestMapping(value = "/enrollStudent", method = RequestMethod.POST)
	public String submit(@ModelAttribute("student") @Valid Student student, BindingResult result, ModelMap model) {
		
		if(!result.hasErrors()) {
			studentService.insertStudent(student);
			List<Student> students = studentService.getStudents();
			List<Course> courses = courseService.getCourses();
			List<StudentCourse> enrolledCourses = studentCourseService.getEnrolledCourses();
			
			model.addAttribute("students", students);
			model.addAttribute("courses", courses);
			model.addAttribute("enrolledcourses", enrolledCourses);
			model.addAttribute("studentcourse", new StudentCourse());
			model.addAttribute("student", new Student());
			return "student";
		}
		else {
			List<Student> students = studentService.getStudents();
			List<Course> courses = courseService.getCourses();
			List<StudentCourse> enrolledCourses = studentCourseService.getEnrolledCourses();
			
			model.addAttribute("students", students);
			model.addAttribute("courses", courses);
			model.addAttribute("enrolledcourses", enrolledCourses);
			model.addAttribute("studentcourse", new StudentCourse());
			model.addAttribute("error", result);
			model.addAttribute("showModal", true);
			return "student";
		}
	}
	
	@RequestMapping(value = "/editStudent", method = RequestMethod.POST)
	public String editSubmit(@ModelAttribute("student") @Valid Student student, BindingResult result, ModelMap model) {
		
		if(!result.hasErrors()) {
			studentService.editStudent(student);
			List<Student> students = studentService.getStudents();
			List<Course> courses = courseService.getCourses();
			List<StudentCourse> enrolledCourses = studentCourseService.getEnrolledCourses();
			
			model.addAttribute("students", students);
			model.addAttribute("courses", courses);
			model.addAttribute("enrolledcourses", enrolledCourses);
			model.addAttribute("studentcourse", new StudentCourse());
			model.addAttribute("student", new Student());
			return "student";
		}
		else {
			List<Student> students = studentService.getStudents();
			List<Course> courses = courseService.getCourses();
			List<StudentCourse> enrolledCourses = studentCourseService.getEnrolledCourses();
			
			model.addAttribute("students", students);
			model.addAttribute("courses", courses);
			model.addAttribute("enrolledcourses", enrolledCourses);
			model.addAttribute("studentcourse", new StudentCourse());
			model.addAttribute("error", result);
			model.addAttribute("student", student);
			model.addAttribute("modalId", student.getId());
			return "student";
		}
	}
	
	@RequestMapping(value = "/enrollCourse", method = RequestMethod.POST)
	public String enrollCourse(@ModelAttribute("studentcourse") @Valid StudentCourse studentCourse, BindingResult result, ModelMap model) {
		
		if(!result.hasErrors()) {
			studentCourseService.insertEnrollment(studentCourse);
			List<Student> students = studentService.getStudents();
			List<Course> courses = courseService.getCourses();
			List<StudentCourse> enrolledCourses = studentCourseService.getEnrolledCourses();
			
			model.addAttribute("students", students);
			model.addAttribute("courses", courses);
			model.addAttribute("enrolledcourses", enrolledCourses);
			model.addAttribute("studentcourse", new StudentCourse());
			model.addAttribute("student", new Student());
			return "student";
		}
		else {
			List<Student> students = studentService.getStudents();
			List<Course> courses = courseService.getCourses();
			List<StudentCourse> enrolledCourses = studentCourseService.getEnrolledCourses();
			
			model.addAttribute("students", students);
			model.addAttribute("courses", courses);
			model.addAttribute("enrolledcourses", enrolledCourses);
			model.addAttribute("studentcourse", new StudentCourse());
			model.addAttribute("error", result);
			model.addAttribute("showModalEnroll", true);
			return "student";
		}
	}
}
