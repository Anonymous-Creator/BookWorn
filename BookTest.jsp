
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell-BookWorn</title>

    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Recursive:wght@400;500;600;700&display=swap" rel="stylesheet">
   <style type="text/css">
   a:hover{
    text-decoration: none;
    color: #ffffff;
   </style>
</head>
<body>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname1")==null){
	
	response.sendRedirect("account.jsp?msg= ");
	
}
else{
	
	
%>
    <div class="header " >
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="index.jsp"><img src="assets/rohitlogo.png" width="150px">
                </div>
                <nav>
                    <ul id="menuItems"> 
                        <li><a href="index.jsp">Home</a> </li> 
                        <li><a href="surfBooks.jsp">Buy</a> </li> 
                        <li><a href="Profile.jsp">Profile</a> </li> 
                    </ul>
                </nav>
                
                <img src="assets/menu.jpg" class="menu-icon" onclick="menutoggle()"> 
            </div>
           
        </div>
    </div>
    <!-------------form-->
    <div class="container">
        <div style="text-align:center">
          
         
        </div>
        <div class="row">
          
          <div class="column">
            <form action="Book" method="Post" enctype="multipart/form-data">
             
                <div class="row"><input type="file" name="photo" placeholder="Upload" /></div>
                <input type="text" id="Bk" name="bookname" placeholder="Bookname.." required="required">
              
                <input type="text" id="fname" name="authorname" placeholder="Author name..">
              
             <!--   <input type="text" id="em" name="email" placeholder="Your Email..">-->
              
              
              <input type="text" id="Br" name="barcode" placeholder="Barcode.." required="required">
              
              <input type="text" id="yp" name="yop" placeholder="Year of Publication..">
             
              <input type="text" id="mr" name="mrp" placeholder="Mrp.." required="required">
             
              <input type="text" id="ex" name="expected" placeholder="Expected Price.." required="required">
              
              
              <label for="ve1" > Exchangeable </label><br>
              
              <input type="radio" id="yes" name="exchange" required="required" value="yes" style="width: 20%">
              <label for="yes">Yes</label>
  <br>
  <input type="radio" id="no" name="exchange" required="required" value="no" style="width: 20%">
  <label for="no" >No </label>
  <br>
  <br>
              
  <label for="ve1" required="required"> Categories </label><br>
              
              <input type="checkbox" id="v1" name="category" value="Comics & Mangas" style="width: 20%">
              <label for="v1" style="width: "> Comics & Mangas </label>
              <br>
              <input type="checkbox" id="v2" name="category" value="Business & Economics" style="width: 20%">
              <label for="v2"> Business & Economics</label>
              
              <br>
              <input type="checkbox" id="v3" name="category" value="Thriller & Mystery" style="width: 20%">
              <label for="v3"> Thriller & Mystery</label>
              
              <br>
              
              <input type="checkbox" id="v4" name="category" value="Academic & Educational" style="width: 20%">
              <label for="v3"> Academic & Educational</label>

              <br>
              <input type="checkbox" id="v5" name="category" value="Biography & Auto Biography" style="width: 20%">
              <label for="v4"> Auto-Biography & Biography</label>

              <br><br>
              <input type="submit" value="Upload">
            
                
               
                 
             
              
            </form>
          </div>
        </div>
      </div>
    
    <!----------------footer-->
    <div class="footer">

        <div class="container">

            <div class="row">

                
                </div><div class="footer-col-1">
                    <img src="assets/rohitlogo.png" width="250px">
                    
                </div>
                
                <div class="footer-col-3">
                    <h3>Follow us</h3>
                    <ul>
                        <li>Facebook</li>
                        <li>Twitter</li>
                        <li>Instagram</li>
                        <li>Linkedin</li>
                    </ul>
                </div>
            </div>
            <hr><p class="copyright">Copyright 2020 - Bookworn</p>
        </div>
    </div>
    <!----------Js for toggle-->
    <div id="menuItems"></div>
    <script> 
    var MenuItems = document.getElementById("menuItems");

    MenuItems.style.maxHeight ="0px";
    
    function menutoggle(){
        if(MenuItems.style.maxHeight === "0px")
        {
            MenuItems.style.maxHeight = "200px";
        }
        else{
            MenuItems.style.maxHeight = "0px";
        } 
    };
    </Script>              <%} %>
</body>
</html>
<style>
    * {
  box-sizing: border-box;
}

/* Style inputs */
input[type=text], select, textarea {
  width: 100%;
  padding: 20px;
  border-color: rgb(230, 168, 70);
  border-radius: 300px;
  margin-top: 6px;
  margin-bottom: 16px;
  
  resize: vertical;
}
input[type=file]{
  width: 100%;
  padding: 20px;
  
  text-align: center;
  border-color: rgb(230, 168, 70);
  border-radius: 300px;
  margin-top: 6px;
  margin-bottom: 16px;
    padding-bottom:30px;
  
  resize: vertical;
}
input[type=submit] {
  background-color: #ffffff;
  color: rgb(58, 54, 54);
  padding: 20px;
  padding-bottom:30px;
   border-color: rgb(230, 168, 70);
     border-radius: 300px;
   font-size: 20px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: rgb(230, 168, 70);
  color:#ffffff;
}
input[type=submit]:focus{
	outline: none ;
}
input[type=file]:focus{
	outline: none;
}
input[type=text]:focus{
	outline: none;
}
/* Style the container/contact section */
.container {
  border-radius: 5px;
  background-color:radial-gradient(rgb(230, 168, 70),#ce8f03d);
  padding: 10px;
}

/* Create two columns that float next to eachother */
.column {
  float: left;
  width: 50%;
  margin-top: 6px;
  padding: 20px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>