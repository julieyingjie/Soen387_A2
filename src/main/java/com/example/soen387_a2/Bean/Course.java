package com.example.soen387_a2.Bean;

import java.io.Serializable;
import java.util.Date;

/**
 * JavaBean class used in jsp action tags.
 * This is for course creation
 */

public class Course implements Serializable {

    private static final long serialVersionUID = 1;

    private int cID;
    private String courseCode;
    private String title;
    private String semester;
    private String days;
//    private int days;
//    private String time;
    private String time;
    private String instructor;
    private String room;
//    private String startDate;
    private Date startDate;
//    private String endDate;
    private Date endDate;

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getcID() {

        return cID;
    }

    public void setcID(int cID) {

        this.cID = cID;
    }

}
