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
<c:if test="${course.size() == 0}">
    <div style="margin-top: 50px">
        <h2>You haven't register any course yet</h2>
    </div>
</c:if>
<c:if test="${course.size() >0}">
    <div style="margin-top: 20px" id="tableContent">
        <table id="apply_table">
            <thead>
            <tr>
                <th scope="col">courseCode</th>
                <th scope="col">title</th>
                <th scope="col">semester</th>
                <th scope="col">days</th>
                <th scope="col">time</th>
                <th scope="col">instructor</th>
                <th scope="col">room</th>
                <th scope="col">startDate</th>
                <th scope="col">endDate</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${course}" var="item">
                <tr>
                    <td>${item.courseCode}</td>
                    <td>${item.title}</td>
                    <td>${item.semester}</td>
                    <td>${item.days}</td>
                    <td>${item.time}</td>
                    <td>${item.instructor}</td>
                    <td>${item.room}</td>
                    <td>${item.startDate}</td>
                    <td>${item.endDate}</td>
                    <td>
                        <button class="deleteMyCourse" value="${item.cID}" onclick="deleteMyCourse(${item.cID})">Del
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>
<div class="footer">
    Copyright &copy Julie&Yui COMPANY &nbsp; Technical support: (514) 555-1234
</div>
</body>
</html>
<script>
    function deleteMyCourse(cID) {
        let sID = window.location.href.split("sID=")[1];
        let data = new FormData();
        data.append('sID', sID);
        data.append('cID', cID);
        $.ajax({
            url: 'deleteMyCourse',
            type: 'POST',
            data: data,
            dataType: 'json',
            contentType: false,
            processData: false,
            success: function (res) {
                if (res.code === 200) {
                    window.location.href = 'viewMyCourse?sID=' + sID;
                } else {
                    alert(res.msg);
                }
            }
        })
    }
</script>
