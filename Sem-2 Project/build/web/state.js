/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


             $(document).ready(function() {

        $("#state").on("change", function() {

            var id = $("#state").val();


            if (id === "")

            {

                $("#error").html("required");

                return false;

            }

            else

            {

                $("#error").html("");

                $.ajax({

                    url: "city.jsp",

                    data: {state: id},

                    method: "POST",

                    success: function(data)

                    {

                        $("#msg").html(data);

                    }

 

                });

            }

        });

    });

           

       



