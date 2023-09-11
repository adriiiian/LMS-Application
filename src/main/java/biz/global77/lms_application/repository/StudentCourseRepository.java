package biz.global77.lms_application.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import biz.global77.lms_application.dao.StudentCourseDao;
import biz.global77.lms_application.model.StudentCourse;

@Repository
public class StudentCourseRepository implements StudentCourseDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void enrollCourse(StudentCourse studentCourse) {
		String query = "INSERT INTO student_course (student_id, course_id) values (?, ?)";
		jdbcTemplate.update(query, studentCourse.getStudent_id(), studentCourse.getCourse_id());
		
	}

	@Override
	public List<StudentCourse> getEnrolledCourse() {
		String query = "SELECT * from student_course";
		List<StudentCourse> courses = jdbcTemplate.query(query, new RowMapper<StudentCourse>() {

			@Override
			public StudentCourse mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				return new StudentCourse(rs.getInt("student_id"), rs.getInt("course_id"));
			}
			
		});
		return courses;
	}
	
	@Override
	public void deleteCourse(int course_id) {
		String query = "DELETE from student_course where course_id = ?";
		jdbcTemplate.update(query, course_id);
	}

}
