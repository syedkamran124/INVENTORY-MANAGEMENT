<%-- 
    Document   : ManageInventory
    Created on : Jul 13, 2020, 2:02:12 AM
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
    <title>Manage Inventory</title>
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
            <div class="nav-link active" style="font-size:20px; margin-top:15px;">
                MANAGE INVENTORY</div>
            </li>
            <li class="nav-item pr-5">
            <a href="Checkout.jsp" class="nav-link" style="font-size:20px; margin-top:15px;">
                CHECKOUT</a>
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
  <h1 class="display-4 text-center" style="margin-top:120px; font-variant:small-caps">Inventory Details</h1>
                </div>
            </div>
            <div class="row" style="margin-top:30px;">                
                    <%
                        DBConnection db=new DBConnection();
                        try
                        {
                         db.pstmt=db.con.prepareStatement("select sum(inventory) from manageinventory");
                         db.rst=db.pstmt.executeQuery();
                         if(db.rst.next())
                         {%>
                         <div class="col-lg-3 col-md-3 col-sm-12">
               <div style="height:120px; width:350px; border:2px solid red; box-shadow: 2px 2px 2px red">
                   <input type="hidden" value="<%=db.rst.getString(1)%>">
    <p class="text-center" style="color:blue; font-size:30px;">Total Inventory Value</p>
    <p class="text-center" style=" font-size:35px; color:green;">₹ <%=db.rst.getString(1)%></p>
                    </div>
                </div>    
                         <%}
                        db.pstmt=db.con.prepareStatement("select count(productname) from manageinventory");
                        db.rst=db.pstmt.executeQuery();
                        if(db.rst.next())
                        {%>
                       <div class="col-lg-3 col-md-3 col-sm-12">
                    <div style="height:120px; width:350px; border:2px solid red; box-shadow: 2px 2px 2px red">
    <p class="text-center" style="color:blue; font-size:30px;">Total Products</p>
    <p class="text-center" style=" font-size:35px; color:green;"><%=db.rst.getString(1)%></p>
                    </div>
                </div>     
                        <%}
                    }
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                %>
                <div class="col-lg-6 col-md-6 col-sm-12"></div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12" style="margin-top:70px;">
                        <table class="table table-bordered" id="myTable">
                        <thead>
     <tr><th>#</th><th>Product Name</th><th>Quantity</th><th>Measurement</th><th>Original Price</th>
         <th>Profit</th><th>Selling Price</th><th>Supplier</th><th>Edit</th><th>Delete</th></tr>
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
  <td><%=db.rst.getString(4)%></td><td>₹ <%=db.rst.getString(5)%></td><td>₹ <%=db.rst.getString(6)%></td>
<td>₹ <%=db.rst.getString(7)%></td><td><%=db.rst.getString(8)%></td>         
     <td><a href="EditProduct.jsp?id=<%= db.rst.getInt(1)%>" class="btn btn-success">Edit</a></td>
     <td><a href="DeleteProduct.jsp?id=<%= db.rst.getInt(1)%>" class="btn btn-danger">Delete</a></td></tr>    
                                    <%}
                                }
                                catch(Exception e)
                                {
                                    e.printStackTrace();
                                }
                            %>
                        </tbody>
                    </table>
                    <button type="button" class="btn btn-outline-primary btn-lg" data-toggle="modal"
                    data-target="#add" style="margin-top:30px;">Add Product</button>
                </div>
            </div>
        </div>
                        
              <div class="modal" id="add">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <div class="modal-title">Add Product</div>
              <button class="btn btn-secondary" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="AddProduct.jsp" method="post">
                <div class="form-group">
                  <label for="productname">Product Name</label>
                  <input type="text" name="productname" id="productname" class="form-control" required>
                </div>
                  <div class="form-group">
                  <label for="quantity">Quantity</label>
                  <input type="number" name="quantity" id="quantity" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="measurement">Measurement</label>
                  <select name="measurement" id="measurement" class="form-control">
                      <option value="Piece">Piece</option>
                      <option value="Kilogram">Kilogram</option>
                      <option value="Liter">Liter</option>
                  </select>
                </div>
                  <div class="form-group">
                  <label for="originalprice">Original Price (₹)</label>
                  <input type="number" name="originalprice" id="originalprice" class="form-control" required>
                </div>
                  <div class="form-group">
                  <label for="profit">Profit (₹)</label>
                  <input type="number" name="profit" id="profit" class="form-control" required>
                </div>
                  <div class="form-group">
                  <label for="sellingprice">Selling Price (₹)</label>
                  <input type="text" name="sellingprice" id="sellingprice" class="form-control" readonly>
                </div>
                    <div class="form-group">
                  <label for="supplier">Supplier</label>
    <select name="supplier" id="supplier" class="form-control">
                <%
                    try
                    {
                       db.pstmt=db.con.prepareStatement("select suppliername from managesupplier");
                       db.rst=db.pstmt.executeQuery();
                       while(db.rst.next())
                       {%>
        <option value="<%=db.rst.getString(1)%>"><%=db.rst.getString(1)%></option>
                     <%  }
                    }
                    catch(Exception e)
                    {
                       e.printStackTrace();
                    }
                %>
                </select>
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-primary btn-block" id="sub">SAVE</button>
                </div>
              </form>
              </div>
              <div class="modal-footer">
                <button class="btn btn-secondary" class="close" data-dismiss="modal">CLOSE</button>
              </div>
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
            $("#originalprice,#profit").keyup(function(){
             var op=Number($("#originalprice").val());
             var p=Number($("#profit").val());
             var r=op+p;
             $("#sellingprice").val(r);
           });
        });
    </script>
    </body>
</html>
