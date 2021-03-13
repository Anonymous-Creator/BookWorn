<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.BookDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
    <title>View book Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
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
    box-shadow: none!important;
}
a{
color:#ce8f3d; 
}
a:hover{
    text-decoration: none;
    color: rgba(0,0,0,0.7);}
    </style>
</head>
<body>
<div class="container">
    <div class="main-body">
    
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
              <li class="breadcrumb-item"><a href="surfBooks.jsp">Buy</a></li>
              
              <li class="breadcrumb-item"><%
              boolean flag=false;
              if(session.getAttribute("uname1")!=null){ flag=true; %>
                        <a href="Profile.jsp">Profile</a> </li> 
                        <%}else{ %>
                        <a href="account.jsp?msg= ">Login/Sign up</a> </li><%} %>          
              <li class="breadcrumb-item active" aria-current="page">Book Details</li>
            </ol>
          </nav>
          <!-- /Breadcrumb -->
    		<%
    			int barcode=Integer.parseInt(request.getParameter("barcode"));
    			ResultSet res=null;
    			
    			BookDao dao=new BookDao();
    		
    			res=dao.searchBook("12@-1-2", "1234567-1",barcode);
    			if(res.next()){
    				
    			String filename=res.getString("filename");
    		%>
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="uploadImages/<%= filename %>" alt="Admin"  width="100%" height=300px>
                    <div class="mt-3">
                      <h4><%out.print(res.getString("bookname")); %></h4>
                      <p class="text-secondary mb-1"><%if(res.getString("authorname")!=null){
  													%>by <%out.print(res.getString("authorname"));}%></p>
                      
                      
                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-3">
                <ul class="list-group list-group-flush">
                  
                </ul>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                        <h6 class="mb-0"> Bookname</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%
                      out.print(res.getString("bookname"));
                      if(res.getString("authorname")!=null){
  							%>by <%out.print(res.getString("authorname"));}%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                        <h6 class="mb-0"> Barcode</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%
                      out.print(res.getInt("barcode"));
                      %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Year Of Publication</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%
                      out.print(res.getString("yop"));%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Market Price</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        <%
                      out.print(res.getString("mrp"));%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Buying Price</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%
                      out.print(res.getString("expectedprice"));%>
                    </div>
                  </div>
                  <hr>
                  <div class="row justify-content-end " style="margin-right: 10%">
                  <%if(flag){
                	  String email=(String)session.getAttribute("uname1");
                  
                  	if(email.equals(res.getString("email"))){
                  		
                	  %>
                  
                    <a href="/BookWorn/Delete?barcode=<%=barcode %>"><button class="btn btn-primary">Delete Book</button>
                    <%} else{%>
                    	<a href="/BookWorn/Buy?barcode=<%=barcode %>"><button class="btn btn-primary">Buy Now</button><%} }
                    else{session.setAttribute("from", "viewDetails");
                    session.setAttribute("barcode", barcode);
                    	%>
                    	<a href="account.jsp?msg= "><button class="btn btn-primary">Buy Now</button>
                    	<%
                    }%>
                  </div>
                  
                  
                  </div>
                </div>
              </div>
         
                
                </div>
              </div>
            </div>
          </div><% }%>
        </div>
    </div>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>