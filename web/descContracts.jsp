<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.crechepro.bean.Contract" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crechepro.dao.ContractDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<table class="table table-hover">
    <thead>
    <tr>
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
        List<Contract> contracts = ContractDAO.getContracts(DBHelper.getConnection(), false, false);
        request.setAttribute("contracts", contracts);
        request.setAttribute("count", contracts.size());
    %>
    <c:if test="${count == 0}">
        <tr>
            <td colspan="6">No Contracts</td>
        </tr>
    </c:if>
    <c:forEach items="${contracts}" var="e">
        <tr>
            <th scope="row">${e.id}</th>
            <td>${e.child.first_name}</td>
            <td>${e.child.first_name}</td>
            <td>${e.begin_date}</td>
            <td>${e.end_date}</td>
            <td>
                <form action="viewContract.jsp" method="get">
                    <input class="view btn btn-dark" type="submit" value="View">
                    <input type="hidden" name="contractId" value="${e.child.id}">
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

