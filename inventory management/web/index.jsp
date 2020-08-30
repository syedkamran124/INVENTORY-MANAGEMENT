<%-- 
    Document   : Index
    Created on : Jul 11, 2020, 2:51:24 PM
    Author     : Kamran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <title>Login</title>
  </head>
  <body>
      <div class="container-fluid" style="background-image:url(Images/Login.jpg); background-size:cover;
           height:966px;">
          <div class="row">
          <div class="col-lg-3 col-md-3 col-sm-12"></div>
          <div class="col-lg-3 col-md-3 col-sm-12" style="margin-top:200px;">
              <img src="Images/Inventory.jpg" style="height:506px; width:100%;">
          </div>
          <div class="col-lg-3 col-md-3 col-sm-12" style="margin-top:200px;">
              <a href="#" class="position-absolute" id="sub" style="margin-top:350px; margin-left:385px;">
        <img src="Images/icons5.png">                  
                      </a>
              <form action="AdminLogin.jsp" method="post" class="p-4" style="background-color:lightgray;
                    height:506px;">
                  <h1 class="text-center display-3">LOGIN</h1>
                  <div class="form-group">
        <img src="Images/icons7.png" class="position-absolute" style="margin-top:25px; margin-left:345px;">           
                      <label for="username">USERNAME</label>
                      <input type="text" class="form-control" name="username" id="username">
                  </div>
                  <center><b>OR</b></center>
                  <div class="form-group">
        <img src="Images/icons4.png" class="position-absolute" style="margin-top:36px; margin-left:360px;">
                      <label for="email">E-MAIL</label>
                      <input type="email" class="form-control" name="email" id="email">
                  </div>
                  <div class="form-group">
                      <label for="password">PASSWORD</label>
                      <input type="password" class="form-control" name="password" id="password" required>
                  </div>
                  <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">SUBMIT</button>
                  </div>
                  <%
                  String error=(String)session.getAttribute("error");
                  if(error!=null)
                  {%>
                  <div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>Error! </strong><%= error%>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
    <%
        if(error!=null)
        {
            session.removeAttribute("error");
        }
    %>
      </button>
</div>
                 <% }
              %>
              </form>
          </div>
          <div class="col-lg-3 col-md-3 col-sm-12"></div>
      </div>
      </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script  src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
    </script>
    <script type="text/javascript">
      $(document).ready(function(){
        $("#sub").click(function(){
          if($("#password").attr("type")=="password")
          {
            $("#password").attr("type","text");
            $("#sub").html("<img src=Images/icons6.png>");
          }
          else
          {
            $("#password").attr("type","password");
            $("#sub").html("<img src=Images/icons5.png>");
          }
        });
      });
    </script>
  </body>
</html>
