<%-- 
    Document   : AdminLogin
    Created on : Jul 11, 2020, 7:39:10 PM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username=request.getParameter("username");
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    DBConnection db=new DBConnection();
    try
    {
        db.pstmt=db.con.prepareStatement("select password from login where username=? or email=?");
        db.pstmt.setString(1,username);
        db.pstmt.setString(2,email);
        db.rst=db.pstmt.executeQuery();
        if(db.rst.next())
        {
            if(db.rst.getString(1).equals(password))
            {
                session.setAttribute("username",username);
                session.setAttribute("email",email);
                response.sendRedirect("Dashboard.jsp");
            }
            else
            {
                session.setAttribute("error","Incorrect Password");
                response.sendRedirect("index.jsp");
            }
        }
        else
        {
            session.setAttribute("error","Invalid UserName Or Email");
            response.sendRedirect("index.jsp");
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>
