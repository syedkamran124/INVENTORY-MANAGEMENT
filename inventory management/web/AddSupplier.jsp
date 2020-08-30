<%-- 
    Document   : AddSupplier
    Created on : Jul 13, 2020, 3:18:20 PM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String suppliername=request.getParameter("suppliername");
    String contact=request.getParameter("contact");
    String address=request.getParameter("address");
    DBConnection db=new DBConnection();
    try
    {
        db.pstmt=db.con.prepareStatement("insert into managesupplier(suppliername,contact,address) "
                + "values(?,?,?)");
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