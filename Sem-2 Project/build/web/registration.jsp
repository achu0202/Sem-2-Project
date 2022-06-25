<%-- 
    Document   : registration
    Created on : Jun 7, 2022, 1:18:43 PM
    Author     : Archana
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
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
                       
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("Address");
            String state = request.getParameter("state");     
            String city = request.getParameter("city"); 
            String gender = request.getParameter("gender"); 
           // String Date = request.getParameter("date");
            String pass = request.getParameter("pass");
            String cpass = request.getParameter("cpass"); 
            String user_type ="user";
            //out.println(city);
            String s ="select * from state_master where state_id='"+state+"'";
            ResultSet rs = st.executeQuery(s);
            String state_name="";
            while(rs.next()){
            state_name = rs.getString("state_name");    
            }
            
//            out.print(state_name);
//            
//            String s1 ="select * from city_master where city_id='"+city+"'";
//            ResultSet rs1 = st.executeQuery(s1);
//            String city_name="";
//            while(rs1.next()){
//            city_name = rs1.getString("city_name");    
//            }
//            
            //out.print(city_name);
            StringBuffer stringBuffer = new StringBuffer();
            Date date = new Date();
            Timestamp ts = new Timestamp(date.getTime());
            
             String sql="insert into registration (firstname,lastname,email,phone,address,state,city,gender,password,confirm_password,user_type) values('"+fname+"','"+lname+"','"+email+"','"+phone+"','"+address+"','"+state_name+"','"+city+"','"+gender+"','"+pass+"','"+cpass+"','"+user_type+"')";
            
            int r = st.executeUpdate(sql);

            if(r>0)
            {
                //out.println("your feedback is successfully submited...");
               %>
                <script>
                    window.alert("registration successfully completed....");
                    window.location="login.html";
                    //return false;
                </script>

               <%
            }
            else
            {
                //out.println("not inserted...");
                 %>
                <script>
                    window.alert("not registered...");
                    window.location="registration_form.jsp";
                    //return false;
                </script>
              
               <%   
            }
            
            %>
    </body>
</html>
