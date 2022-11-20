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
<c:if test="${user.size() == 0}">
    <div style="margin-top: 50px">
        <h2>No Student select this course</h2>
    </div>
</c:if>
<c:if test="${user.size() >0}">
    <div style="margin-top: 50px">
        <h2>Student for course ${course.cID}-${course.title}</h2>
    </div>
    <div style="margin-top: 20px" id="tableContent">
        <table id="apply_table">
            <thead>
            <tr>
                <th scope="col">StudentID</th>
                <th scope="col">Student Name</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${user}" var="item">
                <tr>
                    <td>${item.sID}</td>
                    <td>${item.fName} ${item.lName}</td>
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
