<%@ page import="com.crechepro.utils.PDFUtils" %>
<%
    PDFUtils.setPdfPath(Integer.valueOf(request.getParameter("contractId")));
    response.sendRedirect("contract.pdf");
%>
