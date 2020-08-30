<%-- 
    Document   : Sell
    Created on : Jul 16, 2020, 2:06:06 PM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DBConnection db=new DBConnection();
    try
    {
        db.pstmt=db.con.prepareStatement("insert into transaction select * from addtocart");
        db.pstmt.executeUpdate();
        db.pstmt=db.con.prepareStatement("delete from addtocart");
        int i=db.pstmt.executeUpdate();
        if(i>0)
        {
            response.sendRedirect("Checkout.jsp");
        }
        else
        {
            response.sendRedirect("Checkout.jsp");
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>