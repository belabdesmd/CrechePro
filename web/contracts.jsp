<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contracts</title>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
<jsp:include page="navbar.html"/>
<% session.removeAttribute("parent"); %>
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
                    <button class="dropdown-item" type="button" onclick="filterDisabled()">Disabled Contracts</button>
                    <button class="dropdown-item" type="button" onclick="filterASC()">Sort Contracts (ASC)</button>
                    <button class="dropdown-item" type="button" onclick="filterDESC()">Sort Contracts (DESC)</button>
                </div>
            </div>
        </div>
        <div class="col-sm-1" data-toggle="modal" data-target="#exampleModal">
            <input class="btn btn-dark" type="submit" value="Create">
        </div>
    </div>
</div>
<br/>
<div class="contracts">
    <jsp:include page="descContracts.jsp"/>
</div>
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

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>
    function filterDisabled() {
        $(".contracts").load("disabledContracts.jsp");
    }

    function filterASC() {
        $(".contracts").load("ascContracts.jsp");

    }

    function filterDESC() {
        $(".contracts").load("descContracts.jsp");

    }
</script>
</body>
</html>
