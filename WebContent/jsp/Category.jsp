<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Category</title>
	<link rel="stylesheet" type="text/css" href="jsp/main.css">

</head>

<body>

<%
   if(null != request.getAttribute("errorMessage")){
	   %>
	<script>   alert('<%=request.getAttribute("errorMessage") == null?"":request.getAttribute("errorMessage")%>');</script>
	   <%
   }
%>


<section class="bord">

<h1>Category</h1>

<form action="addCategory" method="post">

<table width=70% height=90% align="center">

	<tr>
		<td>Name: </td>
		<td colspan="2"><input type="text" name="name" placeholder="Category Name" required cols="40"></td>
	</tr>

	<tr>
		<td>Type: </td>
		<td><input type="radio" name="category" value="income" checked> Income</td>
		<td><input type="radio" name="category" value="expense"> Expense</td>
	</tr>

	<tr>
		<td>Remark: </td>
		<td colspan="2"><textarea rows="3" name="remark" placeholder="Description" ></textarea></td>
	</tr>

	<tr>
		<td></td>
		<td colspan="2">
			<input type="submit" value="Add" name="add">
			<input type="reset" value="Reset" name="reset">
			<input type="button" value="Go Back" name="back" onClick="location.href='index';">
		</td>
	</tr>

</table>

</form>

</section>

</body>

</html>