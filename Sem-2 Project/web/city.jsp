<%-- 
    Document   : city
    Created on : 8 Jun, 2022, 7:09:16 PM
    Author     : JUGAL
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="feedback.css"/>
         <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        
        
                           <span class="details">City</span>
                           <select style="width:200px;
                                                            height: 45px;
                                                            width: 300px;
                                                            outline: none;
                                                            border-radius: 5px;
                                                            border: 1px solid #ccc;
                                                            padding-left: 15px;
                                                            font-size: 16px;
                                                            border-bottom-width: 2px;
                                                            transition:all 0.3s ease;
                                                            border-color: #9b59b6;                                                            
                                                             " id="city" name="city" required>
                               <option value="" >select city</option>                            
                               <%

                int id = Integer.parseInt(request.getParameter("state"));
                Class c = Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            Statement st = con.createStatement();
            ResultSet rs =st.executeQuery("select * from city_master where state_id ='"+id+"'");
               // ResultSet rs =DatabaseConnection.getResultFromSqlQuery("select * from city_master where state_id='" + id + "'");
                while (rs.next()) {
            %>
            <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
            <%
                }
            %>
                               
                        </select>
                                            
                           
    </body>
</html>
