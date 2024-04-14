package kr.ac.hansung.cse.controller;

import kr.ac.hansung.cse.service.CoursesService;
import kr.ac.hansung.cse.model.Courses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class CoursesController {

    private final CoursesService coursesService;

    @Autowired
    public CoursesController(CoursesService coursesService) {
        this.coursesService = coursesService;
    }

    @GetMapping("/credits")
    public String showCredits(Model model) {
        Map<String, Integer> yearSemesterTotalCredits = coursesService.getTotalCreditsGroupedByYearAndSemester();
        model.addAttribute("yearSemesterTotalCredits", yearSemesterTotalCredits);
        int totalCredits = yearSemesterTotalCredits.values().stream().mapToInt(Integer::intValue).sum();
        model.addAttribute("totalCredits", totalCredits);
        return "credits";
    }

    @PostMapping("/detail-view")
    public String showDetailView(@RequestParam("year") int year, @RequestParam("semester") int semester, Model model) {
        // 특정 연도와 학기에 해당하는 수강 내역을 조회
        List<Courses> coursesList = coursesService.getCoursesByYearAndSemester(year, semester);

        // 모델에 수강 내역 추가
        model.addAttribute("coursesList", coursesList);
        model.addAttribute("year", year);
        model.addAttribute("semester", semester);

        // detail-view.jsp 뷰를 반환
        return "detail-view";
    }

}
