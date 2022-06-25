/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validate()
                    {
                        var pass1 = document.getElementById('pass').value;
                        var cpass1 = document.getElementById('cpass').value;
                        
                         if(pass1!=cpass1){
                            alert("password not match..");
                            return false;
                        }
                        /*var ps = /^[A-z0-9@#]{7,14}$/;
                        
                        var fnm = /^[A-z]+$/;
                        var lnm = /^[A-z]+$/;
                        var mail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                        var ph = /^\d{10}$/;*/
                        
                        var string1 = document.getElementById('capt')value;
                        var string2 = document.getElementById('textinput').value;
                        
                        document.write(string1);
                        
                        if(string1 != string2 )
                        {
                            alert("Please enter a valid captcha");
                            return false;
                        }
                        
                       /* if(fnm.test(document.registration.fname.value) == false){
                            alert("Invalid Firstname");
                            return false;
                        }

                        if(lnm.test(document.registration.lname.value)==false){
                          alert("Invalid Lastname/Surname"); 
                          return false;
                        }
                        if (mail.test(document.registration.email.value)==false) {
                          alert("Invalid E-Mail");
                          return false;
                        }

                        if (ph.test(document.registration.phone.value)==false) {
                          alert("Invalid Mobile Number");
                          return false;
                        }
                        
                       
                        if(ps.test(pass1)==false){
                            alert("Please enter atleast 7 letters...");
                            return false;
                        }*/
                        
                       
                        
                        
                    }


