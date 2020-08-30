<%-- 
    Document   : EditProduct
    Created on : Jul 14, 2020, 4:59:11 PM
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
    <title>Edit Product</title>
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
              <div class="col-lg-3 col-md-3 col-sm-12"></div>
              <div class="col-lg-6 col-md-6 col-sm-12" style="margin-top:25px;">
                  <%
                      String id=request.getParameter("id");
                      DBConnection db=new DBConnection();
                      try
                      {
                          db.pstmt=db.con.prepareStatement("select * from manageinventory where id=?");
                          db.pstmt.setString(1,id);
                          db.rst=db.pstmt.executeQuery();
                          if(db.rst.next())
                          {%>
                               <form action="EditProduct2.jsp" method="post" class="border p-4 shadow">
                   <h1 class="text-center display-4" style="font-variant:small-caps;">Edit Product</h1>      
                <div class="form-group">
                  <label for="productname">Product Name</label>
<input type="text" name="productname" id="productname" class="form-control" value="<%=db.rst.getString(2)%>"
        required>
                </div>
                  <div class="form-group">
                  <label for="quantity">Quantity</label>
<input type="number" name="quantity" id="quantity" class="form-control" value="<%=db.rst.getInt(3)%>" required>
                </div>
                <div class="form-group">
                  <label for="measurement">Measurement</label>
    <select name="measurement" id="measurement" class="form-control">
        <option value="<%=db.rst.getString(4)%>"><%=db.rst.getString(4)%></option>
        <option disabled>----------------------------------------------------------------------------------------------------------------------------------------------------</option>
        <option value="Piece">Piece</option>
        <option value="Kilogram">Kilogram</option>
        <option value="Liter">Liter</option>
    </select>
                </div>
                <div class="form-group">
                  <label for="originalprice">Original Price (₹)</label>
<input type="number" name="originalprice" id="originalprice" class="form-control" value="<%=db.rst.getString(5)%>"
        required>
                </div>
                <div class="form-group">
                  <label for="profit">Profit (₹)</label>
<input type="number" name="profit" id="profit" class="form-control" value="<%=db.rst.getString(6)%>" required>
                </div>
                <div class="form-group">
                  <label for="sellingprice">Selling Price (₹)</label>
<input type="text" name="sellingprice" id="sellingprice" class="form-control" value="<%=db.rst.getString(7)%>"
       readonly>
                </div>
                <div class="form-group">
                  <label for="supplier">Supplier</label>
                  <select name="supplier" id="supplier" class="form-control">
                      <option value="<%=db.rst.getString(8)%>"><%=db.rst.getString(8)%></option>
                      <option disabled>----------------------------------------------------------------------------------------------------------------------------------------------------</option>
                      <%
           }
         db.pstmt=db.con.prepareStatement("select suppliername from managesupplier");
         db.rst=db.pstmt.executeQuery();
         while(db.rst.next())
         {%>
              <option value="<%=db.rst.getString(1)%>"><%=db.rst.getString(1)%></option>
         <%}
       %>
                  </select>
                </div>
                <div class="form-group">
  <button type="submit" class="btn btn-primary btn-block" id="sub" name="id" value="<%= id%>">EDIT</button>
                </div>
              </form> 
                    <%}
                      catch(Exception e)
                      {
                          e.printStackTrace();
                      }
                  %>
                  <a href="ManageInventory.jsp" class="btn btn-outline-warning btn-lg mt-4">BACK</a>
              </div>
              <div class="col-lg-3 col-md-3 col-sm-12"></div>
          </div>
      </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script  src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
    </script>
    <script>
        $(document).ready(function(){
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