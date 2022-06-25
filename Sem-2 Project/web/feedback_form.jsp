<%-- 
    Document   : feedback_form
    Created on : Jun 7, 2022, 4:54:03 PM
    Author     : Archana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--<link href="D:\MCA-2\Sem-2 Project\web\bootstrap.min.css">-->
        <!--<link href="D:\MCA\Sem-2 Project\web\font-awesome.css">-->
        <link rel="stylesheet" href="css/feedback.css">
        <link rel="stylesheet" href="css/rating-star.css">
        <script src="captcha.js"></script>
        <script src="rating-star.js"></script>
        <script>
            function fileinfo()
            {
                var filenm = document.getElementById('fileUpload1').files[0].name;
                var filenm2 = document.getElementById('fileUpload2').files[0].name;
                document.feedback.finm2.value = filenm2;
                document.feedback.finm.value = filenm;

            }

        </script>

    </head>
    <body oncopy="return false" onpaste="return false" onload="cap();">
        <%
            String user = (String) session.getAttribute("user_id");
            // out.println(user);
%>
        <div class="feedback-div">

            <div class="title"> Feedback form </div>

            <form method="post" action="feedback.jsp" name="feedback" enctype="multipart/form-data"  multiple=webkitdirectory='>   
                <div class="card-details">
                    <div class="card-box">
                        <span class="details">Feedback Title</span>
                        <select name="title" style="width:120px;
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
                                " required>
                            <%
                                Class c = Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                                Statement st = con.createStatement();

                                String sql = "select * from product";
                                ResultSet rs = st.executeQuery(sql);
                                String id = (String)session.getAttribute("user_id");   
                                //ResultSet rs=DatabaseConnection.getResultFromSqlQuery("select * from state_master ");

                            %>          

                            <option value="">--select--</option>

                            <%try {%>

                            <%while (rs.next()) {%>

                            <option value="<%out.print(rs.getString(2));%>"><%out.print(rs.getString(2));%></option>

                            <%}
                                } catch (Exception e) {
                                    out.print(e);
                                }%>

                        </select>
                        <!--<input type="text" name="title" placeholder="Feedback title" required>-->
                    </div>                  

                </div>

                <div class="card-details">
                    <div class="card-box">
                        <span class="details">Message</span>
                        <textarea cols="20" rows="2" name="Message" placeholder="Enter your feedback" style="height: 90px;
                                  width: 680px;
                                  outline: none;
                                  border-radius: 5px;
                                  border: 1px solid #ccc;
                                  padding-left: 15px;
                                  font-size: 16px;
                                  border-bottom-width: 2px;
                                  transition:all 0.3s ease;
                                  border-color: #9b59b6;
                                  " required></textarea>
                    </div>
                </div>


                <div class="card-details">                                    
                    <div class="cointainer1" >  

                        <div class="rating-wrap">
                            <span class="details">Rate your experience </span>
                            <div class="right">

                                <fieldset class="rating">
                                    <input type="radio" name="rating" id="star5" value="5">
                                    <label for="star5" class="full" title="Awesome"></label>

                                    <input type="radio" name="rating" id="star4.5" value="4.5">
                                    <label for="star4.5" class="half"></label>

                                    <input type="radio" name="rating" id="star4" value="4">
                                    <label for="star4" class="full"></label>

                                    <input type="radio" name="rating" id="star3.5" value="3.5">
                                    <label for="star3.5" class="half"></label>

                                    <input type="radio" name="rating" id="star3" value="3">
                                    <label for="star3" class="full"></label>

                                    <input type="radio" name="rating" id="star2.5" value="2.5">
                                    <label for="star2.5" class="half"></label>

                                    <input type="radio" name="rating" id="star2" value="2">
                                    <label for="star2" class="full"></label>

                                    <input type="radio" name="rating" id="star1.5" value="1.5">
                                    <label for="star1.5" class="half"></label>

                                    <input type="radio" name="rating" id="star1" value="1">
                                    <label for="star1" class="full"></label>

                                    <input type="radio" name="rating" id="star0.5" value="0.5">
                                    <label for="star0.5" class="half"></label>

                                </fieldset>
                            </div>
                        </div>
                    </div>              
                </div><br><br>

                <label for="fileUpload">Upload file</label><br>

                <br><input type="file" onchange="fileinfo()" id="fileUpload1" name="fileUpload1"> <br>
                <br><input type="file" onchange="fileinfo()" id="fileUpload2" name="fileUpload2"> <br><br>

                <input type="hidden" name="user_id" value="<%=user%>"/><br>


                <table>

                    <tr>
                        <td>Captcha</td>
                    </tr>

                    <tr>
                        <td><input type="text" id="capt" placeholder="Enter captcha"></td>

                        <td><input type="text" id="textinput" readonly="readonly" style="height: 45px;
                                   width: 100%;
                                   outline: none;
                                   border-radius: 5px;
                                   border: 1px solid #ccc;
                                   padding-left: 15px;
                                   font-size: 20px;
                                   border-bottom-width: 2px;
                                   transition:all 0.3s ease;
                                   border-color: #9b59b6;
                                   letter-spacing: 8px;
                                   font-family:cursive">
                        </td>
                        <td><img src="img/refresh2.png" style="height: 45px;
                                 border-radius: 5px;
                                 border: 1px solid #ccc;
                                 padding-left: 0px;
                                 font-size: 16px;
                                 border-bottom-width: 2px;
                                 transition:all 0.3s ease;" onclick="cap()" >
                        </td>

                    </tr>  
                    <input type="hidden" name="finm" value=""/>
                    <input name="finm2" type="hidden" value=""/>
                </table>


                <br> <input type="submit" value="submit" style="padding: 10px 0;
                            margin-top: 10px;
                            margin-right: 100px;
                            margin-left: 170px;
                            height: 70%;
                            width: 50%;
                            outline: none;

                            color:#fff;
                            border: none;
                            font-size: 18px;
                            font-weight: 500;
                            border-radius: 5px;
                            letter-spacing: 1px;
                            background:linear-gradient(135deg,#9b59b6,#02c8db);
                            text-align: center;"/>
            </form>    
        </div>





    </body>
</html>
