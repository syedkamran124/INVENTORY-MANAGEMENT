<%-- 
    Document   : InventoryReport
    Created on : Jul 16, 2020, 7:58:15 PM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <title>Inventory Report</title>
  </head>
  <body>
      <%
            String username=(String)session.getAttribute("username");
            String email=(String)session.getAttribute("email");
            if(username==null || email==null)
            {
                session.setAttribute("error","Please Login First");
                response.sendRedirect("index.jsp");
            }
        %>
      <div class="container-fluid">
          <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12" style="margin-top:20px;">
                  <img src="Images/icons1.png">
                  <p class="" style="font-size:40px; margin-top:40px;">Inventory Report</p>
                  <table class="table table-bordered">
                        <thead>
     <tr><th>#</th><th>Product Name</th><th>Quantity</th><th>Measurement</th><th>Original Price</th>
         <th>Profit</th><th>Selling Price</th><th>Supplier</th></tr>
                        </thead>
                        <tbody>
                            <%
                                DBConnection db=new DBConnection();
                                try
                                {
                                    db.pstmt=db.con.prepareStatement("select * from manageinventory");
                                    db.rst=db.pstmt.executeQuery();
                                    while(db.rst.next())
                                    {%>
 <tr><td><%=db.rst.getInt(1)%></td><td><%=db.rst.getString(2)%></td><td><%=db.rst.getInt(3)%></td>
  <td><%=db.rst.getString(4)%></td><td>₹ <%=db.rst.getString(5)%></td><td>₹ <%=db.rst.getString(6)%></td>
<td>₹ <%=db.rst.getString(7)%></td><td><%=db.rst.getString(8)%></td></tr>    
                                    <%}
                                }
                                catch(Exception e)
                                {
                                    e.printStackTrace();
                                }
                            %>
                        </tbody>
                    </table>
   <button class="btn btn-primary btn-lg" style="width:250px; margin-top:10px;" onclick="window.print()">
     Generate Report</button>
              </div>
          </div>
      </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
