<%-- 
    Document   : view_user
    Created on : Jun 14, 2022, 11:06:50 AM
    Author     : Archana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/paging.css" type="text/css" >
        
        <script src="paging.js"></script>
        <style>
              
    #searchbar{
            width:200px;
            height: 40px;                                                     
            outline: none;
            border-radius: 15px;
            border: 1px solid #ccc;
            padding-left: 30px;
            font-size: 16px;
            border-bottom-width: 2px;
            transition:all 0.3s ease;
            border-color: #9b59b6;                                                           
   }
   .header{
    position:absolut;
    overflow: hidden;
    top:50px;
    width:1360px;
    height:50px;
    padding: 10px 6px;
    margin-top: 60px;
    background-color:#7F8C8D;
    padding-left: 0px;
    left:0;
    }

   input[type=text]{
        width:300px;
        height: 40px;
        outline: none;
        border-radius: 15px;
        border: 1px solid #ccc;
        padding-left: 15px;
        font-size: 16px;
        border-bottom-width: 2px;
        transition:all 0.3s ease;
        border-color: #9b59b6;                                                            
   }
   input[type=date]{
        width:150px;
        height: 40px;
        outline: none;
        border-radius: 5px;
        border: 1px solid #ccc;
        padding-left: 15px;
        font-size: 16px;
        border-bottom-width: 2px;
        transition:all 0.3s ease;
        border-color: #9b59b6;                                                            
   }
   .button{    
        border-radius: 10px;
        margin-left: 50px;
        height: 40px;
        width: 9%;
        font-size: 15px;
        font-weight: 500;
        letter-spacing: 1px;
        background:white;
        text-align: center;
   }
    a{
        text-decoration: none;
        font-weight: 500;
        display: inline-block;
      }
     .button:hover{
    background:limegreen;
}
input[submit]:hover{
    background:limegreen;
}
   /* When the input field gets focus,
        change its width to 100% */
   input[type=text]:focus {
     width: 20%;
   }
 
  #list{
    font-size:  1.5em;
    margin-left: 90px;
   }
   /*table*/
   .tbl{
     padding-top: 125px;
   
}
#tbl {
   
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  left:auto;
  margin-right:-10%;
}
#tbl td, #tbl th {
  border: 1px solid white;
  padding: 8px;
 
}
#tbl tr:nth-child(even){background-color:#E5E8E8; }

#tbl tr:hover {background-color: #ddd;}

#tbl th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #34495E;
  color: white;
 
}
 
        </style>

    </head>
    <body>
        <%@include file="admin_head.jsp"%>
        
        <%
           Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
           Statement statement = connection.createStatement() ;
          
           String query="select * from registration";
           ResultSet resultset = statement.executeQuery(query);
         %>
         <br>
      <center>
          <div style="overflow-x: auto; height: 500px;">
          <h1>Registered User</h1>
            <table class="black" id ="tbl">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>FirstName</th>
                        <th>LastName</th>
                        <th>Email</th>
                        <th>Phone no.</th>
                        <th>Address</th>
                        <th>State</th>
                        <th>City</th>
		        <th>Gender</th>
                        <th>Password</th>
                        <th>Confirm password</th>
                        <th>User_type</th>
                        
                    </tr>
                    <% while(resultset.next()){ %>
                    <tr>
                     <td> <%= resultset.getString(1) %></td>
                     <td> <%= resultset.getString(2) %></td>
                     <td> <%= resultset.getString(3) %></td>
                     <td> <%= resultset.getString(4) %></td>
                     <td> <%= resultset.getString(5) %></td>
                     <td> <%= resultset.getString(6) %></td>
                     <td> <%= resultset.getString(7) %></td>
                     <td> <%= resultset.getString(8) %></td>
                     <td> <%= resultset.getString(9) %></td>
                     <td> <%= resultset.getString(10) %></td>
                     <td> <%= resultset.getString(11) %></td>
                     <td> <%= resultset.getString(12) %></td>
                    </tr>
                    <% } %>
                </thead>
                <tbody id="employeeTableBody">

                </tbody>
            </table>
                <div id="pageNavPosition" style="padding-top: 20px" align="center">
</div>
<script type="text/javascript">
var pager = new Pager('tbl', 5);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);
</script>
          </div>
      </center>

    </body>
</html>
