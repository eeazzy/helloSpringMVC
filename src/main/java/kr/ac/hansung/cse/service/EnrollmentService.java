package kr.ac.hansung.cse.service;

import kr.ac.hansung.cse.dao.EnrollmentDao;
import kr.ac.hansung.cse.model.Enrollment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnrollmentService {

    @Autowired
    private EnrollmentDao enrollmentDao;

    public List<Enrollment> getAllEnrollments() {
        return enrollmentDao.getEnrollments();
    }

    public void insertEnrollment(Enrollment enrollment) {
        enrollmentDao.insert(enrollment);
    }

}
