package biz.global77.lms_application.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import biz.global77.lms_application.dao.CourseDao;
import biz.global77.lms_application.model.Course;

@Repository
public class CourseRepository implements CourseDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void addCourses(Course course) {
		String query = "INSERT INTO course (code, title, description, teacher_id) values (?, ?, ?, ?)";
		jdbcTemplate.update(query, course.getCode(), course.getTitle(), course.getDescription(), course.getTeacher_id());	
		
	}
	
	@Override
	public void editCourse(int id, String code, String title, String description, int teacher_id) {
		String query = "UPDATE course set code = ?, title = ?, description = ?, teacher_id = ? where id = ?";
		jdbcTemplate.update(query, code, title, description, teacher_id, id);
	}

	@Override
	public List<Course> getCourses() {
		String query = "SELECT * from course";
		
		List<Course> courses = jdbcTemplate.query(query, new RowMapper<Course>() {

			@Override
			public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				return new Course(rs.getInt("id"), rs.getString("code"), rs.getString("title"), rs.getString("description"), rs.getInt("teacher_id"));
			}
			
		});
		return courses;
	}

	@Override
	public void deleteCourse(int course_id) {
		String query = "DELETE from course where id = ?";
		jdbcTemplate.update(query, course_id);
		
	}

}
