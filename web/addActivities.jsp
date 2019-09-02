<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.crechepro.bean.Planning" %>
<%@ page import="com.crechepro.dao.PlanningDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Activities</title>
    <style>
        table,
        thead,
        tr,
        tbody,
        th,
        td {
            color: #FFFFFF;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<br/>
<%
    int planningId = 0;

    System.out.println("addActivities : " + request.getParameter("planning_id"));
    if (request.getParameter("planning_id") != null) {
        try {
            planningId = Integer.valueOf(request.getParameter("planning_id"));
        } catch (NumberFormatException e) {
            //Ignore
        }
    } else {
        planningId = PlanningDAO.getPlanningId(DBHelper.getConnection(), request.getParameter("from"), request.getParameter("to"));
    }

    Planning planning = PlanningDAO.getPlanning(DBHelper.getConnection(), planningId);
    request.setAttribute("id", planningId);
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
        <c:forEach items="${a_8_10}" var="a" varStatus="status">
            <c:choose>
                <c:when test="${a != null}">
                    <td style="background: ${a.color};">${a.name}</td>
                </c:when>
                <c:otherwise>
                    <td class="bg-warning">
                        <form action="createActivity.jsp">
                            <input type="hidden" name="id" value="${id}">
                            <input type="hidden" name="time" value="8-10">
                            <input type="hidden" name="day" value="${status.index}">
                            <input type="submit" class="btn btn-warning" value="Add"/>
                        </form>
                    </td>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </tr>
    <tr>
        <th scope="row" class="bg-success">10:00 - 12:00</th>
        <c:forEach items="${a_10_12}" var="a" varStatus="status">
            <c:choose>
                <c:when test="${a != null}">
                    <td style="background: ${a.color};">${a.name}</td>
                </c:when>
                <c:otherwise>
                    <td class="bg-warning">
                        <form action="createActivity.jsp">
                            <input type="hidden" name="id" value="${id}">
                            <input type="hidden" name="time" value="10-12">
                            <input type="hidden" name="day" value="${status.index}">
                            <input type="submit" class="btn btn-warning" value="Add"/>
                        </form>
                    </td>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </tr>
    <tr>
        <th scope="row" class="bg-success">12:00 - 14:00</th>
        <c:forEach items="${a_12_14}" var="a" varStatus="status">
            <c:choose>
                <c:when test="${a != null}">
                    <td style="background: ${a.color};">${a.name}</td>
                </c:when>
                <c:otherwise>
                    <td class="bg-warning">
                        <form action="createActivity.jsp">
                            <input type="hidden" name="id" value="${id}">
                            <input type="hidden" name="time" value="12-14">
                            <input type="hidden" name="day" value="${status.index}">
                            <input type="submit" class="btn btn-warning" value="Add"/>
                        </form>
                    </td>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </tr>
    <tr>
        <th scope="row" class="bg-success">14:00 - 16:00</th>
        <c:forEach items="${a_14_16}" var="a" varStatus="status">
            <c:choose>
                <c:when test="${a != null}">
                    <td style="background: ${a.color};">${a.name}</td>
                </c:when>
                <c:otherwise>
                    <td class="bg-warning">
                        <form action="createActivity.jsp">
                            <input type="hidden" name="id" value="${id}">
                            <input type="hidden" name="time" value="14-16">
                            <input type="hidden" name="day" value="${status.index}">
                            <input type="submit" class="btn btn-warning" value="Add"/>
                        </form>
                    </td>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </tr>
    </tbody>
</table>
<form action="plannings.jsp">
    <div class="modal-body">
        <div class="modal-footer">
            <input type="submit" class="btn btn-primary" value="Finish"/>
        </div>
    </div>
</form>
</body>
</html>
