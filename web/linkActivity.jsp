<%@ page import="com.crechepro.dao.PlanningDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>

<%
    int activity_id;
    if (request.getParameter("activities") != null) {
        activity_id = PlanningDAO.getActivityId(DBHelper.getConnection(), request.getParameter("activities"));
    } else {
        activity_id = PlanningDAO.getActivityId(DBHelper.getConnection(), request.getParameter("name"), request.getParameter("description"),
                request.getParameter("color"));
    }

    System.out.println("linkActivity : " + request.getParameter("planning_id"));

    PlanningDAO.linkActivity(DBHelper.getConnection(), request.getParameter("planning_id"), activity_id,
            request.getParameter("day"), request.getParameter("time"));

    response.sendRedirect("addActivities.jsp?planning_id=" + request.getParameter("planning_id"));
%>