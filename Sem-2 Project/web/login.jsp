<%-- 
    Document   : login
    Created on : Jun 5, 2022, 10:32:23 AM
    Author     : Archana
--%>


<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
        
            Class c = Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            Statement st = con.createStatement();
                       
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
                      
            String sql = "select * from registration where firstname='"+uname+"' and password='"+pass+"'";
            ResultSet rs = st.executeQuery(sql);
            //out.println(rs.getString("user_type"));
            
            if(rs.next())
            {
                if(rs.getString("user_type").equals("user"))
                {
                    session.setAttribute("user_id",rs.getString("user_id"));
                    %>
                    
                    <script>
                        window.location='home.jsp';
                    </script>  
                   
                    <%
                }
                else
                {
                    %>
                    
                    <script>
                        window.location='admin_view.jsp';
                    </script>
                    <%
                }
                //out.println("login....");
            }
            else
            {
                %>
                <script>
                    window.alert("not valid user...");
                    window.location="login.html";
                    //return true;
                    </script>
                    <%
                //out.println("not valid");
            }
        %>
    </body>
</html>
