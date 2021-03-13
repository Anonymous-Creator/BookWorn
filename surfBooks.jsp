<%@page import="jdbc.BookDto"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.BookDao"%>
<%@page import="java.sql.Blob" %>
<%@page import="java.io.ByteArrayOutputStream" %>
<%@page import="java.io.InputStream" %>
<%@page import="java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Books -BookWorn</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">   <link href="https://fonts.googleapis.com/css2?family=Recursive:wght@400;500;600;700&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
       <link rel="stylesheet" href="style.css">
 <style type="text/css">
 a:hover{
    text-decoration: none;
    color: #ffffff;
    }
 

.btn:hover {
    background: hsl(7, 100%, 57%);
    color: white;
}
.btn{
 color:black;
 width:25%;	
}
Button:focus{
 outline: none;	
 border: none;
}
#search{
width:100%;
}
.con:hover{
color: black;
}
 </style>
</head>
<body>

<div class="header ">
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="index.jsp"><img src="assets/rohitlogo.png" width="150px">
                </div>
                <nav>
                    <ul id="menuItems"> 
                    	
                        <li><a href="index.jsp">Home</a> </li> 
                        
                        <li><a href="BookTest.jsp">Sell</a>
						<li>
                        <%if(session.getAttribute("uname1")!=null){  %>
                        <a href="Profile.jsp">Profile</a> </li> 
                        <%}else{ %>
                        <a href="account.jsp?msg= ">Login/Sign up</a> </li><%} %>                     </ul>
                </nav>
                
                <img src="assets/menu.jpg" class="menu-icon" onclick="menutoggle()"> 
            </div>
            </div>
            
    </div>
    <div class="header sticky-top">
    	<section class="search-sec " >
					   <div class="container">
					        <form action="Search" method="post" novalidate="novalidate">
					            <div class="row">
					                <div class="col-lg-12">
					                    <div class="row" style="">
					                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
					                            <input type="text" class="form-control search-slt" name="search" placeholder="Enter Search">
					                        </div>
					                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
					                            <select class="form-control search-slt" name="category" >
					                            		 <option>Choose Category</option>
					                               
					<!--                               4 stars and up -->
					                                <option>
					                                  <p>Comics & Mangas</p>
					                                </option>
					<!--                               3 stars and up -->
					                                <option>
														<p>Business & Economics</p>
													 </option>
					  <!--                               2 stars and up -->
					                                <option>
														<p>Thriller & Mystery</p>
					                                </option>
					  <!--                               1 star and up -->
					                                <option>
														<p>Academic & Educational</p>
					                                </option>
					                                <option >
														<p> Auto-Biography & Biography</p>
					                                </option>
					                                
					                            </select>
					                        </div>
					                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
					                            <button type="submit" class="btn btn-danger wrn-btn">Search</button>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </form>
					   </div> 
					   <hr>
					</section>
    </div>
   <div class="container " style="width: 100% ;  padding-left: 0px;padding-right: 0px" >
   
   <%
   if(session.getAttribute("hasSearched")=="yes"){
	   ResultSet res=(ResultSet)request.getAttribute("result");
	   
	   if(res==null){
		   %>
		   <h4 style="text-align: center; color: rgba(0,0,0,0.6);"> No Book Found!</h4>
		   
		   <%
	   }
	   else{
		   while(res.next()){
			   String fileName=res.getString("filename");
			  

		   %>
		<div class="card col-lg-3 col-md-6 col-sm-12" style="margin-right:0px;">
		    <img src="uploadImages/<%= fileName %>"  alt="Denim Jeans" style="width:100%; height:250px">
		  <h1><% out.print(res.getString("bookname"));
		  %></h1>
		  <p> <%if(res.getString("authorname")!=null){
		  %>by <%out.print(res.getString("authorname"));}%></p>
		  <p class="price">at <%out.print(res.getString("expectedprice"));%>Rs/-</p>	
		  <p> Edition- <%out.print(res.getString("yop"));%><br> owner contact- <a class="con" href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=<%out.print(res.getString("email"));%>">
		  <%out.print(res.getString("email")); %></a></p>
		  <p><a target="_self" href="ViewDetails.jsp?barcode=<%out.print(res.getString("barcode"));%>"><button>View Details</button></a></p>
		</div><% }
		   
	   }
	   session.removeAttribute("hasSearched");
   }
   else{
   BookDao dao=new BookDao();
   ResultSet res=dao.retrive_book();
   while(res.next()){
	   String fileName=res.getString("filename");

   %>
<div class="card col-lg-3 col-md-6 col-sm-12" style="margin-right:0px;">
    <img src="uploadImages/<%= fileName %>"  alt="Denim Jeans" style="width:100%; height:250px">
  <h1><% out.print(res.getString("bookname"));%></h1>
  <p> <%if(res.getString("authorname")!=null){
  %>by <%out.print(res.getString("authorname"));}%></p>
  <p class="price">at <%out.print(res.getString("expectedprice"));%>Rs/-</p>
  <p> Edition- <%out.print(res.getString("yop"));%><br> owner contact- <a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=<%out.print(res.getString("email"));%>">
  <%out.print(res.getString("email")); %></a></p>
  <p><a target="_self" href="ViewDetails.jsp?barcode=<%out.print(res.getString("barcode"));%>"><button>View Details</button></a></p>
</div><% } }%>

</div>
<!----------------footer-->
    <div class="footer sticky-bottom" id="contact">

        <div class="container">

            <div class="row ">

            
                <div class="footer-col-2" >
                    <img  src="assets/rohitlogo.png" width="200px" style="margin-left: 40%">
                    
                </div>
          
            </div>
            <hr><p class="copyright">Copyright 2020 - Bookworn</p>
        </div>
    </div>
<Script> 
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
    </Script>
   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
<%
if(session.getAttribute("from")!=null) {
	if(session.getAttribute("from").equals("delete")) {
		session.removeAttribute("from");
		%>
		<script type="text/javascript">
		alert("Book Successfully Deleted!");
		</script>
		<% 
	}
	if(session.getAttribute("from").equals("sell")) {
		session.removeAttribute("from");
		%>
		<script type="text/javascript">
		alert("Book Successfully Uploaded");
		</script>
		<% 
	}
	}
%>
</body>
</html>