package kr.ac.hansung.cse.controller;

import kr.ac.hansung.cse.model.Enrollment;
import kr.ac.hansung.cse.service.EnrollmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
public class EnrollmentController {

    // Controller -> Service -> Dao
    @Autowired
    private EnrollmentService enrollmentService;

    // 전체 데이터를 보여주는 페이지
    @GetMapping("/courses")
    public String showCourses(Model model) {
        List<Enrollment> enrollments = enrollmentService.getAllEnrollments();
        model.addAttribute("id_enrollments", enrollments);

        return "courses";
    }

    // 입력을 받는 페이지
    @GetMapping("/registration")
    public String createEnrollment(Model model) {
        model.addAttribute("enrollment", new Enrollment());
        return "registration";
    }

    // 입력 완료 시 결과를 보여주는 페이지
    @PostMapping("/docreate")
    public String doCreate(Model model, @Valid Enrollment enrollment, BindingResult result) {
        if (result.hasErrors()) {
            System.out.println("== Form data does not validate ==");

            List<ObjectError> errors = result.getAllErrors();
            for (ObjectError error : errors) {
                System.out.println(error.getDefaultMessage());
            }

            return "registration";
        }

        // Controller -> Service -> Dao
        enrollmentService.insertEnrollment(enrollment);
        return "registrationsubmit";
    }
}
