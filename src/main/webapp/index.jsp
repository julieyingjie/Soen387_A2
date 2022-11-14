<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Create courses here</title>
</head>
<body>
<div align="center">
    <h1>Course Create Form</h1>
    <form action="<%= request.getContextPath() %>/create" method="post">
        <table style="with: 80%">
            <tr>
                <td>Course Code</td>
                <td><input type="text" name="courseCode" /></td>
            </tr>
            <tr>
                <td>Title</td>
                <td><input type="text" name="title" /></td>
            </tr>
            <tr>
                <td>Semester</td>
                <td><input type="text" name="semester" /></td>
            </tr>
            <tr>
                <td>Days</td>
                <td><input type="text" name="days" /></td>
            </tr>
            <tr>
                <td>Time</td>
                <td><input type="text" name="time" /></td>
            </tr>
            <tr>
                <td>Instructor</td>
                <td><input type="text" name="instructor" /></td>
            </tr>
            <tr>
                <td>Room</td>
                <td><input type="text" name="room" /></td>
            </tr>
            <tr>
                <td>Start Date</td>
                <td><input type="text" name="startDate" /></td>
            </tr>
            <tr>
                <td>End Date</td>
                <td><input type="text" name="endDate" /></td>
            </tr>
        </table>
        <input type="submit" value="Submit" />
    </form>
</div>
</body>
</html>