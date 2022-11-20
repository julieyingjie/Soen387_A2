<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../static/css/myCss.scss">
    <script type="text/javascript" src="../static/js/jquery.js"></script>
</head>
<body>
<div class="title">
    <span class="title">Course Management System</span>
</div>
<h2 class="welcome" style="margin-top: 50px">Welcome Administrator</h2>
<div style="margin-top: 20px">
    <div>
        <button id="create_new_course" style="margin-top: 10px;padding: 15px 25px" value="${user.sID}">Create A New
            Course
        </button>
    </div>
    <div style="margin-top: 20px">
        <h3>Please enter the course ID to view the students of the selected course</h3>
        <input id="cID" class="inputbox" name="sID" style="border: black 1px solid;padding: 10px 15px" type="text"
               placeholder="Input a course ID"/>
        <button id="viewStudentByCId" class="submit_area btn-group-lg">View Student</button>
        <c:if test="${courseError != null}">
            <span style="color: red;font-size: 15px">${courseError}</span>
        </c:if>
    </div>

    <div style="margin-top: 20px">
        <h3>Please enter the student ID to view the selected course</h3>
        <input id="sID" class="inputbox" name="cID" type="text" style="border: black 1px solid;padding: 10px 15px"
               placeholder="Input a student ID"/>
        <button id="viewCourseBySId" class="submit_area btn-group-lg">View Course</button>
        <c:if test="${studentError != null}">
            <span style="color: red;font-size: 15px">${studentError}</span>
        </c:if>
    </div>
</div>
<div class="footer">
    Copyright &copy Julie&Yui COMPANY &nbsp; Technical support: (514) 555-1234
</div>
</body>
</html>
<script>
    $('#create_new_course').click(function () {
        window.location.href = 'createNewCourse';
    });
    $('#viewStudentByCId').click(function () {
        let cID = $('#cID').val();
        if (!cID) {
            alert("Input a course ID")
            return;
        }
        window.location.href = 'viewStudentByCId?cID=' + cID;
    });
    $('#viewCourseBySId').click(function () {
        let sID = $('#sID').val();
        if (!sID) {
            alert("Input a student ID")
            return;
        }
        window.location.href = 'viewCourseBySId?sID=' + sID;
    });
</script>
