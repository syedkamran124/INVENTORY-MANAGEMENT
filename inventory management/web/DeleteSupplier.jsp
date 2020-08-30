<%-- 
    Document   : DeleteSupplier
    Created on : Jul 13, 2020, 4:00:20 PM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id=request.getParameter("id");
    DBConnection db=new DBConnection();
    try
    {
        db.pstmt=db.con.prepareStatement("delete from managesupplier where id=?");
        db.pstmt.setString(1,id);
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