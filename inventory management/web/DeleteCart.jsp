<%-- 
    Document   : DeleteCart
    Created on : Jul 15, 2020, 5:55:59 PM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String productname=request.getParameter("productname");
    String id=request.getParameter("id");
    int quantityrequired=Integer.parseInt(request.getParameter("quantityrequired"));
    int finalprice=Integer.parseInt(request.getParameter("finalprice"));
    DBConnection db=new DBConnection();
    try
    {
     db.pstmt=db.con.prepareStatement("select quantity,inventory from manageinventory where productname=?");
        db.pstmt.setString(1,productname);
        db.rst=db.pstmt.executeQuery();
        if(db.rst.next())
        {
            int q1=db.rst.getInt(1);
            int inven=db.rst.getInt(2);
            int q2=q1+quantityrequired;
            int in=inven+finalprice;
  db.pstmt=db.con.prepareStatement("update manageinventory set quantity=?, inventory=? where productname=?");
            db.pstmt.setInt(1,q2);
            db.pstmt.setInt(2,in);
            db.pstmt.setString(3,productname);
            int i1=db.pstmt.executeUpdate();
            db.pstmt=db.con.prepareStatement("delete from addtocart where id=?");
        db.pstmt.setString(1,id);
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
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>