package kr.ac.hansung.cse.dao;

import kr.ac.hansung.cse.model.Enrollment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class EnrollmentDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    // Query to get a single enrollment by course_name (primary key)
    public Enrollment getEnrollment(String courseName) {
        String sqlStatement = "SELECT * FROM enrollment WHERE course_name = ?";
        return jdbcTemplate.queryForObject(sqlStatement, new Object[]{courseName}, new RowMapper<Enrollment>() {
            @Override
            public Enrollment mapRow(ResultSet rs, int rowNum) throws SQLException {
                Enrollment enrollment = new Enrollment();
                enrollment.setYear(rs.getInt("year"));
                enrollment.setSemester(rs.getInt("semester"));
                enrollment.setCourseName(rs.getString("course_name"));
                enrollment.setCourseType(rs.getString("course_type"));
                enrollment.setInstructorName(rs.getString("instructor_name"));
                enrollment.setCredit(rs.getInt("credit"));
                return enrollment;
            }
        });
    }

    // Query to get multiple enrollments
    public List<Enrollment> getEnrollments() {
        String sqlStatement = "SELECT * FROM enrollment";
        return jdbcTemplate.query(sqlStatement, new RowMapper<Enrollment>() {
            @Override
            public Enrollment mapRow(ResultSet rs, int rowNum) throws SQLException {
                Enrollment enrollment = new Enrollment();
                enrollment.setYear(rs.getInt("year"));
                enrollment.setSemester(rs.getInt("semester"));
                enrollment.setCourseName(rs.getString("course_name"));
                enrollment.setCourseType(rs.getString("course_type"));
                enrollment.setInstructorName(rs.getString("instructor_name"));
                enrollment.setCredit(rs.getInt("credit"));
                return enrollment;
            }
        });
    }

    // Insert a new enrollment record
    public boolean insert(Enrollment enrollment) {
        String sqlStatement = "INSERT INTO enrollment (year, semester, course_name, course_type, instructor_name, credit) VALUES (?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sqlStatement, enrollment.getYear(), enrollment.getSemester(), enrollment.getCourseName(), enrollment.getCourseType(), enrollment.getInstructorName(), enrollment.getCredit()) == 1;
    }

    // Update an existing enrollment record
    public boolean update(Enrollment enrollment) {
        String sqlStatement = "UPDATE enrollment SET year = ?, semester = ?, course_type = ?, instructor_name = ?, credit = ? WHERE course_name = ?";
        return jdbcTemplate.update(sqlStatement, enrollment.getYear(), enrollment.getSemester(), enrollment.getCourseType(), enrollment.getInstructorName(), enrollment.getCredit(), enrollment.getCourseName()) == 1;
    }

    // Delete an enrollment record by course_name
    public boolean delete(String courseName) {
        String sqlStatement = "DELETE FROM enrollment WHERE course_name = ?";
        return jdbcTemplate.update(sqlStatement, courseName) == 1;
    }
}
