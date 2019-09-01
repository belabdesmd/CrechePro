<%@ page import="java.util.List" %>
<%@ page import="com.crechepro.bean.Activity" %>
<%@ page import="com.crechepro.dao.PlanningDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Activity</title>
</head>
<jsp:include page="navbar.jsp"/>
<br/>
<%
    List<Activity> activities = PlanningDAO.getActivities(DBHelper.getConnection());
    request.setAttribute("activities", activities);
    request.setAttribute("day", request.getParameter("day"));
    request.setAttribute("time", request.getParameter("time"));
    request.setAttribute("id", request.getParameter("id"));
%>
<form action="linkActivity.jsp">
    <div class="modal-body">
        <div class="form-group">
            <label for="name">Activity Name</label>
            <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="form-group">
            <label for="description">Activity Description</label>
            <input type="text" class="form-control" id="description" name="description">
        </div>
        <div class="form-group">
            <label for="color">Activity Color</label>
            <input type="color" class="form-control" id="color" name="color">
        </div>
        <input type="hidden" name="planning_id" value="${id}">
        <input type="hidden" name="time" value="${time}">
        <input type="hidden" name="day" value="${day}">
        <div class="modal-footer">
            <input type="submit" class="btn btn-primary" value="Create Activity"/>
        </div>
    </div>
</form>
<p>-or-</p>
<form action="linkActivity.jsp">
    <div class="modal-body">
        <div class="form-group">
            <label for="activities">Activities</label>
            <select class="form-control" id="activities" name="activities">
                <c:forEach items="${activities}" var="a">
                    <option>${a.name}</option>
                </c:forEach>
            </select>
        </div>
        <input type="hidden" name="planning_id" value="${id}">
        <input type="hidden" name="time" value="${time}">
        <input type="hidden" name="day" value="${day}">
        <div class="modal-footer">
            <input type="submit" class="btn btn-primary" value="Create Activity"/>
        </div>
    </div>
</form>
</html>