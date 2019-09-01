<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.crechepro.bean.Contract" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crechepro.dao.ContractDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<table class="table table-hover">
    <thead>
    <tr>
        <th></th>
        <th scope="col">#</th>
        <th scope="col">First Name</th>
        <th scope="col">Last Name</th>
        <th scope="col">Date Start</th>
        <th scope="col">Date End</th>
        <th scope="col">Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Contract> contracts = ContractDAO.getContracts(DBHelper.getConnection(), false, true);
        request.setAttribute("contracts", contracts);
    %>
    <c:forEach items="${contracts}" var="e">
        <tr>
            <td></td>
            <th scope="row">${e.getId()}</th>
            <td>${e.getChild().getFirst_name()}</td>
            <td>${e.getChild().getLast_name()}</td>
            <td>${e.getBegin_date()}</td>
            <td>${e.getEnd_date()}</td>
            <td>
                <form action="viewContract.jsp" method="get">
                    <input class="view btn btn-dark" type="submit" value="View">
                    <input type="hidden" name="contractId" value="${e.getChild().getId()}">
                </form>
                <form action="deleteContract.jsp" method="get">
                    <%
                        if (session.getAttribute("username") != null)
                            out.print("<input class=\"delete btn btn-danger\" type=\"submit\" value=\"Delete\">");
                        else
                            out.print("<input class=\"delete btn btn-danger\" type=\"submit\" value=\"Delete\" disabled>");
                    %>
                    <input type="hidden" name="id" value="${e.id}">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
