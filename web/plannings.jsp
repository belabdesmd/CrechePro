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
    <title>Plannings</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<br/>
<form id="filter">
</form>
<div class="container-fluid">
    <form action="plannings.jsp">
        <div class="row">
            <div class="col-sm-5">
                <div class="form-group">
                    <label for="from">From</label>
                    <input type="date" class="form-control" id="from" name="start_date">
                </div>
            </div>
            <div class="col-sm-5">
                <div class="form-group">
                    <label for="to">To</label>
                    <input type="date" class="form-control" id="to" name="end_date">
                </div>
            </div>
            <div class="col-sm-2">
                <div class="form-group">
                    <label><br/></label>
                    <input class="form-control btn btn-dark" type="submit" value="Filter">
                </div>
            </div>
        </div>
    </form>
</div>
<br/>
<%
    String start_date, end_date;

    //Get Current Date
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();

    //Get Date Filters
    if (request.getParameter("start_date") != null)
        start_date = request.getParameter("start_date");
    else start_date = dateFormat.format(date);

    if (request.getParameter("end_date") != null)
        end_date = request.getParameter("end_date");
    else end_date = dateFormat.format(date);


    //Get Planning
    Planning planning = PlanningDAO.getPlanning(DBHelper.getConnection(), start_date, end_date);

    //Set Activities
    request.setAttribute("a_8_10", planning.getActivities_8_10());
    request.setAttribute("a_10_12", planning.getActivities_10_12());
    request.setAttribute("a_12_14", planning.getActivities_12_14());
    request.setAttribute("a_14_16", planning.getActivities_14_16());
%>
<table class="table table-dark">
    <thead>
    <tr>
        <th scope="col" class="bg-success">#</th>
        <th scope="col" class="bg-success">Sunday</th>
        <th scope="col" class="bg-success">Monday</th>
        <th scope="col" class="bg-success">Tuesday</th>
        <th scope="col" class="bg-success">Wednesday</th>
        <th scope="col" class="bg-success">Thursday</th>
        <th scope="col" class="bg-success">Friday</th>
        <th scope="col" class="bg-success">Saturday</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row" class="bg-success">08:00 - 10:00</th>
        <c:forEach items="${a_8_10}" var="a">
            <c:choose>
                <c:when test="${a != null}">
                    <td style="background: ${a.color};">${a.name}</td>
                </c:when>
                <c:otherwise>
                    <td class="bg-danger"></td>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </tr>
    <tr>
        <th scope="row" class="bg-success">10:00 - 12:00</th>
        <c:forEach items="${a_10_12}" var="a">
            <c:choose>
                <c:when test="${a != null}">
                    <td style="background: ${a.color};">${a.name}</td>
                </c:when>
                <c:otherwise>
                    <td class="bg-danger"></td>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </tr>
    <tr>
        <th scope="row" class="bg-success">12:00 - 14:00</th>
        <c:forEach items="${a_12_14}" var="a">
            <c:choose>
                <c:when test="${a != null}">
                    <td style="background: ${a.color};">${a.name}</td>
                </c:when>
                <c:otherwise>
                    <td class="bg-danger"></td>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </tr>
    <tr>
        <th scope="row" class="bg-success">14:00 - 16:00</th>
        <c:forEach items="${a_14_16}" var="a">
            <c:choose>
                <c:when test="${a != null}">
                    <td style="background: ${a.color};">${a.name}</td>
                </c:when>
                <c:otherwise>
                    <td class="bg-danger"></td>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </tr>
    </tbody>
</table>
<div class="row">
    <div class="col-sm-5"></div>
    <div class="col-sm-5"></div>
    <div class="col-sm-2">
        <form action="addPlanning.jsp">
            <div class="form-group">
                <label><br/></label>
                <%
                    if (session.getAttribute("username") != null)
                        out.print("<input class=\"btn btn-dark\" type=\"submit\" value=\"Create Planning\">");
                    else
                        out.print("<input class=\"btn btn-dark\" type=\"submit\" value=\"Create Planning\" disabled>");
                %>
            </div>
        </form>
    </div>
</div>
</body>
</html>
