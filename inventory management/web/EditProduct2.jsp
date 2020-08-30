<%-- 
    Document   : EditProduct2
    Created on : Jul 14, 2020, 4:59:22 PM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id=request.getParameter("id");
    String productname=request.getParameter("productname");
    int quantity=Integer.parseInt(request.getParameter("quantity"));
    String measurement=request.getParameter("measurement");
    String originalprice=request.getParameter("originalprice");
    String profit=request.getParameter("profit");
    int sellingprice=Integer.parseInt(request.getParameter("sellingprice"));
    String supplier=request.getParameter("supplier");
    int inventory=quantity*sellingprice;
    DBConnection db=new DBConnection();
    try
    {
       db.pstmt=db.con.prepareStatement("update manageinventory set productname=?, quantity=?, measurement=?, "
           + "originalprice=?, profit=?, sellingprice=?, supplier=?, inventory=? where id='"+id+"'");
        db.pstmt.setString(1,productname);
        db.pstmt.setInt(2,quantity);
        db.pstmt.setString(3,measurement);
        db.pstmt.setString(4,originalprice);
        db.pstmt.setString(5,profit);
        db.pstmt.setInt(6,sellingprice);
        db.pstmt.setString(7,supplier);
        db.pstmt.setInt(8,inventory);
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