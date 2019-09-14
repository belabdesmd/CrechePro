<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style/css/bootstrap.min.css"/>
</head>
<body>
<%
    request.setAttribute("next", request.getParameter("next"));
    if (request.getParameter("msg") != null)
        out.println("<div class=\"alert alert-danger\" role=\"alert\">\n" +
                "Username or Password is wrong!\n" +
                "</div>");
%>
<form action="loginProcess.jsp">
    <div class="modal-body" style="width: 50%; margin: 100px auto;">
        <input type="hidden" name="next" value="${next}">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="username">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password">
        </div>
        <div class="modal-footer">
            <input type="submit" class="btn btn-success" value="Login"/>
        </div>
    </div>
</form>
</body>
</html>
