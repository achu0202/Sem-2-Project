

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/paging.css" type="text/css" >

        <link rel="stylesheet" href="style1.css" type="text/css" >
        
        <script src="paging.js"></script>
        <style>

            #searchbar{
                width:200px;
                height: 30px;                                                     
                outline: none;
                border-radius: 15px;
                padding-left: 30px;
                font-size: 16px;
                border-bottom-width: 2px;
                transition:all 0.3s ease;
                border-color: black;                                                           
            }
            .header{
                position:absolute;
                overflow: hidden;
                top:50px;
                width:1360px;
                height:50px;
                padding: 8px 6px;
                margin-top: 60px;
                background-color:#E5E4E2;
                padding-left: 0px;
                left:0;
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
                border-color:black;                                                            
            }
            input[type=text]:hover{
                background:#F9EBEA;
                border:#F9EBEA; 
            }
            input[type=date]{
                width:150px;
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
            a{
                text-decoration: none;
                font-weight: 500;
                display: inline-block;
            }
            .button:hover{
                background:limegreen;
                border:limegreen;
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
                width: 110%;
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
                background-color: #1A5276;
                color: white;

            }

        </style>
    </head>
    <body>

        <%
            try {
                if (session.getAttribute("user_id") == null) {%>
        <script>
            window.location = 'login.html';
        </script>  
        <%
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        %>
        <%        Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
            Statement statement = connection.createStatement();
            String name = request.getParameter("search");
            String date1 = request.getParameter("date1");
            String date2 = request.getParameter("date2");

            String query = "";
            String user = (String) session.getAttribute("user_id");

        %>


        <%@include file="head.jsp"%>
        <div class="header">
            <div class="logo">
                <h3></h3>
            </div>
            <form method="post" action="user_view.jsp">
                <input id="searchbar" type="text" name="search" value="<%=name%>" placeholder="Search hear..">
                &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<label>FROM :&nbsp;&nbsp;</label>
                <input type="date" name="date1" value="<%=date1%>">
                &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<label>TO : &nbsp;&nbsp;</label>
                <input type="date" name = date2 value="<%=date2%>">


                <!--<button class="button">
                    <a href="header.jsp">Go</a>
                </button>
              
                <button class="button">
                    <a href="feedback_form.jsp">add</a>
                </button>-->
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" value="Go" class="button"/>
            </form>
        </div>

        <br>


        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-12">
                        <h2>feedback</h2>         
                    </div>
                </div>
            </div>
            <%

                if (name == null && date1 == null && date2 == null) {
                    query = "select * from feedback where user_id='" + user + "'";
                } else if (name != null && (date1 != "" && date2 != "")) {
                    //out.println("else if");
                    query = "select * from feedback where user_id='" + user + "' AND title like '%" + name + "%' AND date BETWEEN '" + date1 + "' AND '" + date2 + "'";
                } else if (name != null || (date1 != "" && date2 != "")) {
                    if (name != null) {
                        //out.println("else if->if");
                        query = "select * from feedback where user_id='" + user + "' AND title like '%" + name + "%'";
                    } else if (date1 != "" && date2 != "") {
                        //out.println("else if->else");
                        //out.println(date1);
                        query = "select * from feedback where user_id='" + user + "' AND date BETWEEN '" + date1 + "' AND '" + date2 + "'";

                    }

                    //query="select * from feedback where user_id='"+user+"' AND title like '%"+name+"%' or date BETWEEN '"+date1+"' AND '"+date2+"'";
                } else {
                    // out.println("else");
                    query = "select * from feedback where user_id='" + user + "'";
                }
                // or date BETWEEN '"+date1+"' AND '"+date2+"'
                //|| (date1!=null && date2!=null)  or date>= like '%"+date1+"%' or date<= like '%"+date2+"%' 

                ResultSet resultset = statement.executeQuery(query);
            %>
            <br>
            <center>
                <h1>Feedback</h1>
                <table class="black" id ="tbl" style="margin-left:-5%">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>userName</th>
                            <!--<th>State</th>-->
                            <th>Title</th>
                            <th>Message</th>
                            <th>rating</th>
                            <th>Date</th>
                            <th>Image 1</th>
                            <th>Image 2</th>
                        </tr>
                        <% while (resultset.next()) {%>
                        <tr>
                            <td width="10%"> <%= resultset.getString(2)%></td>
                            <td width="10%"> <%= resultset.getString(3)%></td>
                            <!--<td width="10%"> <%= resultset.getString(4)%></td>-->
                            <td width="10%"> <%= resultset.getString(5)%></td>
                            <td width="10%"> <%= resultset.getString(6)%></td>
                            <td width="10%"> <%= resultset.getString(7)%></td>
                            <td width="10%"> <%= resultset.getString(8)%></td>

                            <td><img src="images/<%= resultset.getString(9)%>" width="30%"/></td>
                            <td><img src="images/<%= resultset.getString(10)%>" width="20%"/></td>
                        </tr>
                        <% }%>
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
            </center>
        </div>



    </body>
</html>
