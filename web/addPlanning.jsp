<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Planning</title>
</head>
<body>
<%
    session.setAttribute("current", "plannings");
%>
<jsp:include page="navbar.jsp"/>
<br/>
<form action="addActivities.jsp">
    <div class="modal-body">
        <div class="form-group">
            <label for="from">From</label>
            <input type="date" class="form-control" id="from" name="from">
        </div>
        <div class="form-group">
            <label for="to">To</label>
            <input type="date" class="form-control" id="to" name="to">
        </div>
        <div class="modal-footer">
            <input type="submit" class="btn btn-syccess" value="Next"/>
        </div>
    </div>
</form>
</body>
</html>
