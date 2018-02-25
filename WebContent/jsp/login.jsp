<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="jsp/main.css">

</head>

<body>

<section class="bord">

<h1>Login</h1>

<%
   if(null != request.getAttribute("errorMessage")){
	   String str=request.getParameter("errorMessage");
	   %>
	<script>   alert('<%=request.getAttribute("errorMessage") == null?"":request.getAttribute("errorMessage")%>');</script>
	   <%
   }
%>

<form action="LoginController" method="post">
<table width=70% height=90% align="center">
	<tr>
		<td>User Name:</td>
		<td><input type="text" name="uname" placeholder="Enter User Name" required></td>
	</tr>

   <tr>
		<td>Password :</td>
		<td><input type="password" name="password" placeholder="Password" required></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="login" value="Login"><input type="reset" name="reset" value="Clear"></td>
	
	</tr>
</table>

</form>

</section>

</body>

</html>