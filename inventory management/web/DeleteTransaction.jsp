<%-- 
    Document   : DeleteTransaction
    Created on : Jul 16, 2020, 6:53:38 PM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id=request.getParameter("id");
    DBConnection db=new DBConnection();
    try
    {
        db.pstmt=db.con.prepareStatement("delete from transaction where id=?");
        db.pstmt.setString(1,id);
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