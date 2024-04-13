package kr.ac.hansung.cse.dao;

import kr.ac.hansung.cse.model.Courses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class CoursesDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    /**
     * 특정 년도와 학기에 해당하는 모든 과목을 조회
     * @param year - 조회할 년도
     * @param semester - 조회할 학기
     * @return 조회된 과목들의 리스트
     */
    public List<Courses> getCoursesByYearAndSemester(int year, int semester) {
        // 특정 년도와 학기에 해당하는 과목을 조회하는 SQL 쿼리
        String sqlStatement = "SELECT * FROM courses WHERE year = ? AND semester = ?";

        // SQL 쿼리를 실행하여 결과를 Courses 객체의 리스트로 반환
        return jdbcTemplate.query(sqlStatement, new Object[]{year, semester}, new RowMapper<Courses>() {
            @Override
            public Courses mapRow(ResultSet rs, int rowNum) throws SQLException {
                Courses courses = new Courses();
                courses.setYear(rs.getInt("year"));
                courses.setSemester(rs.getInt("semester"));
                courses.setCourseCode(rs.getString("course_code"));
                courses.setCourseName(rs.getString("course_name"));
                courses.setCourseType(rs.getString("course_type"));
                courses.setInstructorName(rs.getString("instructor_name"));
                courses.setCredit(rs.getInt("credit"));
                return courses;
            }
        });
    }
}
