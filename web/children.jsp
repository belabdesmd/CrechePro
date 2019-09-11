<%@ page import="com.crechepro.dao.ParentDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%@ page import="com.crechepro.bean.Child" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crechepro.dao.ChildDAO" %>
<%@ page import="com.crechepro.bean.Parent" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Children</title>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>

<%
    session.setAttribute("current", "contracts");
%>
<jsp:include page="navbar.jsp"/>
<br/>
<%
    Parent parent;

    //Get Praent
    if (session.getAttribute("parent") == null) {
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
    } else parent = ((Parent) session.getAttribute("parent"));

    //Set Parent
    session.setAttribute("parent", parent);

    //Get Parent's Children
    List<Child> children = ChildDAO.getChildren(DBHelper.getConnection(), parent.getId());

    //SEt Attributes
    request.setAttribute("children", children);
    request.setAttribute("count", children.size());
    request.setAttribute("parent", parent);
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-1">
            <form action="contracts.jsp">
                <input class="btn btn-dark" type="submit" value="Back">
            </form>
        </div>
        <div class="col-sm-10">
            <dl class="row">
                <dt class="col-sm-3"></dt>
                <dt class="col-sm-3">First Name:</dt>
                <dd class="col-sm-3">${parent.first_name}</dd>
                <dt class="col-sm-3"></dt>
            </dl>
            <dl class="row">
                <dt class="col-sm-3"></dt>
                <dt class="col-sm-3">Last Name:</dt>
                <dd class="col-sm-3">${parent.last_name}</dd>
                <dt class="col-sm-3"></dt>
            </dl>
            <dl class="row">
                <dt class="col-sm-3"></dt>
                <dt class="col-sm-3">Status:</dt>
                <dd class="col-sm-3">${parent.status}</dd>
                <dt class="col-sm-3"></dt>
            </dl>
            <dl class="row">
                <dt class="col-sm-3"></dt>
                <dt class="col-sm-3">Email:</dt>
                <dd class="col-sm-3">${parent.email}</dd>
                <dt class="col-sm-3"></dt>
            </dl>
            <dl class="row">
                <dt class="col-sm-3"></dt>
                <dt class="col-sm-3">Address:</dt>
                <dd class="col-sm-3">${parent.address}</dd>
                <dt class="col-sm-3"></dt>
            </dl>
            <dl class="row">
                <dt class="col-sm-3"></dt>
                <dt class="col-sm-3">Phone:</dt>
                <dd class="col-sm-3">${parent.phone}</dd>
                <dt class="col-sm-3"></dt>
            </dl>
        </div>
        <%
            if (session.getAttribute("username") != null)
                out.print("<div class=\"col-sm-1\" data-toggle=\"modal\" data-target=\"#createChildModal\">" +
                        "<input class=\"btn btn-dark\" type=\"submit\" value=\"Create\">" +
                        "</div>");
            else
                out.print("<div class=\"col-sm-1\">" +
                        "<input class=\"btn btn-dark\" type=\"submit\" value=\"Create\" disabled>" +
                        "</div>");
        %>
    </div>
</div>
<table class="table table-hover">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">First Name</th>
        <th scope="col">Last Name</th>
        <th scope="col">Gender</th>
        <th scope="col">Birthday</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${count == 0}">
        <tr>
            <td colspan="5">No Children</td>
        </tr>
    </c:if>
    <c:forEach items="${children}" var="e">
        <tr>
            <th scope="row">${e.id}</th>
            <td>${e.first_name}</td>
            <td>${e.last_name}</td>
            <td>${e.gender}</td>
            <td>${e.birthday}</td>
            <td></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Modal -->
<div class="modal fade" id="createChildModal" tabindex="-1" role="dialog" aria-labelledby="createChildModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createChildModalLabel">Create Contract</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="createContract.jsp">
                <input type="hidden" name="parentId" value="${parent.id}">
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
                        <input type="submit" class="btn btn-success" value="Add Child"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
