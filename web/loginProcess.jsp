<%@ page import="com.crechepro.dao.AdminDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%
    System.out.println("test");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    boolean logged = AdminDAO.adminLogin(DBHelper.getConnection(), username, password);

    if (logged){
        session.setAttribute("username", username);
        session.setAttribute("password", password);
    }

    response.sendRedirect(request.getParameter("next"));
%>
