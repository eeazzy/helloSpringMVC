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
     * 특정 년도와 학기에 해당하는 모든 과목을 조회
     * @param year - 조회할 년도
     * @param semester - 조회할 학기
     * @return 조회된 과목들의 리스트
     */
    public List<Courses> getCoursesByYearAndSemester(int year, int semester) {
        return coursesDao.getCoursesByYearAndSemester(year, semester);
    }

    /**
     * 모든 데이터에서 연도와 학기별로 학점을 합산
     * @return 연도와 학기별로 학점을 합산한 결과를 담은 Map
     */
    public Map<String, Integer> getTotalCreditsGroupedByYearAndSemester() {
        List<Courses> allCourses = coursesDao.getAllCourses();

        Map<String, Integer> totalCreditsByYearAndSemester = new HashMap<>();

        for (Courses course : allCourses) {
            String key = course.getYear() + "-" + course.getSemester();
            totalCreditsByYearAndSemester.putIfAbsent(key, 0);
            totalCreditsByYearAndSemester.put(key, totalCreditsByYearAndSemester.get(key) + course.getCredit());
        }

        return totalCreditsByYearAndSemester;
    }

}
