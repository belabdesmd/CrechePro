<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Employees</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
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
                    <button class="dropdown-item" type="button" onclick="filterASC()">Sort Employees (ASC)</button>
                    <button class="dropdown-item" type="button" onclick="filterDESC()">Sort Employees (DESC)</button>
                </div>
            </div>
        </div>
        <%
            if (session.getAttribute("username") != null)
                out.print("<div class=\"col-sm-1\" data-toggle=\"modal\" data-target=\"#exampleModal-1\">" +
                        "<input class=\"btn btn-dark\" type=\"submit\" value=\"Create\">" +
                        "</div>");
            else
                out.print("<div class=\"col-sm-1\">" +
                        "<input class=\"btn btn-dark\" type=\"submit\" value=\"Create\" disabled>" +
                        "</div>");
        %>
    </div>
</div>
<br/>
<div class="employees">
    <jsp:include page="descEmployees.jsp"/>
</div>

<!-- Modal -->
<div class="modal fade" id="employeeModal" tabindex="-1" role="dialog" aria-labelledby="employeeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="employeeModalLabel">Create Employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="createEmployee.jsp" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="first_name">First Name</label>
                        <input type="text" class="form-control" id="first_name" name="first_name">
                    </div>
                    <div class="form-group">
                        <label for="last_name">Last Name</label>
                        <input type="text" class="form-control" id="last_name" name="last_name">
                    </div>
                    <%--                    <div class="form-group">--%>
                    <%--                        <label for="profile_picture">Profile Picture</label>--%>
                    <input type="file" class="form-control" id="profile_picture" name="profile_picture">
                    <%--                    </div>--%>
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <select class="form-control" id="gender" name="gender">
                            <option>Male</option>
                            <option>Female</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="birthday">Birthday</label>
                        <input type="date" class="form-control" id="birthday" name="birthday">
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
                        <input type="submit" class="btn btn-primary" value="Add Employee"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>
    function filterASC() {
        $(".employees").load("ascEmployees.jsp");
    }

    function filterDESC() {
        $(".employees").load("descEmployees.jsp");
    }
</script>
</body>
</html>
