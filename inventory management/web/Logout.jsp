<%-- 
    Document   : Logout
    Created on : Jul 13, 2020, 2:06:48 AM
    Author     : Kamran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>