<%-- 
    Document   : DeleteProduct
    Created on : Jul 14, 2020, 4:59:01 PM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id=request.getParameter("id");
    DBConnection db=new DBConnection();
    try
    {
        db.pstmt=db.con.prepareStatement("delete from manageinventory where id=?");
        db.pstmt.setString(1,id);
        int i=db.pstmt.executeUpdate();
        if(i>0)
        {
            response.sendRedirect("ManageInventory.jsp");
        }
        else
        {
            response.sendRedirect("ManageInventory.jsp");
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>