

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style1.css" type="text/css" >

<style>
    .header
{
    position:absolute;
    overflow: hidden;
    top:0;
    left:0;
    width:100%;
    height:80px;
    padding: 10px 6px;
    background-color:#cfe2ff;  
}
div.logo
{
    
    padding:1px,10px;
    padding-left: 80px;
    height:70px;
    float:left;
    font-size: 20px;
    font-weight: bold;
    text-transform: uppercase;
    color:black;
   
}

</style>
</head>
<body>
<div class="header">
   <div class="logo">
       <h3>Share your Feedback </h3>
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
 