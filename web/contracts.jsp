<%@ page import="java.util.ArrayList" %>
<%@ page import="com.crechepro.bean.Contract" %>
<%@ page import="com.crechepro.dao.ContractDAO,java.util.*,com.crechepro.utils.DBHelper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contracts</title>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
<jsp:include page="navbar.html"/>
<br/>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-11">
            <div class="btn-group btn-block">
                <button type="button" class="btn btn-outline-dark dropdown-toggle" data-toggle="dropdown"
                        data-display="static" aria-haspopup="true" aria-expanded="false" style="text-align: start;">
                    Filter
                </button>
                <div class="dropdown-menu dropdown-menu-lg-right">
                    <button class="dropdown-item" type="button">Action</button>
                    <button class="dropdown-item" type="button">Another action</button>
                    <button class="dropdown-item" type="button">Something else here</button>
                </div>
            </div>
        </div>
        <div class="col-sm-1" data-toggle="modal" data-target="#exampleModal">
            <input class="btn btn-dark" type="submit" value="Create">
        </div>
    </div>
</div>
<br/>
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
        List<Contract> contracts = ContractDAO.getContracts(DBHelper.getConnection());
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

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Create Contract</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="children.jsp">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="status">Status</label>
                        <select class="form-control" id="status" name="status">
                            <option>Mr</option>
                            <option>Ms</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="first_name">First Name</label>
                        <input type="text" class="form-control" id="first_name" name="first_name">
                    </div>
                    <div class="form-group">
                        <label for="last_name">Last Name</label>
                        <input type="text" class="form-control" id="last_name" name="last_name">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="name@example.com"
                               name="email">
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" id="address" name="address">
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="number" class="form-control" id="phone" name="phone">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="Add Children"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
