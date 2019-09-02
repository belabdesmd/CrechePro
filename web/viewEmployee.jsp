<%@ page import="com.crechepro.bean.Employee" %>
<%@ page import="com.crechepro.dao.EmployeeDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%@ page import="com.crechepro.dao.AdminDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee</title>
</head>
<body>
<%
    session.setAttribute("current", "employees");
%>
<jsp:include page="navbar.jsp"/>
<br/>
<%
    try {
        Employee employee = EmployeeDAO.getEmployee(DBHelper.getConnection(), Integer.valueOf(request.getParameter("employeeId")));
        request.setAttribute("employee", employee);

    } catch (NumberFormatException e) {
        //Ignore
    }
%>
<div class="card">
    <div class="card-body">
        <div class="container">
            <div class="row">
                <div class="col-sm-1">
                </div>
                <div class="col-sm-3">
                    <%
                        Employee employee = ((Employee) (request.getAttribute("employee")));
                        if (AdminDAO.isAdmin(DBHelper.getConnection(), employee.getId()))
                            out.println("<img src=\"images/admin.png\" style=\"width: 200px; height: 300px;\" alt=\"Profile Picture\">\n");
                        else
                            out.println("<img src=\"images/" + employee.getFirst_name() + "_" + employee.getLast_name() + ".png\" style=\"width: 200px; height: 300px;\" alt=\"Profile Picture\">\n");
                    %>
                </div>
                <div class="col-sm-8">
                    <dl class="row">
                        <dt class="col-sm-3">ID:</dt>
                        <dd class="col-sm-9">${employee.id}</dd>
                    </dl>
                    <dl class="row">
                        <dt class="col-sm-3">First Name:</dt>
                        <dd class="col-sm-9">${employee.first_name}</dd>
                    </dl>
                    <dl class="row">
                        <dt class="col-sm-3">Last Name:</dt>
                        <dd class="col-sm-9">${employee.last_name}</dd>
                    </dl>
                    <dl class="row">
                        <dt class="col-sm-3">Gender:</dt>
                        <dd class="col-sm-9">${employee.gender}</dd>
                    </dl>
                    <dl class="row">
                        <dt class="col-sm-3">Birthday:</dt>
                        <dd class="col-sm-9">${employee.birthday}</dd>
                    </dl>
                    <dl class="row">
                        <dt class="col-sm-3">Email:</dt>
                        <dd class="col-sm-9">${employee.email}</dd>
                    </dl>
                    <dl class="row">
                        <dt class="col-sm-3">Address:</dt>
                        <dd class="col-sm-9">${employee.address}</dd>
                    </dl>
                    <dl class="row">
                        <dt class="col-sm-3">Phone:</dt>
                        <dd class="col-sm-9">${employee.phone}</dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
</div>
</body>