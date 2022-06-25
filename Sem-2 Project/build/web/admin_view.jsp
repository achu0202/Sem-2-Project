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
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/paging.css" type="text/css" >

        <script src="paging.js"></script>
    </head>
    <script>
        function openForm() {
            document.getElementById("myForm").style.display = "block";
        }

        function closeForm() {
            document.getElementById("myForm").style.display = "none";
        }

        function tableToCSV() {

            // Variable to store the final csv data
            var csv_data = [];

            // Get each row data
            var rows = document.getElementsByTagName('tr');
            for (var i = 0; i < rows.length; i++) {

                // Get each column data
                var cols = rows[i].querySelectorAll('td,th,img');

                // Stores each csv row data
                var csvrow = [];
                for (var j = 0; j < cols.length; j++) {

                    // Get the text data of each cell
                    // of a row and push it to csvrow
                    csvrow.push(cols[j].innerHTML);
                }

                // Combine each column value with comma
                csv_data.push(csvrow.join(","));
            }

            // Combine each row data with new line character
            csv_data = csv_data.join('\n');

            // Call this function to download csv file 
            downloadCSVFile(csv_data);

        }

        function downloadCSVFile(csv_data) {

            // Create CSV file object and feed
            // our csv_data into it
            CSVFile = new Blob([csv_data], {
                type: "text/csv"
            });

            // Create to temporary link to initiate
            // download process
            var temp_link = document.createElement('a');

            // Download csv file
            var filename = document.file.filename.value;
            temp_link.download = filename + ".csv";
            var url = window.URL.createObjectURL(CSVFile);
            temp_link.href = url;

            // This link should not be displayed
            temp_link.style.display = "none";
            document.body.appendChild(temp_link);

            // Automatically click the link to
            // trigger download
            temp_link.click();
            document.body.removeChild(temp_link);
        }
    </script>

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
            margin-top: 15px;                                                

        }
        .header
        {
            position:absolute;
            overflow: hidden;
            margin-top: 15px;
            top: 80px;
            width:1350px;
            height:80px;
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
            margin-left: 30px;
            height: 40px;
            width: 5%;
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





        .open-button:hover{
            background-color: limegreen;
            border: none;
        }

        .open-button {
            background-color:white;
            color:black;
            padding: 8px 20px;
            cursor: pointer;
            opacity: 0.8;
            position: fixed;
            width: 140px;
            height: 40px;
            border-radius: 10px;
            border: 1px solid black;
            margin-left:88%;
            margin-top:-3%;

        }

        /* The popup form - hidden by default */
        .form-popup {
            display:none;
            position:fixed;

            right: 15px;
            border: 3px solid #f1f1f1;
            z-index: 9;
        }

        /* Add styles to the form container */
        .form-container {
            max-width: 200px;
            height: 130px;
            padding: 10px;
            background-color: white;
        }

        /* Full-width input fields */
        .form-container input[type=text]{
            width: 80%;
            height: 3px;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
        }

        /* When the inputs get focus, do something */
        .form-container input[type=text]:focus, .form-container input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        /* Set a style for the submit/login button */
        .form-container .btn {
            background-color: #04AA6D;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 100px;
            margin-bottom:10px;
            opacity: 0.8;
        }

        /* Add a red background color to the cancel button */
        .form-container .cancel {
            background-color: red;
            width: 100px;

        }

        /* Add some hover effects to buttons */
        .form-container .btn:hover, .open-button:hover {
            opacity: 1;
        }







    </style>
</head>
<body>

    <%@include file="admin_head.jsp"%>
    <div class="header">

        <form methods="post" action="admin_view.jsp">

            <%

                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                Statement statement = connection.createStatement();
                String sql = "select * from registration";
                ResultSet rs = statement.executeQuery(sql);

                String name = request.getParameter("search");
                String date1 = request.getParameter("date1");
                String date2 = request.getParameter("date2");
                String user = request.getParameter("user");

            %>

            <input id="searchbar" type="text" name="search" value="<%=name%>" placeholder="Search hear..">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label>Users :</label>
            <select id="users" name="user" value="<%=user%>" style="width:200px;
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

                <%try {%>

                <%while (rs.next()) {%>

                <option value="<%out.print(rs.getInt(1));%>"><%out.print(rs.getString(2));%></option>

                <%}
                    } catch (Exception e) {
                        out.print(e);
                    }%>
            </select>
            <label>FROM DATE :</label>
            <input type="date" name="date1" value="<%=date1%>">

            <label>TO DATE:</label>
            <input type="date" name = date2 value="<%=date2%>">
            <input type="submit" value="Go" class="button"/>
        </form>

        <button class="open-button" onclick="openForm()">Excel export</button>

        <div class="form-popup" id="myForm">
            <form class="form-container" name="file">
                <label for="email"><b>File name:</b></label>
                <input type="text" placeholder="Enter Filename" name="filename" required>

                <button type="button" class="w3-btn w3-black" onclick="tableToCSV()">
                    Download 
                </button>
                <button type="button" class="w3-btn w3-teal" onclick="closeForm()">Close</button>


            </form>
        </div>



    </div>
    <br><br><br><br>
    <%

        String sql1 = "select * from feedback";
        ResultSet rs1 = statement.executeQuery(sql1);
        String query = "";

        if (name == null && date1 == null && date2 == null && user == null) {
            query = "select * from feedback";
        } else if (name != null && user != null && (date1 != "" && date2 != "")) {
            //out.println("else if");
            query = "select * from feedback where title like '%" + name + "%' AND user_id like '%" + user + "%' AND date BETWEEN '" + date1 + "' AND '" + date2 + "'";
        } else if (name != null || user != null || (date1 != "" && date2 != "")) {
            if (name != null) {
                //out.println("else if->if");
                query = "select * from feedback where title like '%" + name + "%' OR message like '%" + name + "%' OR state like '%" + name + "%'";
            }
            
            else if (name != null && user != null) {
                query = "select * from feedback where title like '%" + name + "%' and user_id='" + user + "'";
            } else if (name != null && (date1 != "" && date2 != "")) {
                //out.println("else if->else");
                //out.println(date1);
                query = "select * from feedback where title like '%" + name + "%' AND date BETWEEN '" + date1 + "' AND '" + date2 + "'";

            }  else if (user != null) {
                query = "select * from feedback where user_id='" + user + "'";
            }

            //query="select * from feedback where user_id='"+user+"' AND title like '%"+name+"%' or date BETWEEN '"+date1+"' AND '"+date2+"'";
        } else {
            // out.println("else");
            query = "select * from feedback";
        }
        // or date BETWEEN '"+date1+"' AND '"+date2+"'
        //|| (date1!=null && date2!=null)  or date>= like '%"+date1+"%' or date<= like '%"+date2+"%' 
        //out.println(query);
        //out.println(user);
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
            <% while (resultset.next()) {%>
            <tr>
                <td> <%= resultset.getString(2)%></td>
                <td> <%= resultset.getString(3)%></td>
                <td> <%= resultset.getString(4)%></td>
                <td> <%= resultset.getString(5)%></td>
                <td> <%= resultset.getString(6)%></td>
                <td> <%= resultset.getString(7)%></td>
                <td> <%= resultset.getString(8)%></td>
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




</body>
</html>

