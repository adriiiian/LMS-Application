package biz.global77.lms_application.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import biz.global77.lms_application.dao.TeacherDao;
import biz.global77.lms_application.model.Teacher;

@Repository
public class TeacherRepository implements TeacherDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void addTeacher(Teacher teacher) {
		String query = "INSERT INTO teacher (firstname, lastname, email) values (?, ?, ?)";
		jdbcTemplate.update(query, teacher.getFirstname(), teacher.getLastname(), teacher.getEmail());
		
	}
	
	@Override
	public void editTeacher(int id, String firstname, String lastname, String email) {
		String query = "UPDATE teacher set firstname = ?, lastname = ?, email = ? where id = ?";
		jdbcTemplate.update(query, firstname, lastname, email, id);
		
	}

	@Override
	public List<Teacher> getTeachers() {
		String query = "SELECT * FROM teacher";
		
		List<Teacher> teacherList = jdbcTemplate.query(query, new RowMapper<Teacher>() {

			@Override
			public Teacher mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new Teacher(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"));
			}
			
		});
		return teacherList;
	}

}
