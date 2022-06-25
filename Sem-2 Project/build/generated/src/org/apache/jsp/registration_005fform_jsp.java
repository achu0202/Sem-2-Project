package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class registration_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>TODO supply a title</title>\n");
      out.write("        <meta charset=\"UTF-8\"/>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n");
      out.write("        <!--<link href=\"D:\\MCA-2\\Sem-2 Project\\web\\bootstrap.min.css\">-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/feedback.css\"/>\n");
      out.write("        <script src=\"captcha.js\"></script>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"state.js\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("            function validate()\n");
      out.write("            {\n");
      out.write("                 var pass1 = document.getElementById('pass').value;\n");
      out.write("                var cpass1 = document.getElementById('cpass').value;\n");
      out.write("\n");
      out.write("                var string1 = removeSpaces(document.getElementById('capt')value);\n");
      out.write("                var string2 = removeSpaces(document.getElementById('textinput').value);\n");
      out.write("\n");
      out.write("                //document.write(string1);\n");
      out.write("                if (string1 != string2)\n");
      out.write("                {\n");
      out.write("                    alert(\"invalid captcha..\");\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            function removeSpaces(string)\n");
      out.write("            {\n");
      out.write("                return string.split(' ').join('');\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body oncopy=\"return false\" onpaste=\"return false\" onload=\"cap();\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("\n");
      out.write("            <div class=\"title\"> Registration form </div>\n");
      out.write("\n");
      out.write("            <form  name=\"registration\" onSubmit=\"return validate();\" action=\"registration.jsp\">   \n");
      out.write("                <div class=\"card-details\">\n");
      out.write("                    <div class=\"card-box\">\n");
      out.write("                        <span class=\"details\">First Name</span>\n");
      out.write("                        <input type=\"text\" name=\"fname\" placeholder=\"Enter name\" required pattern=\"^[A-Za-z]{2,50}$\" title=\"First name must be character...And maximusm length 50 character\">\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"card-box\">\n");
      out.write("                        <span class=\"details\">Last Name</span>\n");
      out.write("                        <input type=\"text\" name=\"lname\" placeholder=\"Enter name\" required pattern=\"^[A-Za-z]{2,50}$\" title=\"must be charachter\">\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"card-box\">\n");
      out.write("                        <span class=\"details\">Email</span>\n");
      out.write("                        <input type=\"text\" name=\"email\" placeholder=\"Enter email\" required pattern=\"^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$\" title=\"please enter proper email\">\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"card-box\">\n");
      out.write("                        <span class=\"details\">Phone no.</span>\n");
      out.write("                        <input type=\"number\" name=\"phone\" placeholder=\"Phone no.\" required pattern=\"[0-9][10]\" title=\"please enter valid number\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"card-details\">\n");
      out.write("                    <div class=\"card-box\">\n");
      out.write("                        <span class=\"details\">Address</span>\n");
      out.write("                        <textarea cols=\"20\" rows=\"2\" name=\"Address\" placeholder=\"Enter address detail\" style=\"height: 60px;\n");
      out.write("                                  width: 680px;\n");
      out.write("                                  outline: none;\n");
      out.write("                                  border-radius: 5px;\n");
      out.write("                                  border: 1px solid #ccc;\n");
      out.write("                                  padding-left: 15px;\n");
      out.write("                                  font-size: 16px;\n");
      out.write("                                  border-bottom-width: 2px;\n");
      out.write("                                  transition:all 0.3s ease;\n");
      out.write("                                  border-color: #9b59b6;\n");
      out.write("                                  \" required ></textarea>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"card-details\">\n");
      out.write("                    <div class=\"card-box\">\n");
      out.write("                        <span class=\"details\">State</span>\n");
      out.write("                        <select class=\"selectpicker\" id=\"state\" name=\"state\" style=\"width:120px;\n");
      out.write("                                height: 45px;\n");
      out.write("                                width: 300px;\n");
      out.write("                                outline: none;\n");
      out.write("                                border-radius: 5px;\n");
      out.write("                                border: 1px solid #ccc;\n");
      out.write("                                padding-left: 15px;\n");
      out.write("                                font-size: 16px;\n");
      out.write("                                border-bottom-width: 2px;\n");
      out.write("                                transition:all 0.3s ease;\n");
      out.write("                                border-color: #9b59b6;                                                            \n");
      out.write("                                \" required>\n");
      out.write("\n");
      out.write("                            <!--<option disabled>select state</option>-->         \n");
      out.write("                            ");

                                Class c = Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                                Statement st = con.createStatement();

                                String sql = "select * from state_master";
                                ResultSet rs = st.executeQuery(sql);
                                //ResultSet rs=DatabaseConnection.getResultFromSqlQuery("select * from state_master ");

                            
      out.write("          \n");
      out.write("\n");
      out.write("                            <option value=\"\">select state</option>\n");
      out.write("\n");
      out.write("                            ");
try {
      out.write("\n");
      out.write("\n");
      out.write("                            ");
while (rs.next()) {
      out.write("\n");
      out.write("\n");
      out.write("                            <option value=\"");
out.print(rs.getInt(1));
      out.write('"');
      out.write('>');
out.print(rs.getString(2));
      out.write("</option>\n");
      out.write("\n");
      out.write("                            ");
}
                                } catch (Exception e) {
                                    out.print(e);
                                }
      out.write("\n");
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"card-box\" id=\"msg\">\n");
      out.write("                        <span class=\"details\">City</span>\n");
      out.write("                        <select name=\"city\" id=\"city\" style=\"width:200px;\n");
      out.write("                                height: 45px;\n");
      out.write("                                width: 300px;\n");
      out.write("                                outline: none;\n");
      out.write("                                border-radius: 5px;\n");
      out.write("                                border: 1px solid #ccc;\n");
      out.write("                                padding-left: 15px;\n");
      out.write("                                font-size: 16px;\n");
      out.write("                                border-bottom-width: 2px;\n");
      out.write("                                transition:all 0.3s ease;\n");
      out.write("                                border-color: #9b59b6;                                                            \n");
      out.write("                                \" required>\n");
      out.write("                            <option>select</option>\n");
      out.write("                            <!-- <option name=\"Gujarat\">Ahmedabad</option>-->\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"circle-form\">\n");
      out.write("                        <span class=\"details\" >Gender</span>\n");
      out.write("                        <div class=\"category\">\n");
      out.write("                            <input type=\"radio\"  name=\"gender\" value=\"Male\"/>Male \n");
      out.write("                            <input type=\"radio\"  name=\"gender\" value=\"Female\"/>Female\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card-details\">\n");
      out.write("                    <div class=\"card-box\">\n");
      out.write("                        <span class=\"details\">Password</span>\n");
      out.write("                        <input type=\"password\" name=\"pass\" id=\"pass\" placeholder=\"password\" required pattern=\"^[A-z0-9@#]{7,14}$\" title=\"must be charachter\">\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"card-box\">\n");
      out.write("                        <span class=\"details\">Confirm Password</span>\n");
      out.write("                        <input type=\"Password\" name=\"cpass\" id=\"cpass\" placeholder=\"confirm password\" required/>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <table>\n");
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Captcha</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("\n");
      out.write("                        <td><input type=\"text\" id=\"capt\" placeholder=\"Enter captcha\"  required/></td>\n");
      out.write("\n");
      out.write("                        <td><input type=\"text\" id=\"textinput\" readonly=\"readonly\" style=\"height: 45px;\n");
      out.write("                                   width: 100%;\n");
      out.write("                                   outline: none;\n");
      out.write("                                   border-radius: 5px;\n");
      out.write("                                   border: 1px solid #ccc;\n");
      out.write("                                   padding-left: 15px;\n");
      out.write("                                   font-size: 20px;\n");
      out.write("                                   border-bottom-width: 2px;\n");
      out.write("                                   transition:all 0.3s ease;\n");
      out.write("                                   border-color: #9b59b6;\n");
      out.write("                                   letter-spacing: 8px;\n");
      out.write("                                   font-family:cursive\"></td>\n");
      out.write("\n");
      out.write("                        <td><img src=\"img/refresh2.png\" style=\"height: 45px;\n");
      out.write("                                 outline: none;\n");
      out.write("                                 border-radius: 5px;\n");
      out.write("                                 border: 1px solid #ccc;\n");
      out.write("                                 padding-left: 0px;\n");
      out.write("                                 font-size: 16px;\n");
      out.write("                                 border-bottom-width: 2px;\n");
      out.write("                                 transition:all 0.3s ease;\" onclick=\"cap()\" /></td>\n");
      out.write("\n");
      out.write("                    </tr>                               \n");
      out.write("\n");
      out.write("                </table>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"button\">\n");
      out.write("                    <input type=\"submit\" value=\"SUBMIT\" onclick=\"validate();\"/>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
