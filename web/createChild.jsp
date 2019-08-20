<%@ page import="com.crechepro.dao.ChildDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%@ page import="com.crechepro.bean.Parent" %>

<%
    System.out.println(((Parent) session.getAttribute("parent")).getId());
    ChildDAO.createChild(DBHelper.getConnection(), request.getParameter("first_name"), request.getParameter("last_name"),
            request.getParameter("gender"), request.getParameter("birthday"), ((Parent) session.getAttribute("parent")));

    response.sendRedirect("children.jsp");
%>