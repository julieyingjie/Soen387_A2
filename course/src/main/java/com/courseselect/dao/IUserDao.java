package com.courseselect.dao;

import com.courseselect.po.Course;
import com.courseselect.po.User;

import java.util.List;

public interface IUserDao {

    int register(String username, String password);

    User stuLogin(String id);

    User adminLogin(String id);

    List<Course> findCourseById(String sId);

    Course findCourseByCId(String cId);

    List<Course> findCourseBySemester(String semester);

    int deleteMyCourse(String sID, String cID);

    int selectCourse(String sID, String cID);

    List<User> viewStudentByCId(String cID);

    List<Course> viewCourseBySId(String sID);

    int createNewCourse(Course course);

    int findSelectedCourse(String sID);
}
