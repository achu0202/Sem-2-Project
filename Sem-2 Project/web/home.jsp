<%-- 
    Document   : home
    Created on : 15-Apr-2022, 4:03:24 pm
    Author     : PC
--%>
<html>
    <head>
        <link rel="stylesheet" href="style1.css" type="text/css" >
    </head>
    <body>
        <%
            try{
                if(session.getAttribute("user_id")==null)
                {%>
                      <script>
                        window.location='login.html';
                    </script>  
                   <%
                }
                
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        
    %>
    
    

<%@include file="header.jsp"%>
<br>
<div class="slide">
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 </div>
  <img src="img/back1.jpg" style="width:100%">
</div>

<div class="mySlides fade">
  <div class="numbertext">2</div>
  <img src="img/back3.jpg" style="width:100%">
</div>
   
</div>


<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  
</div>
</div>
<script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
</body>
</html>

