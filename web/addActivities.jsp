<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.crechepro.bean.Planning" %>
<%@ page import="com.crechepro.dao.PlanningDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Activities</title>
</head>
<body>
<jsp:include page="navbar.html"/>
<br/>
<%
    String start_date = "";
    String end_date = "";

    if (request.getParameter("from") != null){
        PlanningDAO.createPlanning(DBHelper.getConnection(), request.getParameter("from"), request.getParameter("to"));
        start_date = request.getParameter("from");
        end_date = request.getParameter("to");
    }

    Planning planning = PlanningDAO.getPlanning(DBHelper.getConnection(), start_date, end_date);
    request.setAttribute("saturday", planning.getSaturday());
    request.setAttribute("sunday", planning.getSunday());
    request.setAttribute("monday", planning.getMonday());
    request.setAttribute("tuesday", planning.getTuesday());
    request.setAttribute("wednesday", planning.getWednesday());
    request.setAttribute("thursday", planning.getThursday());
    request.setAttribute("friday", planning.getFriday());
%>
</body>
</html>
