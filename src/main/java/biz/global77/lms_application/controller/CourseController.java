package biz.global77.lms_application.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import biz.global77.lms_application.model.Course;
import biz.global77.lms_application.model.Teacher;
import biz.global77.lms_application.service.CourseService;
import biz.global77.lms_application.service.StudentCourseService;
import biz.global77.lms_application.service.TeacherService;
import jakarta.validation.Valid;

@Controller
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private StudentCourseService studentCourseService;
	
	@RequestMapping(value = "/course", method = RequestMethod.GET)
	public ModelAndView student(ModelMap model) {
		
		List<Teacher> teachers = teacherService.getTeachers();
		List<Course> courses = courseService.getCourses();
		
		model.addAttribute("teachers", teachers);
		model.addAttribute("courses", courses);
		
		return new ModelAndView("course", "course", new Course());
	}
	
	@RequestMapping(value = "/addCourse", method = RequestMethod.POST)
	public String submit(@ModelAttribute("course") @Valid Course course, BindingResult result, ModelMap model) {
		
		if(!result.hasErrors()) {
			courseService.insertCourse(course);
			
			List<Teacher> teachers = teacherService.getTeachers();
			List<Course> courses = courseService.getCourses();
			
			model.addAttribute("teachers", teachers);
			model.addAttribute("courses", courses);
			model.addAttribute("course", new Course());
			return "course";
		}
		
		else {
			List<Teacher> teachers = teacherService.getTeachers();
			List<String> teacherOptions = new ArrayList<>(teachers.size());
			List<Course> courses = courseService.getCourses();
			
			for (Teacher teacher : teachers) {
				String teacherString = String.valueOf(teacher.getId()) + " : " + teacher.getFirstname() + " " + teacher.getLastname();
				teacherOptions.add(teacherString);
			}
			
			model.addAttribute("teachers", teachers);
			model.addAttribute("courses", courses);
			model.addAttribute("error", result);
			model.addAttribute("showModal", true);
			return "course";
		}
	}
	
	@RequestMapping(value = "/editCourse", method = RequestMethod.POST)
	public String editSubmit(@ModelAttribute("course") @Valid Course course, BindingResult result, ModelMap model) {
		
		if(!result.hasErrors()) {
			courseService.editCourse(course);
			List<Teacher> teachers = teacherService.getTeachers();
			List<Course> courses = courseService.getCourses();
			
			model.addAttribute("teachers", teachers);
			model.addAttribute("courses", courses);
			model.addAttribute("course", new Course());
			return "course";
		}
		
		else {
			List<Teacher> teachers = teacherService.getTeachers();
			List<String> teacherOptions = new ArrayList<>(teachers.size());
			List<Course> courses = courseService.getCourses();
			
			for (Teacher teacher : teachers) {
				String teacherString = String.valueOf(teacher.getId()) + " : " + teacher.getFirstname() + " " + teacher.getLastname();
				teacherOptions.add(teacherString);
			}
			
			model.addAttribute("teachers", teachers);
			model.addAttribute("courses", courses);
			model.addAttribute("error", result);
			model.addAttribute("course", course);
			model.addAttribute("showModalEdit", true);
			model.addAttribute("courseId", course.getId());
			return "course";
		}
	}
	
	@RequestMapping(value = "/deleteCourse", method = RequestMethod.POST)
	public String deleteSubmit(@ModelAttribute("course") Course course, ModelMap model) {
		studentCourseService.deleteCourse(course.getId());
		courseService.deleteCourse(course.getId());
		List<Teacher> teachers = teacherService.getTeachers();
		List<Course> courses = courseService.getCourses();
		
		model.addAttribute("teachers", teachers);
		model.addAttribute("courses", courses);
		model.addAttribute("course", new Course());
		return "course";
	}
}
