<%-- 
    Document   : DeleteAllTransaction
    Created on : Jul 16, 2020, 6:54:17 PM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DBConnection db=new DBConnection();
    try
    {
        db.pstmt=db.con.prepareStatement("delete from transaction");
        int i=db.pstmt.executeUpdate();
        if(i>0)
        {
            response.sendRedirect("Transaction.jsp");
        }
        else
        {
            response.sendRedirect("Transaction.jsp");
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>