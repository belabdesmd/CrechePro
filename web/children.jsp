<%@ page import="com.crechepro.dao.ParentDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%@ page import="com.crechepro.bean.Child" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crechepro.dao.ChildDAO" %>
<%@ page import="com.crechepro.bean.Parent" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Children</title>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
<jsp:include page="navbar.html"/>
<br/>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-1">
            <form action="contracts.jsp">
                <input class="btn btn-dark" type="submit" value="Back">
            </form>
        </div>
        <div class="col-sm-10">
        </div>
        <div class="col-sm-1" data-toggle="modal" data-target="#exampleModal">
            <input class="btn btn-dark" type="submit" value="Create">
        </div>
    </div>
</div>

<table class="table table-hover">
    <thead>
    <tr>
        <th></th>
        <th scope="col">#</th>
        <th scope="col">First Name</th>
        <th scope="col">Last Name</th>
        <th scope="col">Gender</th>
        <th scope="col">Birthday</th>
    </tr>
    </thead>
    <tbody>
    <%

        Parent parent;


        if (session.getAttribute("parent") == null) {
            System.out.println();
            parent = new Parent();
            parent.setStatus(request.getParameter("status"));
            parent.setFirst_name(request.getParameter("first_name"));
            parent.setLast_name(request.getParameter("last_name"));
            parent.setEmail(request.getParameter("email"));
            try {
                parent.setPhone(Integer.valueOf(request.getParameter("phone")));
            } catch (NumberFormatException e) {
                //Ignore
            }
            parent.setAddress(request.getParameter("address"));
            parent.setId(ParentDAO.getParentId(DBHelper.getConnection(), parent.getStatus(), parent.getFirst_name()
                    , parent.getLast_name(), parent.getEmail(), parent.getAddress(), parent.getPhone()));
        }
        else parent = ((Parent) session.getAttribute("parent"));

        session.setAttribute("parent", parent);

        List<Child> children = ChildDAO.getChildren(DBHelper.getConnection(), parent.getId());
        request.setAttribute("children", children);
        request.setAttribute("parentId", parent.getId());
    %>
    <c:forEach items="${children}" var="e">
        <tr>
            <td></td>
            <th scope="row">${e.getId()}</th>
            <td>${e.getFirst_name()}</td>
            <td>${e.getLast_name()}</td>
            <td>${e.getGender()}</td>
            <td>${e.getBirthday()}</td>
            <td></td>
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
            <form action="createChild.jsp">
                <input type="hidden" name="parentId" value="${parentId}">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="first_name">First Name</label>
                        <input type="text" class="form-control" id="first_name" name="first_name">
                    </div>
                    <div class="form-group">
                        <label for="last_name">Last Name</label>
                        <input type="text" class="form-control" id="last_name" name="last_name">
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <select class="form-control" id="gender" name="gender">
                            <option>male</option>
                            <option>female</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="birthday">Birthday</label>
                        <input type="date" class="form-control" id="birthday" name="birthday">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="Add Child"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
