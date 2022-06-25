<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.sql.*"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <!--<link href="D:\MCA-2\Sem-2 Project\web\bootstrap.min.css">-->
        <link rel="stylesheet" href="css/feedback.css"/>
        <script src="captcha.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="state.js"></script>
         <script src="validation.js"></script>
        <script type="text/javascript">

            function validate()
            {
                 var pass1 = document.getElementById('pass').value;
                var cpass1 = document.getElementById('cpass').value;
                 if(pass1!=cpass1){
                            alert("password not match..");
                            return false;
                        }
                var string1 = removeSpaces(document.getElementById('capt')value);
                var string2 = removeSpaces(document.getElementById('textinput').value);

                //document.write(string1);
                if (string1 != string2)
                {
                    alert("invalid captcha..");
                    return false;
                }

            }
            function removeSpaces(string)
            {
                return string.split(' ').join('');
            }

        </script>

    </head>
    <body  onload="cap();">
        <div class="container">

            <div class="title"> Registration form </div>

            <form  name="registration" onSubmit="return validate()" action="registration.jsp">   
                <div class="card-details">
                    <div class="card-box">
                        <span class="details">First Name</span>
                        <input type="text" name="fname" placeholder="Enter name" required pattern="^[A-Za-z]{2,50}$" title="First name must be character...And maximusm length 50 character">
                    </div>

                    <div class="card-box">
                        <span class="details">Last Name</span>
                        <input type="text" name="lname" placeholder="Enter name" required pattern="^[A-Za-z]{2,50}$" title="must be charachter">
                    </div>

                    <div class="card-box">
                        <span class="details">Email</span>
                        <input type="text" name="email" placeholder="Enter email" required pattern="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$" title="please enter proper email">
                    </div>

                    <div class="card-box">
                        <span class="details">Phone no.</span>
                        <input type="number" name="phone" placeholder="Phone no." required pattern="[0-9][10]" title="please enter valid number">
                    </div>
                </div>

                <div class="card-details">
                    <div class="card-box">
                        <span class="details">Address</span>
                        <textarea cols="20" rows="2" name="Address" placeholder="Enter address detail" style="height: 60px;
                                  width: 680px;
                                  outline: none;
                                  border-radius: 5px;
                                  border: 1px solid #ccc;
                                  padding-left: 15px;
                                  font-size: 16px;
                                  border-bottom-width: 2px;
                                  transition:all 0.3s ease;
                                  border-color: #9b59b6;
                                  " required ></textarea>
                    </div>
                </div>

                <div class="card-details">
                    <div class="card-box">
                        <span class="details">State</span>
                        <select class="selectpicker" id="state" name="state" style="width:120px;
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

                            <!--<option disabled>select state</option>-->         
                            <%
                                Class c = Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                                Statement st = con.createStatement();

                                String sql = "select * from state_master";
                                ResultSet rs = st.executeQuery(sql);
                                //ResultSet rs=DatabaseConnection.getResultFromSqlQuery("select * from state_master ");

                            %>          

                            <option value="">select state</option>

                            <%try {%>

                            <%while (rs.next()) {%>

                            <option value="<%out.print(rs.getInt(1));%>"><%out.print(rs.getString(2));%></option>

                            <%}
                                } catch (Exception e) {
                                    out.print(e);
                                }%>

                        </select>
                    </div>

                    <div class="card-box" id="msg">
                        <span class="details">City</span>
                        <select name="city" id="city" style="width:200px;
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
                            <option>select</option>
                            <!-- <option name="Gujarat">Ahmedabad</option>-->
                        </select>
                    </div>

                    <div class="circle-form">
                        <span class="details" >Gender</span>
                        <div class="category">
                            <input type="radio"  name="gender" value="Male"/>Male 
                            <input type="radio"  name="gender" value="Female"/>Female

                        </div>
                    </div>
                </div>
                <div class="card-details">
                    <div class="card-box">
                        <span class="details">Password</span>
                        <input type="password" name="pass" id="pass" placeholder="password" required pattern="^[A-z0-9@#]{7,14}$" title="must be charachter">
                    </div>

                    <div class="card-box">
                        <span class="details">Confirm Password</span>
                        <input type="Password" name="cpass" id="cpass" placeholder="confirm password" required/>
                    </div>
                </div>


                <table>

                    <tr>
                        <td>Captcha</td>
                    </tr>
                    <tr>

                        <td><input type="text" id="capt" placeholder="Enter captcha"  onpaste="return false"  required/></td>

                        <td><input type="text" id="textinput" oncopy="return false" readonly="readonly" style="height: 45px;
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
                                   font-family:cursive"></td>

                        <td><img src="img/refresh2.png" style="height: 45px;
                                 outline: none;
                                 border-radius: 5px;
                                 border: 1px solid #ccc;
                                 padding-left: 0px;
                                 font-size: 16px;
                                 border-bottom-width: 2px;
                                 transition:all 0.3s ease;" onclick="cap()" /></td>

                    </tr>                               

                </table>


                <div class="button">
                    <input type="submit" value="SUBMIT" onclick="return validate()" />
                </div>


            </form>
        </div>
    </body>
</html>
