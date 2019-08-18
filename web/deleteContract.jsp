<%@page import="com.crechepro.dao.ContractDAO, com.crechepro.utils.DBHelper" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    ContractDAO.deleteContract(DBHelper.getConnection(), Integer.valueOf(request.getParameter("id")));
    response.sendRedirect("contracts.jsp");
%>