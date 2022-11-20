package com.courseselect.controller;

import com.courseselect.base.ResultBean;
import com.courseselect.po.Course;
import com.courseselect.po.User;
import com.courseselect.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    private static final long WEEK = 7 * 24 * 60 * 60 * 1000L;
    @Resource
    UserService userService;

    @PostMapping("login")
    @ResponseBody
    public ResultBean<User> login(String id, String role) {
        ResultBean<User> resultBean = new ResultBean<>();
        User user;
        if ("1".equals(role)) {
            user = userService.stuLogin(id);
        } else {
            user = userService.adminLogin(id);
        }
        if (user == null) {
            resultBean.setCode(ResultBean.error);
            resultBean.setMsg("User Not Exist");
        } else {
            resultBean.setCode(ResultBean.success);
            resultBean.setMsg("Login success");
            resultBean.setData(user);
        }
        return resultBean;
    }

    @PostMapping("deleteMyCourse")
    @ResponseBody
    public ResultBean<User> deleteMyCourse(String sID, String cID) {
        ResultBean<User> resultBean = new ResultBean<>();
        Course course = userService.findCourseByCId(cID);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date endDate = format.parse(course.getEndDate());
            if (System.currentTimeMillis() > endDate.getTime()) {
                resultBean.setCode(ResultBean.error);
                resultBean.setMsg("Can't delete a course that has been completed");
                return resultBean;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int i = userService.deleteMyCourse(sID, cID);
        if (i > 0) {
            resultBean.setCode(ResultBean.success);
            resultBean.setMsg("Delete Success");
        } else {
            resultBean.setCode(ResultBean.error);
            resultBean.setMsg("Delete Failure");
        }
        return resultBean;
    }

    @PostMapping("selectCourse")
    @ResponseBody
    public ResultBean<User> selectCourse(String sID, String cID) {
        ResultBean<User> resultBean = new ResultBean<>();
        if (sID == null || sID.length() == 0 || cID == null || cID.length() == 0) {
            resultBean.setCode(ResultBean.noLoginError);
            resultBean.setMsg("");
            return resultBean;
        }

        List<Course> courseList = userService.findCourseById(sID);
        boolean exist = false;
        if (courseList != null && !courseList.isEmpty()) {
            for (Course course : courseList) {
                if (cID.equals(course.getcID())) {
                    exist = true;
                    break;
                }
            }
        }
        if (exist) {
            resultBean.setCode(ResultBean.error);
            resultBean.setMsg("You have already register this course");
            return resultBean;
        }

        Course course = userService.findCourseByCId(cID);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        try {
            startDate = format.parse(course.getStartDate());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (startDate != null && (System.currentTimeMillis() - startDate.getTime()) > WEEK) {
            resultBean.setCode(ResultBean.error);
            resultBean.setMsg("Has been started for more than 7 days,Can't be selected");
            return resultBean;
        }

        List<Course> selectedCourseList = userService.findCourseById(sID);
        if (selectedCourseList != null && selectedCourseList.size() >= 5) {
            resultBean.setCode(ResultBean.error);
            resultBean.setMsg("Can't select more than 5 courses");
            return resultBean;
        }

        int i = userService.selectCourse(sID, cID);
        if (i > 0) {
            resultBean.setCode(ResultBean.success);
            resultBean.setMsg("Congratulations! Course has be success added!");
        } else {
            resultBean.setCode(ResultBean.error);
            resultBean.setMsg("Select Failure");
        }
        return resultBean;
    }

    @PostMapping("createNewCourse")
    @ResponseBody
    public ResultBean<User> createNewCourse(String courseCode, String title, String semester, String days, String time, String instructor, String room, String startDate, String endDate) {
        ResultBean<User> resultBean = new ResultBean<>();
        Course course = new Course();
        course.setCourseCode(courseCode);
        course.setTitle(title);
        course.setSemester(semester);
        course.setDays(days);
        course.setTime(time);
        course.setInstructor(instructor);
        course.setRoom(room);
        course.setStartDate(startDate);
        course.setEndDate(endDate);
        int i = userService.createNewCourse(course);
        if (i == 1 && course.getcID() != null) {
            resultBean.setCode(ResultBean.success);
            resultBean.setMsg("Add Success");
        } else {
            resultBean.setCode(ResultBean.error);
            resultBean.setMsg("Add Failure");
        }
        return resultBean;
    }
}
