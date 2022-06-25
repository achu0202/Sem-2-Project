<%-- 
    Document   : feedback_insert
    Created on : Jun 5, 2022, 4:11:20 PM
    Author     : Archana
--%>


<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import=" java.io.*, java.util.*,javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%--<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>--%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement.*"%>
<%@page language="java" contentType="text/html; charset=iso-8859-1" pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            try {

                String filepath = "D:\\MCA\\Sem-2 Project\\web\\images\\";
                MultipartRequest m = new MultipartRequest(request, filepath, (500000 * 1024));

                String id = (String) session.getAttribute("user_id");
                //out.println(id);
                //String sql="select * from registration where user_id='"+id+"'";

                String title = m.getParameter("title");
                String image1 = m.getParameter("finm");
                //Part file1 = request.getPart("fileUpload1");
                String image2 = m.getParameter("finm2");
                String rating = m.getParameter("rating");
                String message = m.getParameter("Message");
                //out.println(title);
                Class c = Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                Statement st = con.createStatement();
                String sql2 = "select * from feedback where user_id='" + id + "'";
                ResultSet rs1 = st.executeQuery(sql2);
                int r1 = 0;
                String s = "";
                while (rs1.next()) {
                    s = rs1.getString(5);
                    if (s.equals(title)) {
                        r1 = 1;
                    }
                }
                if (r1 == 1) {
        %>
        <script>
            alert("you can not send feedback to this title......already your feedback send to this title...");
            window.location = "feedback_form.jsp";
        </script>

        <%
        } else {

            String sql1 = "select * from registration where user_id='" + id + "'";

            ResultSet rs = st.executeQuery(sql1);
            String unm = "";
            String state = "";
            if (rs.next()) {
                unm = rs.getString("firstname");
                state = rs.getString("state");
            }

            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = df.format(new Date());

            String sql3 = "insert into feedback(user_id,user_name,state,title,message,rating,date,image1,image2) values('" + id + "','" + unm + "','" + state + "','" + title + "','" + message + "','" + rating + "','" + formattedDate + "','" + image1 + "','" + image2 + "')";
            int r = st.executeUpdate(sql3);

            if (r > 0) {
        %>
        <jsp:forward page="email_alert.jsp"/>
        <%
                        //out.println("your feedback is successfully submited...");
                    } else {
                        %>
        <script>
            alert("your feedback not send..something went wrong....");
            window.location = "feedback_form.jsp";
        </script>

        <%

                    }

                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        %>
    </body>
</html>
