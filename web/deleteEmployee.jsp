<%@ page import="com.crechepro.dao.EmployeeDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%
    EmployeeDAO.deleteEmployee(DBHelper.getConnection(), Integer.valueOf(request.getParameter("id")));
    response.sendRedirect("employees.jsp");
%>