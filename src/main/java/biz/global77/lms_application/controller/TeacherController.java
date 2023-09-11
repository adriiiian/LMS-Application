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

import biz.global77.lms_application.model.Teacher;
import biz.global77.lms_application.service.TeacherService;
import jakarta.validation.Valid;

@Controller
public class TeacherController {
	
	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping(value = "/teacher", method = RequestMethod.GET)
	public ModelAndView student(ModelMap model) {
		List<Teacher> teachers = teacherService.getTeachers();
		
		model.addAttribute("teachers", teachers);
		return new ModelAndView("teacher", "teacher", new Teacher());
	}
	
	@RequestMapping(value = "/addTeacher", method = RequestMethod.POST)
	public String submit(@ModelAttribute("teacher") @Valid Teacher teacher, BindingResult result, ModelMap model) {
		
		if(!result.hasErrors()) {
			teacherService.insertTeacher(teacher);
			
			List<Teacher> teachers = teacherService.getTeachers();
			
			model.addAttribute("teachers", teachers);
			model.addAttribute("teacher", new Teacher());
			return "teacher";
		}
		else {
			List<Teacher> teachers = teacherService.getTeachers();
			
			model.addAttribute("teachers", teachers);
			model.addAttribute("error", result);
			model.addAttribute("showModal", true);
			return "teacher";
		}
	}
	
	@RequestMapping(value = "/editTeacher", method = RequestMethod.POST)
	public String editSubmit(@ModelAttribute("teacher") @Valid Teacher teacher, BindingResult result, ModelMap model) {
		
		if(!result.hasErrors()) {
			teacherService.editTeacher(teacher);
			
			List<Teacher> teachers = teacherService.getTeachers();
			
			model.addAttribute("teachers", teachers);
			model.addAttribute("teacher", new Teacher());
			return "teacher";
		}
		else {
			List<Teacher> teachers = teacherService.getTeachers();
			
			model.addAttribute("teachers", teachers);
			model.addAttribute("error", result);
			model.addAttribute("teacher", teacher);
			model.addAttribute("modalId", teacher.getId());
			return "teacher";
		}
	}
}
