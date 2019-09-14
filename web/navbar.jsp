<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/css/main.css"/>
</head>
<body>
<%
    request.setAttribute("current", session.getAttribute("current"));
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.jsp">CrechePro</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02"
            aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <c:set var="c" value="${current}"/>
            <c:choose>
                <c:when test="${c == 'contracts'}">
                    <li class="nav-item active">
                        <a class="nav-link" href="contracts.jsp">Contracts <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="plannings.jsp">Plannings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="employees.jsp">Employees</a>
                    </li>
                </c:when>
                <c:when test="${c == 'plannings'}">
                    <li class="nav-item">
                        <a class="nav-link" href="contracts.jsp">Contracts</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="plannings.jsp">Plannings <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="employees.jsp">Employees</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link" href="contracts.jsp">Contracts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="plannings.jsp">Plannings</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="employees.jsp">Employees <span class="sr-only">(current)</span></a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
        <%
            if (session.getAttribute("username") != null)
                out.print("<a style=\"color: #FFF;\" class=\"nav-link\" href=\"logout.jsp?next=index.jsp\">logout</a>" +
                        "<a style=\"color: #FFF;\" class=\"nav-link\" href=\"admins.jsp?first=false\">Add Admin</a>");
            else
                out.print("<a style=\"color: #FFF;\" class=\"nav-link\" href=\"loginForm.jsp?next=index.jsp\">login</a>");
        %>
    </div>
</nav>

<script src="${pageContext.request.contextPath}/style/js/jquery_slim.js"></script>
<script src="${pageContext.request.contextPath}/style/js/popper.js"></script>
<script src="style/js/bootstrap.min.js"></script>
</body>
</html>