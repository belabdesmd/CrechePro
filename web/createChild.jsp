<%@ page import="com.crechepro.dao.ChildDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>

<%
    ChildDAO.createChild(DBHelper.getConnection(), request.getParameter("first_name"), request.getParameter("last_name"),
            request.getParameter("gender"), request.getParameter("birthday"), Integer.parseInt(request.getParameter("parentId")));
    System.out.println("test");
    System.out.println(request.getRequestURI());
    response.sendRedirect("children.jsp");
%>