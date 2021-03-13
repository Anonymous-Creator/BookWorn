<%@page import="jdbc.BookDto"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.BookDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookWorn</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link
	href="https://fonts.googleapis.com/css2?family=Recursive:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="style.css">
<style>
a:hover {
	text-decoration: none;
	color: #ffffff;
}

button {
	background-color: #ffffff;
	color: rgb(58, 54, 54);
	padding: 20px;
	padding-bottom: 30px;
	border-color: rgb(230, 168, 70);
	border-radius: 300px;
	font-size: 20px;
	cursor: pointer;
}

button:hover {
	background-color: rgb(230, 168, 70);
	color: #ffffff;
}

#detailButton:hover {
	background-color: black;
	color: #ffffff;
}

#detailButton {
	border: none;
	border-radius: 0px;
}

@
keyframes shake { 0% {
	transform: translate(1px, 1px) rotate(0deg);
}
10%
{
transform
:
 
translate
(-1px
,
-2
px
)
 
rotate
(-1deg);
 
}
20%
{
transform
:
 
translate
(-3px
,
0
px
)
 
rotate
(1deg);
 
}
30%
{
transform
:
 
translate
(3px
,
2
px
)
 
rotate
(0deg);
 
}
40%
{
transform
:
 
translate
(1px
,
-1
px
)
 
rotate
(1deg);
 
}
50%
{
transform
:
 
translate
(-1px
,
2
px
)
 
rotate
(-1deg);
 
}
60%
{
transform
:
 
translate
(-3px
,
1
px
)
 
rotate
(0deg);
 
}
70%
{
transform
:
 
translate
(3px
,
1
px
)
 
rotate
(-1deg);
 
}
80%
{
transform
:
 
translate
(-1px
,
-1
px
)
 
rotate
(1deg);
 
}
90%
{
transform
:
 
translate
(1px
,
2
px
)
 
rotate
(0deg);
 
}
100%
{
transform
:
 
translate
(1px
,
-2
px
)
 
rotate
(-1deg);
 
}
}
</style>
</head>


<body>
	<div class="header">
		<div class="container">
			<div class="navbar " style="">
				<div class="logo">
					<a href="index.html"><img src="assets/rohitlogo.png"
						width="150px">
				</div>
				<nav>
					<ul id="menuItems">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="surfBooks.jsp">Buy</a></li>
						<li><a href="BookTest.jsp">Sell</a></li>
						<li><a href="#contact">Contact</a></li>
						<li>
							<%if(session.getAttribute("uname1")!=null){  %> <a
							href="Profile.jsp">Profile</a>
						</li>
						<%}else{ %>
						<a href="account.jsp?msg= ">Login/Sign up</a>
						</li>
						<%} %>
					</ul>
				</nav>
				
				<img src="assets/menu.jpg" class="menu-icon" onclick="menutoggle()">
			</div>
			</div>
	</div>
			<div class="header">
		<div class="container">
		
			<div class="row">
				<div class="col2">
					<h1>
						WelCome To BookWorn<br>Find Pre - Owned Books Here!
					</h1>
					<p>
						When you sell a man a book you just dont sell him twelve<br>
						of paper and ink and glue - you sell him a whole new life.<br>
						Love and friendship and humours and ships at sea by night -<br>
						there's all heaven and earth in a book - a real book I mean.</p>
					<a href="surfBooks.jsp" class="btn">Explore Now</a>
				</div>

				<div class="col2">
					<img src="assets/log2-removebg-preview.png" width="400px">
				</div>
			</div>
		</div>
	</div>
	<div class="categories">
		<div class="row">
			<%
				BookDao dao = new BookDao();
				ResultSet res = dao.retrive_book();
				int i = 0;
				while (res.next() && i <= 3) {
					String fileName = res.getString("filename");
			%>
			<div class="card col-lg-4 col-md-6 col-sm-12">
				<img src="uploadImages/<%=fileName%>" alt="Denim Jeans"
					style="width: 100%; height: 250px">
				<h1>
					<%
						out.print(res.getString("bookname"));
					%>
				</h1>
				<p>
					<%
						if (res.getString("authorname") != null) {
					%>by
					<%
						out.print(res.getString("authorname"));
							}
					%>
				</p>
				<p class="price">
					at
					<%
					out.print(res.getString("expectedprice"));
				%>Rs/-
				</p>
				<p>
					Edition-
					<%
					out.print(res.getString("yop"));
				%><br> owner contact- <a
						href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=<%out.print(res.getString("email"));%>">
						<%
							out.print(res.getString("email"));
						%>
					</a>
				</p>
				
						  <p><a target="_self" href="ViewDetails.jsp?barcode=<%out.print(res.getString("barcode"));%>"><button id="detailButton">View Details</button></a></p>
				
			</div>
			<% i++; } %>




		</div>
		<a href="surfBooks.jsp">
			<button style="width: 100%">Surf All Books</button>
		</a>
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
			<hr>
			<p class="copyright">Copyright 2020 - Bookworn</p>
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
    </Script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>
</body>

</html>