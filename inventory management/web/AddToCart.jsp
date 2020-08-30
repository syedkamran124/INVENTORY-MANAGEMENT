<%-- 
    Document   : AddToCart
    Created on : Jul 15, 2020, 3:01:31 PM
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
    <title>Add To Cart</title>
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
                               <form action="AddToCart2.jsp" method="post" class="border p-4 shadow">
                   <h1 class="text-center display-4" style="font-variant:small-caps;">Add To Cart</h1>
                   <div class="form-group">
                  <label for="customername">Customer Name</label>
<input type="text" name="customername" id="customername" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="productname">Product Name</label>
<input type="text" name="productname" id="productname" class="form-control" value="<%=db.rst.getString(2)%>"
       readonly>
                </div>
                  <div class="form-group">
                  <label for="quantity">Quantity Available</label>
<input type="text" id="quantity" class="form-control" value="<%=db.rst.getInt(3)%>"readonly>
                </div>
                <div class="form-group">
                  <label for="measurement">Measurement</label>
 <input type="text" name="measurement" id="measurement" class="form-control" value="<%=db.rst.getString(4)%>"
        readonly>
                </div>
                <div class="form-group">
                  <label for="sellingprice">Price (₹)</label>
<input type="text" id="sellingprice" class="form-control" value="<%=db.rst.getString(7)%>"
       readonly>
                </div>
                <div class="form-group">
                  <label for="supplier">Supplier</label>
<input type="text" name="supplier" id="supplier" class="form-control" value="<%=db.rst.getString(8)%>"readonly>
                </div>
                <div class="form-group">
                  <label for="quantityrequired">Quantity Required</label>
<input type="number" name="quantityrequired" id="quantityrequired" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="finalprice">Final Price (₹)</label>
<input type="text" name="finalprice" id="finalprice" class="form-control" readonly>
                </div>
                <div class="form-group">
    <button type="submit" class="btn btn-primary btn-block" id="sub" name="id" value="<%= id%>">
    ADD TO CART</button>
                </div>
              </form> 
                    <%}
                      }
                      catch(Exception e)
                      {
                          e.printStackTrace();
                      }
                  %>
                  <a href="Checkout.jsp" class="btn btn-outline-warning btn-lg mt-4">BACK</a>
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
           $("#quantityrequired").keyup(function(){
             var sp=Number($("#sellingprice").val());
             var qr=Number($("#quantityrequired").val());
             var r=sp*qr;
             $("#finalprice").val(r);
           });
           $("#quantityrequired").keyup(function(){
              var qr=Number($("#quantityrequired").val());
              var q=Number($("#quantity").val());
              if(qr<=q)
              {
                  $("#sub").attr("disabled",false);
              }
           });
           $("#sub").click(function(){
              var qr=Number($("#quantityrequired").val());
              var q=Number($("#quantity").val());
              if(qr>q)
              {
                  alert("Quantity Not Available, Please Enter Quantity Again");
                  $("#sub").attr("disabled",true);
              }
           });
        });
    </script>
  </body>
</html>