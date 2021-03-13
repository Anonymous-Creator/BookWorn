<!Doctype html>
<html lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>

    <title>Sign in-BookWorn </title>

    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Recursive:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style type="text/css">
    a:hover{
    text-decoration: none;
    color: #ffffff;
    }
    </style>
    <script defer src="script.js" type="text/javascript"></script>
</head>


<body>
<%
if(session.getAttribute("haveLogin")!=null){
 if(session.getAttribute("isUser")=="no"){
	 %>
	 <script>
	 alert("Wrong User Credentials");
	 </script>
	 <% 
 }
 session.removeAttribute("isUser");
 }
%>
    <div class="header">
        <div class="container">
            <div class="navbar">
                <div class="logo">
                   <a href="index.jsp"> <img src="assets/rohitlogo.png" width="150px"></a>
                </div>
                <nav>
                    <ul id="menuItems">
                        <li><a href="index.jsp">Home</a> </li> 
                         
                        <li><a href="account.jsp?msg= ">Login/Sign up</a> </li>
                        

                    </ul>
                </nav>
                
                <img src="assets/menu.jpg" class="menu-icon" 
                onclick="menutoggle()"> 
            </div>
           
    </div>
    <!----------------Account------->
    <div class="account-page">
        <div class="container">

            <div class="row">

                <div class="col2">
                    <img src="assets/rohitlogo.png"  width="500px">
                    
                  
                </div>
                <div class="col2">
                    <div class="form-container">
                        <div class="form-btn">
                            <span onclick="login()">Login</span>
                            <span onclick="register()">Register</span>
                            <hr id="Indicator">
                        </div>
                        <form id="LoginForm" action="Login" method="Post">
                            <input type="text" placeholder="Email" name="username" required="required"> 
                            <input type="Password" placeholder="Password" name="password" required="required"> 
                            <button type="submit" class="btn">Login</button>
                            <a href="">Forgot Password</a>
                        </form>

                        <form id="RegForm" action="Registration" method="Post">
                            <input type="text" placeholder="Username" name="username" required="required"> 
                            <input type="Email" placeholder="Email" name="email" required="required"> 
                            <input type="Firstname" placeholder="Firstname" name="firstname" required="required"> 
                            <input type="Lastname" placeholder="lastname" name="lastname" required="required" > 
                            <input type="mobile" placeholder="Mobile no" name="mobileno" required="required"> 
                            <input type="Password" placeholder="Password" name="password" required="required">
                            <button type="submit" class="btn">Register</button>
                           
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    <!----------------footer-->
    <div class="footer" id="contact">

        <div class="container">

            <div class="row">

            
                <div class="footer-col-2">
                    <img src="assets/rohitlogo.png" width="250px">
                   <!---- <p>Our Purpose Is To Sustainably Make the pleasure and benefits of Books lover</p>-->
                </div>
            
                <div class="footer-col-4">
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
        if(MenuItems.style.maxHeight == "0px")
        {
            MenuItems.style.maxHeight = "200px";
        }
        else{
            MenuItems.style.maxHeight = "0px";
        } 
    };
    </Script>
    <!---------Js toggle form-->
    <script>

        var LoginForm = document.getElementById("LoginForm");
        var RegForm = document.getElementById("RegForm");
        var Indicator = document.getElementById("Indicator");

            function register(){
              RegForm.style.transform ="translateX(0px)";
              LoginForm.style.transform ="translateX(0px)";
              Indicator.style.transform ="translateX(100px)";
            }
            function login(){
              RegForm.style.transform ="translateX(300px)";
              LoginForm.style.transform ="translateX(300px)";
              Indicator.style.transform ="translateX(0px)";
            }
            
    </script>
    <%
    if(request.getParameter("msg").equals("registered")){
                    	%>
                    	    <script >
   					alert("Registration Successfull");
    	
    						</script>
                    	
                    	<% } 
                    	
                    	
                    	%>
</body>

</html>
