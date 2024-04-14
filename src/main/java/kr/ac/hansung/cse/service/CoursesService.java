package kr.ac.hansung.cse.service;

import kr.ac.hansung.cse.dao.CoursesDao;
import kr.ac.hansung.cse.model.Courses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CoursesService {

    private final CoursesDao coursesDao;

    @Autowired
    public CoursesService(CoursesDao coursesDao) {
        this.coursesDao = coursesDao;
    }

    /**
     * 특정 년도와 학기에 해당하는 모든 과목을 조회합니다.
     * @param year - 조회할 년도
     * @param semester - 조회할 학기
     * @return 조회된 과목들의 리스트
     */
    public List<Courses> getCoursesByYearAndSemester(int year, int semester) {
        return coursesDao.getCoursesByYearAndSemester(year, semester);
    }

    /**
     * 특정 년도와 학기에 해당하는 과목들의 학점을 합산합니다.
     * @param year - 학점 합산할 년도
     * @param semester - 학점 합산할 학기
     * @return 합산된 학점
     */
    public int getTotalCreditsByYearAndSemester(int year, int semester) {
        List<Courses> coursesList = getCoursesByYearAndSemester(year, semester);

        int totalCredits = 0;
        for (Courses course : coursesList) {
            totalCredits += course.getCredit();
        }

        return totalCredits;
    }

    /**
     * 모든 데이터에서 연도와 학기별로 학점을 합산합니다.
     * @return 연도와 학기별로 학점을 합산한 결과를 담은 Map
     */
    public Map<String, Integer> getTotalCreditsGroupedByYearAndSemester() {
        List<Courses> allCourses = coursesDao.getAllCourses(); // 데이터베이스에서 모든 과목을 가져옵니다.

        Map<String, Integer> totalCreditsByYearAndSemester = new HashMap<>();

        // 모든 과목을 연도와 학기별로 그룹화하여 학점을 합산합니다.
        for (Courses course : allCourses) {
            String key = course.getYear() + "-" + course.getSemester();
            totalCreditsByYearAndSemester.putIfAbsent(key, 0);
            totalCreditsByYearAndSemester.put(key, totalCreditsByYearAndSemester.get(key) + course.getCredit());
        }

        return totalCreditsByYearAndSemester;
    }

}
