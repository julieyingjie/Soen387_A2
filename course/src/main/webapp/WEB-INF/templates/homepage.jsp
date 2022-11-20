<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="../static/css/myCss.scss">
    <script type="text/javascript" src="../static/js/jquery.js"></script>
</head>
<body>
<div class="title">
    <span class="title">Course Management System</span>
</div>
<div class="homediv">
    <h2>Please enter your student ID</h2>
    <input id="stuId" class="inputbox" name="sID" type="text" size=2/>
    <button id="student" class="submit_area btn-group-lg">I am a student</button>
</div>
<div class="homediv">
    <h2 style="color: white">Please enter your employment ID</h2>
    <input id="adminId" class="inputbox" name="eID" type="text" size=2/>
    <button id="admin" class="submit_area btn-group-lg">I am a administrator</button>
</div>
<div class="footer">
    Copyright &copy Julie&Yui COMPANY &nbsp; Technical support: (514) 555-1234
</div>
</body>
</html>
<script>
    function doLogin(id, role) {
        let data = new FormData();
        data.append('id', id);
        data.append('role', role);
        $.ajax({
            url: 'login',
            type: 'POST',
            data: data,
            dataType: 'json',
            contentType: false,
            processData: false,
            success: function (res) {
                if (res.code === 200) {
                    //alert('success')
                    if ('1' === role) {
                        window.localStorage.setItem('sID', id);
                    } else {
                        window.localStorage.setItem('eID', id);
                    }
                    window.location.href = 'dispatcher?id=' + id + '&role=' + role;
                } else {
                    alert(res.msg);
                }
            }
        })
    }

    $('#student').click(function () {
        let stuId = $('#stuId').val();
        if (!stuId || stuId.length === 0) {
            alert('Input student id');
            return;
        }
        doLogin(stuId, '1');
    });

    $('#admin').click(function () {
        let adminId = $('#adminId').val();
        if (!adminId || adminId.length === 0) {
            alert('Input admin id');
            return;
        }
        doLogin(adminId, '2');
    });
</script>
