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
<jsp:include page="navbar.html"/>
<br/>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label for="from">From</label>
                <input type="date" class="form-control" id="from" name="from">
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label for="to">To</label>
                <input type="date" class="form-control" id="to" name="to">
            </div>
        </div>
        <div class="col-sm-2">
            <form action="addPlanning.jsp">
                <div class="form-group">
                    <label><br/></label>
                    <input class="form-control btn btn-dark" type="submit" value="Create">
                </div>
            </form>
        </div>
    </div>
</div>
<br/>
<%
    String start_date, end_date;
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();

    if (request.getParameter("start_date") != null)
        start_date = request.getParameter("start_date");
    else start_date = dateFormat.format(date);

    if (request.getParameter("end_date") != null)
        end_date = request.getParameter("end_date");
    else end_date = dateFormat.format(date);


    Planning planning = PlanningDAO.getPlanning(DBHelper.getConnection(), start_date, end_date);
    request.setAttribute("saturday", planning.getSaturday());
    request.setAttribute("sunday", planning.getSunday());
    request.setAttribute("monday", planning.getMonday());
    request.setAttribute("tuesday", planning.getTuesday());
    request.setAttribute("wednesday", planning.getWednesday());
    request.setAttribute("thursday", planning.getThursday());
    request.setAttribute("friday", planning.getFriday());
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
        <c:choose>
            <c:when test="${sunday.get(0) != null}">
                <td style="background: ${sunday.get(0).color};">${sunday.get(0).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${monday.get(0) != null}">
                <td style="background: ${monday.get(0).color};">${monday.get(0).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${tuesday.get(0) != null}">
                <td style="background: ${tuesday.get(0).color};">${tuesday.get(0).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${wednesday.get(0) != null}">
                <td style="background: ${wednesday.get(0).color};">${wednesday.get(0).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${thursday.get(0) != null}">
                <td style="background: ${thursday.get(0).color};">${thursday.get(0).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${friday.get(0) != null}">
                <td style="background: ${friday.get(0).color};">${friday.get(0).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${saturday.get(0) != null}">
                <td style="background: ${saturday.get(0).color};">${saturday.get(0).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
    </tr>
    <tr>
        <th scope="row" class="bg-success">10:00 - 12:00</th>
        <c:choose>
            <c:when test="${sunday.get(1) != null}">
                <td style="background: ${sunday.get(1).color};">${sunday.get(1).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${monday.get(1) != null}">
                <td style="background: ${monday.get(1).color};">${monday.get(1).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${tuesday.get(1) != null}">
                <td style="background: ${tuesday.get(1).color};">${tuesday.get(1).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${wednesday.get(1) != null}">
                <td style="background: ${wednesday.get(1).color};">${wednesday.get(1).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${thursday.get(1) != null}">
                <td style="background: ${thursday.get(1).color};">${thursday.get(1).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${friday.get(1) != null}">
                <td style="background: ${friday.get(1).color};">${friday.get(1).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${saturday.get(1) != null}">
                <td style="background: ${saturday.get(1).color};">${saturday.get(1).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
    </tr>
    <tr>
        <th scope="row" class="bg-success">12:00 - 14:00</th>
        <c:choose>
            <c:when test="${sunday.get(2) != null}">
                <td style="background: ${sunday.get(2).color};">${sunday.get(2).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${monday.get(2) != null}">
                <td style="background: ${monday.get(2).color};">${monday.get(2).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${tuesday.get(2) != null}">
                <td style="background: ${tuesday.get(2).color};">${tuesday.get(2).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${wednesday.get(2) != null}">
                <td style="background: ${wednesday.get(2).color};">${wednesday.get(2).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${thursday.get(2) != null}">
                <td style="background: ${thursday.get(2).color};">${thursday.get(2).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${friday.get(2) != null}">
                <td style="background: ${friday.get(2).color};">${friday.get(2).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${saturday.get(2) != null}">
                <td style="background: ${saturday.get(2).color};">${saturday.get(2).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
    </tr>
    <tr>
        <th scope="row" class="bg-success">14:00 - 16:00</th>
        <c:choose>
            <c:when test="${sunday.get(3) != null}">
                <td style="background: ${sunday.get(3).color};">${sunday.get(3).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${monday.get(3) != null}">
                <td style="background: ${monday.get(3).color};">${monday.get(3).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${tuesday.get(3) != null}">
                <td style="background: ${tuesday.get(3).color};">${tuesday.get(3).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${wednesday.get(3) != null}">
                <td style="background: ${wednesday.get(3).color};">${wednesday.get(3).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${thursday.get(3) != null}">
                <td style="background: ${thursday.get(3).color};">${thursday.get(3).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${friday.get(3) != null}">
                <td style="background: ${friday.get(3).color};">${friday.get(3).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${saturday.get(3) != null}">
                <td style="background: ${saturday.get(3).color};">${saturday.get(3).name}</td>
            </c:when>
            <c:otherwise>
                <td class="bg-danger"></td>
            </c:otherwise>
        </c:choose>
    </tr>
    </tbody>
</table>
</body>
</html>
