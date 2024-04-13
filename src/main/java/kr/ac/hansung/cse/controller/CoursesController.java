package kr.ac.hansung.cse.controller;

import kr.ac.hansung.cse.model.Courses;
import kr.ac.hansung.cse.service.CoursesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CoursesController {

    private final CoursesService coursesService;

    @Autowired
    public CoursesController(CoursesService coursesService) {
        this.coursesService = coursesService;
    }

    // 검색 양식 표시
    @GetMapping("/search-courses")
    public String showSearchForm() {
        return "searchForm"; // 검색 양식이 있는 뷰 (예: searchForm.jsp)
    }

    // 검색 수행 및 결과 출력
    @PostMapping("/search-courses")
    public String searchCourses(@RequestParam("year") int year, @RequestParam("semester") int semester, Model model) {
        // 특정 년도와 학기에 해당하는 모든 과목을 조회합니다.
        List<Courses> coursesList = coursesService.getCoursesByYearAndSemester(year, semester);

        // 모델에 조회된 과목 리스트를 추가합니다.
        model.addAttribute("coursesList", coursesList);

        // 검색 결과를 출력할 뷰 (예: credits.jsp)를 반환합니다.
        return "credits";
    }

    // 결과 출력 (특정 조회 결과를 보여주는 메서드)
    @GetMapping("/credits")
    public String showCourses(Model model) {
        // 이전 검색 결과를 credits 뷰에서 보여줄 수 있습니다.
        // `coursesList`가 모델에 이미 추가되었다고 가정합니다.
        return "credits";
    }
}
