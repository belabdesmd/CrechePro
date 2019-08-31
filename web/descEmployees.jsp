<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%@ page import="com.crechepro.bean.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crechepro.dao.EmployeeDAO" %>
<table class="table table-hover">
    <thead>
    <tr>
        <th></th>
        <th scope="col">#</th>
        <th scope="col">First Name</th>
        <th scope="col">Last Name</th>
        <th scope="col">Birthday</th>
        <th scope="col">Email</th>
        <th scope="col">Phone</th>
        <th scope="col">Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Employee> employees = EmployeeDAO.getEmployees(DBHelper.getConnection(), false);
        request.setAttribute("employees", employees);
    %>
    <c:forEach items="${employees}" var="e">
        <tr>
            <td></td>
            <th scope="row">${e.id}</th>
            <td>${e.first_name}</td>
            <td>${e.last_name}</td>
            <td>${e.birthday}</td>
            <td>${e.email}</td>
            <td>${e.phone}</td>
            <td>
                <form action="viewEmployee.jsp" method="get">
                    <input class="view btn btn-dark" type="submit" value="View">
                    <input type="hidden" name="contractId" value="${e.id}">
                </form>
                <form action="deleteEmployee.jsp" method="get">
                    <input class="delete btn btn-danger" type="submit" value="Delete">
                    <input type="hidden" name="id" value="${e.id}">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
