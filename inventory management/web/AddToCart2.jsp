<%-- 
    Document   : AddToCart2
    Created on : Jul 15, 2020, 3:01:45 PM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id=request.getParameter("id");
    String customername=request.getParameter("customername");
    String productname=request.getParameter("productname");
    String measurement=request.getParameter("measurement");
    String supplier=request.getParameter("supplier");
    int quantityrequired=Integer.parseInt(request.getParameter("quantityrequired"));
    int finalprice=Integer.parseInt(request.getParameter("finalprice"));
    DBConnection db=new DBConnection();
    try
    {
        db.pstmt=db.con.prepareStatement("select quantity,inventory from manageinventory where id=?");
        db.pstmt.setString(1,id);
        db.rst=db.pstmt.executeQuery();
        if(db.rst.next())
        {
            int quan=db.rst.getInt(1);
            int inven=db.rst.getInt(2);
            if(quan>=quantityrequired)
            {
                int q=quan-quantityrequired;
                int in=inven-finalprice;
         db.pstmt=db.con.prepareStatement("update manageinventory set quantity=?, inventory=? where id=?");
                db.pstmt.setInt(1,q);
                db.pstmt.setInt(2,in);
                db.pstmt.setString(3,id);
                int i1=db.pstmt.executeUpdate();
     db.pstmt=db.con.prepareStatement("insert into addtocart(customername,productname,measurement,supplier,"
                + "quantityrequired,finalprice) values(?,?,?,?,?,?)");
        db.pstmt.setString(1,customername);
        db.pstmt.setString(2,productname);
        db.pstmt.setString(3,measurement);
        db.pstmt.setString(4,supplier);
        db.pstmt.setInt(5,quantityrequired);
        db.pstmt.setInt(6,finalprice);
        int i2=db.pstmt.executeUpdate();
        if(i2>0)
        {
            response.sendRedirect("Checkout.jsp");
        }
        else
        {
            response.sendRedirect("Checkout.jsp");
        }
            }
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>