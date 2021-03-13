<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.BookDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com    @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>History Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style type="text/css">
    	body{
    margin-top:20px;
    color: #ce8f3d;
    text-align: left;
    background-color: #ce8f3d;    
}
.main-body {
    padding: 15px;
}
.card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
    margin-bottom: 20px;
   
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
}

.gutters-sm {
    margin-right: -8px;
    margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
    padding-right: 8px;
    padding-left: 8px;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}

.bg-gray-300 {
    background-color: #ce8f3d;
}
.h-100 {
    height: 100%!important;
}
.shadow-none {
    box-shadow: 2px;
}

    </style>
    <style>
        .card:nth-child(even) {
        	
          background-color: #dddddd;
        }
        a{
			color:#ce8f3d; 
			}
			a:hover{
			    text-decoration: none;
			    color: rgba(0,0,0,0.7);
			    }
			
        </style>
</head>
<body><%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname1")==null){
	%>
	<script type="text/javascript">
		alert("do login before viewing history");
	</script>
	<% 
	response.sendRedirect("account.jsp?msg= ");
	
}
else{
%>

<div class="container">
    <div class="main-body">
    
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
              
              
              <li class="breadcrumb-item"><a href="Profile.jsp">Profile</a></li>
              
              <li class="breadcrumb-item active" aria-current="page">User History</li>
            </ol>
          </nav>
          <!-- /Breadcrumb -->
    
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
					
					</div>
					<div class="card mt-3 ">
                <ul class="list-group list-group-flush">
                  
                </ul>
              </div>
            </div>
            <div class="col-md-8 " ">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">History<br> </h6><hr>
                      <%
                      	String email=(String)session.getAttribute("uname1");
                      	System.out.println(email);
                      	BookDao dao=new BookDao();
                      	ResultSet res=dao.getHistory(email);
                      	if(res==null){
                      		%>
                      			<h6 class="mb-0">No Books Found!<br><hr>
                      		<%
                      	}else{
                      	while(res.next()){
                     	   String fileName=res.getString("filename");
                     	   
                      %>
                      <div class="card " style="width: 500px; margin-left: 20%">
			            <div class="row no-gutters ">
			                <div class="col-sm-5">
			                    <img class="card-img" src="uploadImages/<%= fileName %>" alt="Suresh Dasari Card" style="height: 200px">
			                </div>
			                <div class="col-sm-7">
			                    <div class="card-body">
			                        <h5 class="card-title"><% out.print(res.getString("bookname"));%></h5>
			                        <p class="card-text"><% 
			                        if(res.getString("from").equals(email)&&res.getString("isSold").equals("Yes")){
			                        	%> Sold To <% out.print(res.getString("to"));
			                        	%> at <%out.print(res.getString("price")); %>/- Rs</p>
			                        
			                        <a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=<%out.print(res.getString("to"));%>" class="btn btn-primary">Contact Buyer</a><%}
			                        else if(res.getString("from").equals(email)&&res.getString("isSold").equals("No")) {
			                        	session.setAttribute("barcode", res.getInt("barcode"));
			                        %>
			                        Not Yet Sold<br>
			                        expecting -
			       
			                        <%out.print(res.getString("price"));
			                        
			                        %></p>
			                        <a href="/BookWorn/Delete?barcode=<%out.print(res.getString("barcode")); %>"><button type="submit" class="btn btn-primary" >Delete Book</button></a>
			                        <% 
			                        }
			                        else{
			                        %>bought from <%out.print(res.getString("From"));
			                        	%> at <%out.print(res.getString("price")); %>/- Rs</p>
			                        	<a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=<%out.print(res.getString("from"));%>" class="btn btn-primary">Contact Seller</a>
			                        	 <%} %>
			                    </div>
			                </div>
			            </div>
        			</div><%} }%>
        
        
                        
                    </div>
                    
                  </div>
                 
                 
                 
                  
                 
                </div>
              </div>
         
                
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
    
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
<%if(session.getAttribute("from")!=null){
	if(session.getAttribute("from").equals("Buy"))
	%>
	<script type="text/javascript">
		alert("Book Buying Success");
	</script>
	<% 
	
	
}
} %>

</body>
</html>
