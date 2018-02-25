<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="jsp/main.css">

</head>

<body >

<%
   if(null != request.getAttribute("errorMessage")){
	   %>
	<script>   alert('<%=request.getAttribute("errorMessage") == null?"":request.getAttribute("errorMessage")%>');</script>
	   <%
   }
%>
<div class="dropdown">

  <button class="dropbtn">Add</button>

  <div class="dropdown-content">

    <a href="addCategory">Category</a>

  </div>

</div>

<div class="dropdown">

  <button class="dropbtn">Transaction</button>

  <div class="dropdown-content">

	<a href="addIncome">Income</a>
  	<a href="addExpense">Expense</a>
  	<a href="transferMoney">Transfer</a>

  </div>

</div>

<div class="dropdown">

  <button class="dropbtn">Master</button>

  <div class="dropdown-content">
	
	  <a href="userMaster">User Master</a>
 	  <a href="balanceMaster">Balance Master</a>
  
  </div>

</div>

<div class="dropdown">

  <button class="dropbtn">Report</button>

  <div class="dropdown-content">
	
	  <a href="incomeReport">Income</a> 
  	  <a href="expenseReport">Expense</a>
  
  </div>

</div>

<div class="dropdown">

  <button class="dropbtn" onclick="location.href='Login';">Logout</button>

</div>

</body>

</html>