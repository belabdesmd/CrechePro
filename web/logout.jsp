<%
    session.removeAttribute("username");
    session.removeAttribute("password");

    response.sendRedirect(request.getParameter("next"));
%>
