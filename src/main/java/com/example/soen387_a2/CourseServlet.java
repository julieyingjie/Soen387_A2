package com.example.soen387_a2;

import com.example.soen387_a2.Bean.Course;
import com.example.soen387_a2.Dao.CourseDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create")
public class CourseServlet extends HttpServlet{

    private static final long serialVersionUID = 1;
    private CourseDAO courseDao;

    public void init() {
        courseDao = new CourseDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String courseCode = request.getParameter("courseCode");
        String title = request.getParameter("title");
        String semester = request.getParameter("semester");
        String days = request.getParameter("days");
        String time = request.getParameter("time");
        String instructor = request.getParameter("instructor");
        String room = request.getParameter("room");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");


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

        try {
            courseDao.createCourses(course);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        response.sendRedirect("courseDetail.jsp");
    }
}
