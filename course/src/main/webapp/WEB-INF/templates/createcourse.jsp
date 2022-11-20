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
<h2 class="welcome" style="margin-top: 50px">For create a new course, you need to input the follow information</h2>
<div style="margin-top: 20px">
    <div class="course" style="margin-top: 20px">
        <div>
            <label class="createlabel" for="courseCode">courseCode</label><input id="courseCode" class="inputbox"
                                                                                 name="code" type="text"
                                                                                 style="border: black 1px solid;padding: 10px 15px"
                                                                                 placeholder="courseCode"/>
        </div>
        <div>
            <label class="createlabel" for="title">title</label><input id="title" class="inputbox" name="title"
                                                                       type="text"
                                                                       style="border: black 1px solid;padding: 10px 15px"
                                                                       placeholder="title"/>
        </div>
        <div>
            <label class="createlabel" for="Semester">Semester</label>

            <select name="Semester" id="Semester" style="padding: 10px 15px;border-radius: 7px;border: black 1px solid;font-size: 20px">
                <option value="2022Fall">2022Fall</option>
                <option value="2023winter">2023winter</option>
            </select>
        </div>
        <div>
            <label class="createlabel" for="Days">Days</label><input id="Days" class="inputbox" name="Days"
                                                                     type="number"
                                                                     style="border: black 1px solid;padding: 10px 15px"
                                                                     placeholder="Days"/>
        </div>
        <div>
            <label class="createlabel" for="Time">Time</label><input id="Time" class="inputbox" name="Time" type="time"
                                                                     style="border: black 1px solid;padding: 10px 15px"
                                                                     placeholder="Time"/>
        </div>
        <div>
            <label class="createlabel" for="Instructor">Instructor</label><input id="Instructor" class="inputbox"
                                                                                 name="Instructor"
                                                                                 type="text"
                                                                                 style="border: black 1px solid;padding: 10px 15px"
                                                                                 placeholder="Instructor"/>
        </div>
        <div>
            <label class="createlabel" for="Room">Room</label><input id="Room" class="inputbox" name="Room" type="text"
                                                                     style="border: black 1px solid;padding: 10px 15px"
                                                                     placeholder="Room"/>
        </div>
        <div>
            <label class="createlabel" for="StartDate">StartDate</label><input id="StartDate" class="inputbox"
                                                                               name="StartDate" type="date"
                                                                               style="border: black 1px solid;padding: 10px 15px"
                                                                               placeholder="StartDate"/>
        </div>
        <div>
            <label class="createlabel" for="EndDate">EndDate</label><input id="EndDate" class="inputbox" name="EndDate"
                                                                           type="date"
                                                                           style="border: black 1px solid;padding: 10px 15px"
                                                                           placeholder="EndDate"/>
        </div>
        <button id="createNewCourse" class="submit_area btn-group-lg">Create</button>
    </div>
</div>
<div class="footer">
    Copyright &copy Julie&Yui COMPANY &nbsp; Technical support: (514) 555-1234
</div>
</body>
</html>
<script>
    $('#createNewCourse').click(function () {
        let courseCode = $('#courseCode').val();
        if (!courseCode) {
            alert("Input a course Code")
            return;
        }
        let title = $('#title').val();
        if (!title) {
            alert("Input a title")
            return;
        }
        let Semester = $('#Semester').val();
        console.log(Semester);
        if (!Semester) {
            alert("Input a Semester")
            return;
        }
        let Days = $('#Days').val();
        if (!Days) {
            alert("Input a Days")
            return;
        }
        let Time = $('#Time').val();
        if (!Time) {
            alert("Input a Time")
            return;
        }
        let Instructor = $('#Instructor').val();
        if (!Instructor) {
            alert("Input a Instructor")
            return;
        }
        let Room = $('#Room').val();
        if (!Room) {
            alert("Input a Room")
            return;
        }
        let StartDate = $('#StartDate').val();
        if (!Semester) {
            alert("Input a StartDate")
            return;
        }
        let EndDate = $('#EndDate').val();
        if (!Semester) {
            alert("Input a EndDate")
            return;
        }
        let data = new FormData();
        data.append('courseCode', courseCode);
        data.append('title', title);
        data.append('semester', Semester);
        data.append('days', Days);
        data.append('time', Time);
        data.append('instructor', Instructor);
        data.append('room', Room);
        data.append('startDate', StartDate);
        data.append('endDate', EndDate);
        $.ajax({
            url: 'createNewCourse',
            type: 'POST',
            data: data,
            dataType: 'json',
            contentType: false,
            processData: false,
            success: function (res) {
                if (res.code === 200) {
                    $('input').val('');
                }
                alert(res.msg);
            }
        })
    });
</script>
