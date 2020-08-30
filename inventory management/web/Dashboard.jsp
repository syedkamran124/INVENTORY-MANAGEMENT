<%-- 
    Document   : Dashboard
    Created on : Jul 11, 2020, 7:44:35 PM
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <title>Manage Supplier</title>
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
            <div class="nav-link active" style="font-size:20px; margin-top:15px;">
                MANAGE SUPPLIER</div>
            </li>
            <li class="nav-item pr-5">
            <a href="ManageInventory.jsp" class="nav-link" style="font-size:20px; margin-top:15px;">
                MANAGE INVENTORY</a>
            </li>
            <li class="nav-item pr-5">
            <a href="Checkout.jsp" class="nav-link"  style="font-size:20px; margin-top:15px;">
                CHECKOUT</a>
            </li>
            <li class="nav-item pr-5">
            <a href="Transaction.jsp" class="nav-link"  style="font-size:20px; margin-top:15px;">
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
                    <h1 class="display-4 text-center" style="margin-top:120px; font-variant: small-caps;">
                        Supplier Details</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12" style="margin-top:50px;">
                        <table class="table table-bordered" id="myTable">
                        <thead>
                            <tr><th>#</th><th>Supplier Name</th><th>Contact</th><th>Address</th><th>Edit</th>
                            <th>Delete</th></tr>
                        </thead>
                        <tbody>
                            <%
                                DBConnection db=new DBConnection();
                                try
                                {
                                    db.pstmt=db.con.prepareStatement("select * from managesupplier");
                                    db.rst=db.pstmt.executeQuery();
                                    while(db.rst.next())
                                    {%>
                                       <tr><td><%= db.rst.getInt(1)%></td><td><%= db.rst.getString(2)%></td>
                                       <td><%= db.rst.getString(3)%></td><td><%= db.rst.getString(4)%></td>         
   <td><a href="#" class="btn btn-success edit">Edit</a>
     </td>
     <td><a href="DeleteSupplier.jsp?id=<%= db.rst.getInt(1)%>" class="btn btn-danger">Delete</a></td></tr>    
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
                    data-target="#add" style="margin-top:30px;">Add Supplier</button>
                </div>
            </div>
        </div>
                    
                    
        <div class="modal" id="add">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <div class="modal-title">Add Supplier</div>
              <button class="btn btn-secondary" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <form action="AddSupplier.jsp" method="post">
                <div class="form-group">
                  <label for="suppliername">Supplier Name</label>
                  <input type="text" name="suppliername" id="suppliername" class="form-control" required>
                </div>
                  <div class="form-group">
                  <label for="contact">Contact</label>
                  <input type="number" name="contact" id="contact" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="address">Address</label>
                  <input type="text" name="address" id="address" class="form-control" required>
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-primary btn-block">SAVE</button>
                </div>
              </form>
              </div>
              <div class="modal-footer">
                <button class="btn btn-secondary" class="close" data-dismiss="modal">CLOSE</button>
              </div>
          </div>
        </div>
      </div>
                        
     <div class="modal" id="edit">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <div class="modal-title">Edit Supplier</div>
              <button class="btn btn-secondary" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <form action="EditSupplier2.jsp">
                  <input type="hidden" name="id" id="id">
                <div class="form-group">
                  <label for="suppliername1">Supplier Name</label>
                  <input type="text" name="suppliername" id="suppliername1" class="form-control" required>
                </div>
                  <div class="form-group">
                  <label for="contact1">Contact</label>
                  <input type="number" name="contact" id="contact1" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="address1">Address</label>
                  <input type="text" name="address" id="address1" class="form-control" required>
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-primary btn-block">UPDATE</button>
                </div>
              </form>
              </div>
              <div class="modal-footer">
                <button class="btn btn-secondary" class="close" data-dismiss="modal">CLOSE</button>
              </div>
          </div>
        </div>
      </div>                   
                        
                        
                
    <script  src="https://code.jquery.com/jquery-3.4.1.min.js">
    </script>                    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function(){
        $(".edit").click(function(){
        $("#edit").modal("show");
        $tr=$(this).closest("tr");
        var data=$tr.children("td").map(function(){
        return $(this).text();
        }).get();
        $("#id").val(data[0]);
        $("#suppliername1").val(data[1]);
        $("#contact1").val(data[2]);
        $("#address1").val(data[3]);
        });
        });
    </script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script>
    $(document).ready( function () {
    $('#myTable').DataTable();
    });
    </script>
    </body>
</html>
