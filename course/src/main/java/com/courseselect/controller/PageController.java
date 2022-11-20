package com.courseselect.controller;

import com.courseselect.po.Course;
import com.courseselect.po.User;
import com.courseselect.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PageController {

    @Resource
    UserService userService;

    @GetMapping({"/", "index", "homepage"})
    public String index(HttpServletRequest request) {
        return "homepage";
    }

    @GetMapping({"dispatcher"})
    public ModelAndView dispatcher(HttpServletRequest request) {
        String query = request.getQueryString();
        String[] queryList = query.split("&");
        String role = "", id = "";
        for (String data : queryList) {
            String[] item = data.split("=");
            if ("role".equals(item[0])) {
                role = item[1];
            } else {
                id = item[1];
            }
        }
        ModelAndView modelAndView = new ModelAndView();
        User user;
        if ("1".equals(role)) {
            user = userService.stuLogin(id);
            modelAndView.setViewName("studentpage");
        } else {
            user = userService.adminLogin(id);
            modelAndView.setViewName("adminpage");
        }
        modelAndView.getModel().put("user", user);
        return modelAndView;
    }

    @GetMapping({"viewMyCourse"})
    public ModelAndView viewMyCourse(HttpServletRequest request) {
        String query = request.getQueryString();
        String[] items = query.split("=");
        String sID = items[1];
        List<Course> course = userService.findCourseById(sID);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("viewMyCourse");
        modelAndView.getModel().put("course", course);
        return modelAndView;
    }

    @GetMapping({"viewCourseBySemester"})
    public ModelAndView viewCourseBySemester(HttpServletRequest request) {
        String query = request.getQueryString();
        String[] items = query.split("=");
        String semester = items[1];
        List<Course> course = userService.findCourseBySemester(semester);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("viewCourse");
        modelAndView.getModel().put("course", course);
        return modelAndView;
    }

    @GetMapping({"viewStudentByCId"})
    public ModelAndView viewStudentByCId(HttpServletRequest request) {
        String query = request.getQueryString();
        String[] items = query.split("=");
        String cID = items[1];
        Course course = userService.findCourseByCId(cID);
        ModelAndView modelAndView = new ModelAndView();
        if (course == null) {
            modelAndView.setViewName("adminpage");
            modelAndView.getModel().put("courseError", "No this course id");
        } else {
            List<User> studentList = userService.viewStudentByCId(cID);
            modelAndView.setViewName("viewStudentByCId");
            modelAndView.getModel().put("user", studentList);
            modelAndView.getModel().put("course", course);
        }
        return modelAndView;
    }

    @GetMapping({"viewCourseBySId"})
    public ModelAndView viewCourseBySId(HttpServletRequest request) {
        String query = request.getQueryString();
        String[] items = query.split("=");
        String sID = items[1];
        User user = userService.stuLogin(sID);
        ModelAndView modelAndView = new ModelAndView();
        if (user == null) {
            modelAndView.setViewName("adminpage");
            modelAndView.getModel().put("studentError", "No this student id");
        } else {
            List<Course> courseList = userService.viewCourseBySId(sID);
            modelAndView.setViewName("viewCourseBySId");
            modelAndView.getModel().put("course", courseList);
            modelAndView.getModel().put("user", user);
        }
        return modelAndView;
    }

    @GetMapping({"createNewCourse"})
    public ModelAndView createNewCourse(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("createcourse");
        return modelAndView;
    }
}
