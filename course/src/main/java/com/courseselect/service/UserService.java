package com.courseselect.service;

import com.courseselect.dao.IUserDao;
import com.courseselect.po.Course;
import com.courseselect.po.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {
    @Resource
    IUserDao iUserDao;

    public User stuLogin(String id) {
        return iUserDao.stuLogin(id);
    }

    public User adminLogin(String id) {
        return iUserDao.adminLogin(id);
    }

    public List<Course> findCourseById(String sId) {
        return iUserDao.findCourseById(sId);
    }

    public Course findCourseByCId(String cId) {
        return iUserDao.findCourseByCId(cId);
    }

    public List<Course> findCourseBySemester(String semester) {
        return iUserDao.findCourseBySemester(semester);
    }

    public int deleteMyCourse(String sID, String cID) {
        return iUserDao.deleteMyCourse(sID, cID);
    }

    public int selectCourse(String sID, String cID) {
        return iUserDao.selectCourse(sID, cID);
    }

    public List<User> viewStudentByCId(String cID) {
        return iUserDao.viewStudentByCId(cID);
    }

    public List<Course> viewCourseBySId(String sID) {
        return iUserDao.viewCourseBySId(sID);
    }

    public int createNewCourse(Course course) {
        return iUserDao.createNewCourse(course);
    }

    public int findSelectedCourse(String sID) {
        return iUserDao.findSelectedCourse(sID);
    }
}
