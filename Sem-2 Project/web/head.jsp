<%-- 
    Document   : head
    Created on : Jun 13, 2022, 1:00:46 PM
    Author     : Archana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body
{
       
        //background-color: honeydew;
        font-family: Times New Roman;
        margin:100px;
        padding: px;
}

button
{    
       border: 2px;  
       cursor: pointer;  
}  
h2
{
    color:white;
}
div.logo
{
    padding:1px,10px;
    padding-left: 80px;
    height:70px;
    float:left;
    font-size: 15px;
    font-weight: bold;
    text-transform: uppercase;
    color:white;
   
}

.head
{
    position:absolute;
    overflow: hidden;
    top:0;
    left:0;
    width:100%;
    height:80px;
    padding: 10px 6px;
    background-color:black;  
    //margin-left:20px;
    
}

.head  ul li a {
  margin-top: 20px;
  float: right;
  color: white;
  padding: 10px;
  text-decoration: none;
  font-size: 25px; 
  padding-right: 29px;
}
.head ul{
    list-style: none;
    float:right;
    margin:0;
    padding:0;
    display:flex;
}



.head ul li a:hover {
  background-color:#E5E4E2;
  color:black;
}



        </style>
    </head>
    <body>
        <div class="head">
   <div class="logo">
       <h2>Welcome</h2>
   </div>
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="user_view.jsp">View Feedback</a></li>
        <li><a href="feedback_form.jsp">Add Feedback</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
</div>
    </body>
</html>
