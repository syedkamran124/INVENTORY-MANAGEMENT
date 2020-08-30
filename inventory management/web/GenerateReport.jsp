<%-- 
    Document   : GenerateReport
    Created on : Jul 13, 2020, 2:06:38 AM
    Author     : Kamran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <title>Generate Report</title>
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
            <a href="Checkout.jsp" class="nav-link" style="font-size:20px; margin-top:15px;">
                CHECKOUT</a>
            </li>
            <li class="nav-item pr-5">
            <a href="Transaction.jsp" class="nav-link" style="font-size:20px; margin-top:15px;">
                TRANSACTION</a>
            </li>
            <li class="nav-item pr-5">
            <div class="nav-link active" style="font-size:20px; margin-top:15px;">
                GENERATE REPORT</div>
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
  <h1 class="display-4 text-center" style="margin-top:120px; font-variant:small-caps">Report</h1>
                </div>
                <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
 <a href="#" class="btn btn-primary btn-lg" onclick="window.open('InventoryReport.jsp','_blank',
'width=1100,height=920,top=40,left=400')" style="width:250px; margin-left:720px; margin-top:50px;">
     Inventory Report</a>
 <a href="#" class="btn btn-primary btn-lg" onclick="window.open('TransactionReport.jsp','_blank',
'width=1100,height=700,top=150,left=400')" style="width:250px; margin-left:50px; margin-top:50px;">
     Transaction Report</a>
                </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
