<%@ page import="com.crechepro.dao.ContractDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%
    int id = 0;
    try {
        id = Integer.valueOf(request.getParameter("contractId"));
    } catch (NumberFormatException e) {
        //Ignore
    }
    System.out.println(id);
    ContractDAO.renewContract(DBHelper.getConnection(), id);

    response.sendRedirect("contracts.jsp");
%>