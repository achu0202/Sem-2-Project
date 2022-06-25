<%-- 
    Document   : explore
    Created on : 11 Jun, 2022, 10:13:24 AM
    Author     : riddhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.sql.*"%>
<html>
<body>
	<% 
		String filename = "d:\\csv_file.csv";
		//try
		//{
		FileWriter fw = new FileWriter(filename);
		fw.append("User Id");
		fw.append(',');
		fw.append("User Name");
		fw.append(',');
		fw.append("Title");
		fw.append(',');
		fw.append("Message");
                fw.append(',');
		fw.append("Rating");
                fw.append(',');
		fw.append("Date");
                fw.append(',');
		fw.append("Image1");
                fw.append(',');
		fw.append("Image2");
                
		fw.append('\n');

		Class c = Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            Statement st = con.createStatement();
		String query=request.getParameter("query");
                out.println(query);
                String Data;
                /*if(query.equals("null"))
                {
                    Data="select user_id,user_name,title,message,rating,date,image1,image2 from feedback";
                    
                }
                else
                {
                    Data="select user_id,user_name,title,message,rating,date,image1,image2 where filename like '%"+query+"%' or description like '%"+query+"%' or created_by like '%"+query+"%'";
                }
                
		ResultSet rs = st.executeQuery(query);
                
		while(rs.next())
		{
		fw.append(rs.getString(1));
		fw.append(',');
		fw.append(rs.getString(2));
		fw.append(',');
		fw.append(rs.getString(3));
		fw.append(',');
		fw.append(rs.getString(4));
                fw.append(',');
		fw.append(rs.getString(5));
		fw.append(',');
		fw.append(rs.getString(6));
                fw.append('\n');
		}
		fw.flush();
		fw.close();
		conn.close();
		out.println("Successfully Created Csv file.");
		} catch (Exception e) {
		e.printStackTrace();
		}*/
	%>
</table>
</body>
</html>