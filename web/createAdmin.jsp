<%@ page import="com.crechepro.bean.Employee" %>
<%@ page import="com.crechepro.dao.AdminDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%
    //Create Employee
    Employee employee = new Employee();
    employee.setFirst_name(request.getParameter("first_name"));
    employee.setLast_name(request.getParameter("last_name"));
    employee.setGender(request.getParameter("gender"));
    employee.setBirthday(request.getParameter("birthday"));
    employee.setEmail(request.getParameter("email"));
    employee.setAddress(request.getParameter("address"));
    try{
        employee.setPhone(Integer.valueOf(request.getParameter("phone")));
    }catch (NumberFormatException e){
        //Ignore
    }

    //Get Admin Infos
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    //Create Admin
    AdminDAO.createAdmin(DBHelper.getConnection(), employee, username, password);

    //login
    session.setAttribute("username", username);
    session.setAttribute("password", password);

    //Redirect
    response.sendRedirect("contracts.jsp");
%>