package com.example.soen387_a2.Dao;

import com.example.soen387_a2.Bean.Course;

import java.sql.*;


/**
 * registerEmployee -- > createCourses
 */

public class CourseDAO {
    public int createCourses(Course course) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO course" +
                "  (cID, courseCode, title, semester, days, time, instructor, room, startDate, endDate) VALUES " +
                " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        int result = 0;
        Class.forName("com.mysql.jdbc.Driver");
        //Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/soen387_teamproject", "root", "");

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setInt(1, course.getcID());
            preparedStatement.setString(2, course.getCourseCode());
            preparedStatement.setString(3, course.getTitle());
            preparedStatement.setString(4, course.getSemester());
            preparedStatement.setString(5, course.getDays());
            preparedStatement.setString(6, course.getTime());
            preparedStatement.setString(7, course.getInstructor());
            preparedStatement.setString(8, course.getRoom());
            preparedStatement.setDate(9, (Date) course.getStartDate());
            preparedStatement.setDate(10, (Date) course.getEndDate());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();
//            preparedStatement.close();
//            connection.close();
//            System.out.println("result = preparedStatement.executeUpdate()    executed ");


        } catch (SQLException e) {
            System.out.println("create course exception error");
            // process sql exception
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
