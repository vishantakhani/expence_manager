<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Transfer</title>
	<link rel="stylesheet" type="text/css" href="jsp/main.css">

</head>

<script type="text/javascript">

function changedValue() {
	 
	 var from=document.getElementById('from');
	 var to=document.getElementById('to');
	 if(from.value=="cash"){
		 to.value="bank";
	 }
	 if(from.value=="bank"){
		 to.value="cash";
	 }	
}

</script>

<body>

<%
   if(null != request.getAttribute("errorMessage")){
	   %>
	<script>   alert('<%=request.getAttribute("errorMessage") == null?"":request.getAttribute("errorMessage")%>');</script>
	   <%
   }
%>

<section class="bord">

<h1>Transfer Balance</h1>

<form  action="transferMoney" method="post">
	<table width=70% height=90% align="center">

		
        <tr>
			<td>From :</td>
			<td colspan="2"> 
				<select id="from" name="from" required onchange="changedValue()">
    				 <option value="cash">Cash</option>
     				 <option value="bank">Bank</option>
   			    </select>
   			 </td>
		</tr>

        <tr>
			<td>To  :</td>
			<td colspan="2">
				<select id="to" disabled name="to">
     				<option value="bank">Bank</option>
     				<option value="cash">Cash</option> 
  				</select>
  			</td>
		</tr>

        <tr>
			<td>Amount :</td>
			<td colspan="2"> <input type="number" name="amount" required placeholder="Enter Amount" min=0 > Rs/-</td>
			<td></td>
		</tr>
        <tr>
			<td></td>
			<td colspan="2">
				<input type="submit" value="Transfer" name="Save">
				<input type="reset" value="Reset" name="reset">
				<input type="button" value="Go Back" name="back" onClick="location.href='index';">
			</td>
		</tr>
              
</table>

</form>

</section>

</body>

</html>