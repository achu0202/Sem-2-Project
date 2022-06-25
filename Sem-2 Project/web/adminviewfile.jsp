<%-- 
    Document   : adminviewfile
    Created on : 10 Jun, 2022, 11:57:28 AM
    Author     : riddhi
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<jsp:include page="adminheader.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Docs | Admin View Page</title>
        
    </head>
    <body>
        
        <div id="wrap">
                <form method="post">
                    <input style="margin-left:1000px; margin-top: 20px; font-size: 18px; " type="text" name="document" placeholder="Search Document..">
                    </form>

                    <%
                        try
                        {
                        
                        Class.forName("org.postgresql.Driver");
                        Connection conn=DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/emerging_db","postgres","postgres");
                        String query=request.getParameter("document");
                        String Data;
                        if(query!=null)
                        {
                            Data="select fileid,filename,description,size,created_by,created_on from document where filename like '%"+query+"%' or description like '%"+query+"%' or created_by like '%"+query+"%'";
                        }
                        else
                        {
                            
                            
                            
                            Data="select fileid,filename,description,size,created_by,created_on from document";
                        }
                        Statement stmt=conn.createStatement();
                        ResultSet rs=stmt.executeQuery(Data);
                        %><a href="explore.jsp?doc=<%=query%>"><img align='right' height="30px" width="60px" src="image/download.jpeg" alt="Download" /></a>
                    <center>
                        
                        <h1 style="margin-top: 40px;"> View Documents<a href="adminupload.jsp"><img align='right' height="30px" width="60px" src="image/add.jpg" /></a></h1>
                        <table style="margin-top: 30px; width: 80% "border=1">
                    <tr style="background: rgba(237, 145, 33, 1)">
                    <th>File Id</th>
                    <th>File Name</th>
                    <th>Description</th>
                    <th>File Size</th>
                    <th>User</th>
                    <th>Date </th>
                    <th>Download</th>
                    <th>Delete</th>
                </tr>
                <% while(rs.next()){%>
                <tr>
                    <td style="width:10%"><center><%=rs.getString(1)%></center></td>
                    <td style="width:15%"><center><%=rs.getString(2)%></td>
     
        <td style="width:10%"><center><%=rs.getString(3)%></center></td>
        <td style="width:10%"><center><%=rs.getString(4)%></center></td>
        <td style="width:10%"><center><%=rs.getString(5)%></center></td>
        <td style="width:10%"><center><%=rs.getString(6)%></center></td>
        <td style="width:10%"><center><a href="/project_emerging/file/<%=rs.getString(2)%>" target='_blank' download><img src="image/download.jpeg" height="40px" width="40px" /></center></td>
        <td style="width:10%"><center><a href="delete.jsp?id=<%=rs.getString(1)%>"><img src="image/delete.jpeg" height="50px" width="50px" onclick=""/></center></a></td>
                </tr>
                <% } 
                   }
                catch(Exception e)
{
e.printStackTrace();
}%>
            </table><br/><br/>
          
        </center>    
          
             <div class= "clear"></div>
            <div>
            <jsp:include page="footer.jsp"/>
        </div>
        </div>
        
    </body>
</html>
