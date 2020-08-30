<%-- 
    Document   : Checkout
    Created on : Jul 13, 2020, 2:06:12 AM
    Author     : Kamran
--%>

<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <title>Checkout</title>
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
        <nav class="navbar navbar-expand-lg navbar-light bg-primary fixed-top">
            <div class="navbar-brand">
          <img src="Images/icons1.png">
        </div>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#mynav">
          <span class="navbar-toggler-icon"></span>
        </button>
            <div class="collapse navbar-collapse" id="mynav">
          <ul class="navbar-nav ml-auto mr-5">
            <li class="nav-item pr-5">
            <a href="Dashboard.jsp" class="nav-link" style="font-size:20px; margin-top:15px;">
                MANAGE SUPPLIER</a>
            </li>
            <li class="nav-item pr-5">
            <a href="ManageInventory.jsp" class="nav-link" style="font-size:20px; margin-top:15px;">
                MANAGE INVENTORY</a>
            </li>
            <li class="nav-item pr-5">
            <div class="nav-link active" style="font-size:20px; margin-top:15px;">
                CHECKOUT</div>
            </li>
            <li class="nav-item pr-5">
            <a href="Transaction.jsp" class="nav-link" style="font-size:20px; margin-top:15px;">
                TRANSACTION</a>
            </li>
            <li class="nav-item pr-5">
            <a href="GenerateReport.jsp" class="nav-link" style="font-size:20px; margin-top:15px;">
                GENERATE REPORT</a>
            </li>
            <li class="nav-item pr-5">
            <a href="Logout.jsp" class="nav-link">
                <img src="Images/icons2.png"></a>
            </li>
          </ul>
        </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
  <h1 class="display-4 text-center" style="margin-top:120px; font-variant:small-caps">Checkout</h1>
                </div>
            </div>
            <div class="row" style="margin-top:50px;">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <p class="text-center" style="font-size:40px;">Cart</p>
                    <div style="overflow:scroll; height:300px;" style="margin-top:50px;">
                        <table class="table table-bordered">
                        <thead>
     <tr><th>#</th><th>Customer Name</th><th>Product</th><th>Quantity</th><th>Measurement</th><th>Price</th>
         <th>Supplier</th><th>Delete</th></tr>
                        </thead>
                        <tbody>
                            <%
                                DBConnection db=new DBConnection();
                                try
                                {
                                    db.pstmt=db.con.prepareStatement("select * from addtocart");
                                    db.rst=db.pstmt.executeQuery();
                                    while(db.rst.next())
                                    {%>
 <tr><td><%=db.rst.getInt(1)%></td><td><%=db.rst.getString(2)%></td><td><%=db.rst.getString(3)%></td>
  <td><%=db.rst.getInt(6)%></td><td><%=db.rst.getString(4)%></td><td>₹ <%=db.rst.getString(7)%></td>
  <td><%=db.rst.getString(5)%></td>
  <td><a href="DeleteCart.jsp?id=<%=db.rst.getInt(1)%>&productname=<%=db.rst.getString(3)%>
       &finalprice=<%=db.rst.getString(7)%>&quantityrequired=<%=db.rst.getInt(6)%>" class="btn btn-danger">
          Delete</a></td></tr>    
                                    <%}
                                }
                                catch(Exception e)
                                {
                                    e.printStackTrace();
                                }
                            %>
                        </tbody>
                    </table>
                    </div>
                        <%
                            try
                            {
                     db.pstmt=db.con.prepareStatement("select sum(finalprice) from addtocart");
                     db.rst=db.pstmt.executeQuery();
                     if(db.rst.next())
                     {%>
         <p style="font-size:30px; margin-top:80px;">Total Sale : ₹ <%=db.rst.getString(1)%></p>
         <input type="hidden" id="sale" value="<%=db.rst.getString(1)%>">
                     <%}
                            }
                            catch(Exception e)
                            {
                                e.printStackTrace();
                            }
                        %>
            <p style="font-size:30px; margin-top:20px;">Tendered : ₹ <input type="text" id="tendered"></p>                           
            <p style="font-size:30px; margin-top:20px;" id="change">Change : ₹</p>                                                  
                     <a href="Sell.jsp" class="btn btn-primary btn-lg" 
     style="width:250px; margin-left:400px; margin-top:50px;">Checkout</a>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <p class="text-center" style="font-size:40px;">Product</p>
                        <table class="table table-bordered" id="myTable">
                        <thead>
     <tr><th>#</th><th>Product Name</th><th>Quantity</th><th>Measurement</th><th>Price</th><th>Supplier</th>
         <th>Add To Cart</th></tr>
                        </thead>
                        <tbody>
                            <%
                                try
                                {
                                    db.pstmt=db.con.prepareStatement("select * from manageinventory");
                                    db.rst=db.pstmt.executeQuery();
                                    while(db.rst.next())
                                    {%>
 <tr><td><%=db.rst.getInt(1)%></td><td><%=db.rst.getString(2)%></td><td><%=db.rst.getInt(3)%></td>
  <td><%=db.rst.getString(4)%></td><td>₹ <%=db.rst.getString(7)%></td><td><%=db.rst.getString(8)%></td>         
     <td><a href="AddToCart.jsp?id=<%= db.rst.getInt(1)%>"><img src="Images/icons3.png"></a>
     </td></tr>    
                                    <%}
                                }
                                catch(Exception e)
                                {
                                    e.printStackTrace();
                                }
                            %>
                        </tbody>
                    </table>                   
                </div>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script  src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
    </script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function(){
            $('#myTable').DataTable();
            $("#tendered").keyup(function(){
               var t=Number($("#tendered").val());
               var s=Number($("#sale").val());
               var r=t-s;
        $("#change").text("Change : ₹ "+r);
            });
        });
    </script>
    </body>
</html>
