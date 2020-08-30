<%-- 
    Document   : EditSupplier2
    Created on : Jul 14, 2020, 1:46:50 PM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id=request.getParameter("id");
    String suppliername=request.getParameter("suppliername");
    String contact=request.getParameter("contact");
    String address=request.getParameter("address");
    DBConnection db=new DBConnection();
    try
    {
        db.pstmt=db.con.prepareStatement("update managesupplier set suppliername=?, contact=?, address=? "
                + "where id='"+id+"'");
        db.pstmt.setString(1,suppliername);
        db.pstmt.setString(2,contact);
        db.pstmt.setString(3,address);
        int i=db.pstmt.executeUpdate();
        if(i>0)
        {
            response.sendRedirect("Dashboard.jsp");
        }
        else
        {
            response.sendRedirect("Dashboard.jsp");
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>