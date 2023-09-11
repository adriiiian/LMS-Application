package biz.global77.lms_application.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class Course {
	
	private int id;
	@NotNull
	@NotBlank
	private String code;
	@NotNull
	@NotBlank
	private String title;
	@NotNull
	@NotBlank
	private String description;
	@NotNull
	private int teacher_id;
	
	public Course() {}
	
	public Course(int id, String code, String title, String description, int teacher_id) {
		super();
		this.id = id;
		this.code = code;
		this.title = title;
		this.description = description;
		this.teacher_id = teacher_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", code=" + code + ", title=" + title + ", description=" + description
				+ ", teacher_id=" + teacher_id + "]";
	}
}
