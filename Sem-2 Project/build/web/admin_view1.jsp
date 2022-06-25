<%-- 
    Document   : admin
    Created on : Jun 11, 2022, 10:06:18 PM
    Author     : Archana
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style1.css" type="text/css" >
        
    </head>
    <style>
   
    #searchbar{
       width:200px;
            height: 30px;                                                     
            outline: none;
            border-radius: 15px;
            //border: 1px solid #ccc;
            padding-left: 30px;
            font-size: 16px;
            border-bottom-width: 2px;
            transition:all 0.3s ease;
            border-color: black;                                                                   
                                                              
                                                             
   }
   .header
{
    position:absolute;
    overflow: hidden;
    margin-top: 30px;
    top: 80px;
    width:1360px;
    height:50px;
    left:0;
    background-color:#E5E4E2;
    //margin-left:20px;
    
}
   input[type=text]{
      width:300px;
        height: 30px;
        outline: none;
        border-radius: 15px;
        border: 1px solid #ccc;
        padding-left: 15px;
        font-size: 16px;
        border-bottom-width: 2px;
        transition:all 0.3s ease;
        border-color: black;           
   }
   input[type=text]:hover{
    background:#F9EBEA;
    border:#F9EBEA; 
   }
   input[type=date]{
        width:200px;
        height: 30px;
        outline: none;
        border-radius: 5px;
        border: 1px solid #ccc;
        padding-left: 15px;
        font-size: 16px;
        border-bottom-width: 2px;
        transition:all 0.3s ease;
        border-color: black;                                             
   }
   input[type=date]:hover{
    background:#F9EBEA;
    border:#F9EBEA; 
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
   .button:hover{
       background-color: limegreen;
   }
   
    a{
        text-decoration: none;
        font-weight: 500;
        display: inline-block;
        }
    
            label{
                font-weight: 500;
            }
   
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
  width: 90%;
}
#tbl td, #tbl th {
  border: 1px solid white;
  padding: 8px;
 
}
#tbl tr:nth-child(even){background-color:#E5E4E2; }

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
<div class="header">
   
    <form methods="post" action="admin_view.jsp">
        
        <%
        
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
        Statement statement = connection.createStatement() ;
        String sql = "select * from registration";
        ResultSet rs = statement.executeQuery(sql);
        
           %>
    
     <input id="searchbar" type="text" name="search" placeholder="Search hear..">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<label>Users :</label>
                  <select id="users" name="user" style="width:200px;
                                                            height: 30px;
                                                            outline: none;
                                                            border-radius: 5px;
                                                            border: 1px solid #ccc;
                                                            padding-left: 15px;
                                                            font-size: 16px;
                                                            border-bottom-width: 2px;
                                                            transition:all 0.3s ease;
                                                            border-color: black;                                                            
                                                             ">
                                            
                      <option value="">select User</option>

                <%try{%>

                <%while(rs.next()){%>

                <option value="<%out.print(rs.getInt(1));%>"><%out.print(rs.getString(2));%></option>

                <%}}catch(Exception e){out.print(e);}%>
                  </select>
                  <label>FROM DATE :</label>
                     <input type="date" name="date1">
                 
                 <label>TO DATE:</label>
                    <input type="date" name = date2>
                  
                <button class="button" id="btn">
                    <a href="explore.jsp">Excel export</a>
                </button>
                  
   
    </form>
</div>
                  <br><br><br><br>
            <%
        String name = request.getParameter("search");
           String date1 = request.getParameter("date1");
           String date2 = request.getParameter("date2");   
           String user = request.getParameter("user");
           
        String sql1 = "select * from feedback";
        ResultSet rs1 = statement.executeQuery(sql1);
        String query="";
        
        if(name==null && date1==null && date2==null && user==null)
            {
                query="select * from feedback";
            }
            
            else if(name!=null && user!=null && (date1!="" && date2!=""))
           {
               //out.println("else if");
           query="select * from feedback where title like '%"+name+"%' AND user_id like '%"+user+"%' AND date BETWEEN '"+date1+"' AND '"+date2+"'";
           }
           else if(name!=null || user!=null || (date1!="" && date2!=""))
           {
                if( name!=null && user!=null )
               {
                   query="select * from feedback where title like '%"+name+"%' and user_id='"+user+"'";
               }
               
               
               else if(name!= null && (date1!="" && date2!="")){
               //out.println("else if->else");
               //out.println(date1);
                   query="select * from feedback where title like '%"+name+"%' AND date BETWEEN '"+date1+"' AND '"+date2+"'";

               }
                else if(name!=null){
               //out.println("else if->if");
                   query="select * from feedback where title like '%"+name+"%'";
               }
                else if(user!=null)
                {
                    query="select * from feedback where user_id='"+user+"'";
                }
               
           //query="select * from feedback where user_id='"+user+"' AND title like '%"+name+"%' or date BETWEEN '"+date1+"' AND '"+date2+"'";
           }
           
           else
           {
              // out.println("else");
               query="select * from feedback";
           }
          // or date BETWEEN '"+date1+"' AND '"+date2+"'
           //|| (date1!=null && date2!=null)  or date>= like '%"+date1+"%' or date<= like '%"+date2+"%' 
           out.println(query);
           out.println(user);
           ResultSet resultset = statement.executeQuery(query);
         %>



      
      
      <center>
          <h1>Feedback</h1>
            <table class=class="black" id ="tbl">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>userName</th>
                        <th>State</th>
		        <th>Title</th>
                        <th>Message</th>
                        <th>rating</th>
                        <th>Date</th>
                        <th>Image 1</th>
                        <th>Image 2</th>
                    </tr>
                    <% while(resultset.next()){ %>
                    <tr>
                     <td> <%= resultset.getString(2) %></td>
                     <td> <%= resultset.getString(3) %></td>
                     <td> <%= resultset.getString(4) %></td>
                     <td> <%= resultset.getString(5) %></td>
                     <td> <%= resultset.getString(6) %></td>
                     <td> <%= resultset.getString(7) %></td>
                     <td> <%= resultset.getString(8) %></td>
                     <td><img src="images/<%= resultset.getString(9) %>" width="30%"/></td>
                     <td><img src="images/<%= resultset.getString(10) %>" width="20%"/></td>
                    </tr>
                    <% } %>
                </thead>
                <tbody id="employeeTableBody">

                </tbody>
            </table>
      </center>
        
        
        
   
</body>
</html>
 
