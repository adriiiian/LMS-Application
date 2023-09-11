package biz.global77.lms_application.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import biz.global77.lms_application.dao.StudentDao;
import biz.global77.lms_application.model.Student;

@Repository
public class StudentRepository implements StudentDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void addStudent(Student student) {
		String query = "INSERT INTO student (firstname, lastname, email) values (?, ?, ?)";
		jdbcTemplate.update(query, student.getFirstname(), student.getLastname(), student.getEmail());		
	}
	
	@Override
	public void editStudent(int id, String firstname, String lastname, String email) {
		String query = "UPDATE student set firstname = ?, lastname = ?, email = ? where id = ?";
		jdbcTemplate.update(query, firstname, lastname, email, id);
	}

	@Override
	public List<Student> getStudents() {
		String query = "SELECT * from student";
		List<Student> students = jdbcTemplate.query(query, new RowMapper<Student>() {

			@Override
			public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				return new Student(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"));
			}
			
		});
		return students;
	}

}
