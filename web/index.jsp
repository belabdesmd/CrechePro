<%@ page import="com.crechepro.dao.AdminDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    if (AdminDAO.adminExists(DBHelper.getConnection()))
        response.sendRedirect("contracts.jsp");
    else response.sendRedirect("firstAdmin.jsp?first=true");
%>
</body>
</html>
