<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Income</title>
	<link rel="stylesheet" type="text/css" href="jsp/main.css">

</head>

<body>

<section class="bord">

<h1>Add Income</h1>

<form action="addIncome" method="post">

<table width=70% height=90% align="center">

	<tr>
		<td> Date: </td>
		<td colspan="2"><input type="date" name="date"  required/></td>
	</tr>

	<tr>
		<td> Category: </td>
		<td colspan="2">
			<select name="category" pkaceholder="Select Category" required >
  			   <%
  			   	HashMap<Integer,String> categoryMap = null;
  			   	categoryMap = (HashMap<Integer,String>) request.getAttribute("catinfo");
  			   	
  			   	for(Integer key : categoryMap.keySet()){
  			   		%>
  			   		<option value="<%=key%>"><%=categoryMap.get(key) %></option>
  			   		<% 
  			   	}
  			   %>
  			 </select>
  		</td>
	</tr>

    <tr>
		<td>Amount :</td>
		<td colspan="2"><input type="number" name="amount" required placeholder="Enter Amount" min=1> Rs/-</td>
	</tr>

    <tr>
		<td>Receive By :</td>
		<td colspan="2"> 
			<select name="paidby" required>
     			<option value="cash" default>Cash</option> 
     			<option value="bank">Bank</option>
     		</select>
     	</td>
	</tr>

    <tr>
		<td> Remark:</td>
		<td colspan="2">  <textarea rows="4" cols="50" name="remark" placeholder="Description"></textarea></td>
	</tr>

    <tr>
    	<td></td>
		<td colspan="2">
			<input type="submit" value="Save" name="Save">
			<input type="reset" value="Reset" name="reset">
			<input type="button" value="Go Back" name="back" onClick="location.href='index';">
		</td>
	</tr>

</table>

</form>

</section>

</body>

</html>