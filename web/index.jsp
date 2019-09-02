<%@ page import="com.crechepro.dao.AdminDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
    if (AdminDAO.adminExists(DBHelper.getConnection())) {
        response.sendRedirect("contracts.jsp");
    }
    else response.sendRedirect("admins.jsp?first=true");
%>
