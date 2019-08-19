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
        List<Contract> contracts = ContractDAO.getContracts(DBHelper.getConnection(), true, false);
        request.setAttribute("contracts", contracts);
    %>
    <c:forEach items="${contracts}" var="c">
        <tr>
            <td></td>
            <th scope="row">${c.getId()}</th>
            <td>${c.getChild().getFirst_name()}</td>
            <td>${c.getChild().getLast_name()}</td>
            <td>${c.getBegin_date()}</td>
            <td>${c.getEnd_date()}</td>
            <td>
                <input class="view btn btn-dark" type="submit" value="View">
                <form action="deleteContract.jsp" method="get">
                    <input class="delete btn btn-danger" type="submit" value="Delete">
                    <input type="hidden" name="id" value="${c.id}">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

