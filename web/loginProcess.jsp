<%@ page import="com.crechepro.dao.AdminDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    boolean logged = AdminDAO.adminLogin(DBHelper.getConnection(), username, password);

    if (logged){
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        response.sendRedirect(request.getParameter("next"));
    }else{
        response.sendRedirect("loginForm.jsp?msg=error");
    }
%>
