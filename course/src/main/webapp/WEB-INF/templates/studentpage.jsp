<%@ page contentType="text/html;charset=UTF-8" %>
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
<h2 class="welcome" style="margin-top: 50px">Welcome '${user.fName}'</h2>
<div style="margin-top: 50px">
    <h2>Click here to View your registered courses</h2>
    <button id="view_my_course" style="margin-top: 10px" value="${user.sID}">View</button>
</div>
<div style="margin-top: 20px">
    <h2>Select Semester
        <select name="selectSemester" id="semester"
                style="padding: 10px 15px;border-radius: 7px;border: black 1px solid;font-size: 20px">
            <option>2022Fall</option>
            <option>2023winter</option>
        </select>
    </h2>
    <button id="view_course_by_semester" style="margin-top: 10px" value="${user.sID}">Show Available Courses</button>
</div>
<div class="footer">
    Copyright &copy Julie&Yui COMPANY &nbsp; Technical support: (514) 555-1234
</div>
</body>
</html>
<script>

    $('#view_my_course').click(function () {
        let sID = $('#view_my_course').val();
        window.location.href = 'viewMyCourse?sID=' + sID;
    });

    $('#view_course_by_semester').click(function () {
        let semester = $('#semester').val();
        window.location.href = 'viewCourseBySemester?semester=' + semester;
    });
</script>
