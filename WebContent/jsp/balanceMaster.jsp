<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>BALANCE MASTER</title>
	<link rel="stylesheet" type="text/css" href="jsp/main.css">
</head>

<body onload="hideBtn()">

<%
   if(null != request.getAttribute("cash")){
	   %>
	   <script type="text/javascript">
    document.getElementByName('cash').value='1000';
    document.getElementByName('bank').value=2000;
</script>
	   <%
   }
%>
 
 <script type="text/javascript">
 
 function changedValue() {
	 document.getElementById('btn').style.visibility="visible";
		
 }
 
 function hideBtn(){
 	 document.getElementById('btn').style.visibility="hidden";
  }
 
 </script>  

<section class="bord">

<h1> <b> Balance Master </b> </h1>

<form action="balanceMaster" method="post">

 <table>

    <tr>
          <td>Bank Balance :</td>
          <td><input type="number" min=0 name="bank" value='<%=request.getAttribute("bank") == null?"":request.getAttribute("bank")%>' oninput="changedValue()" required></td>  
    </tr>

    <tr>
          <td>Cash Balance :</td>
          <td><input type="number" min=0 name="cash" value='<%=request.getAttribute("cash") == null?"":request.getAttribute("cash")%>' oninput="changedValue()" required></td>  
    </tr>

    <tr>
           <td ></td>
           <td><input type="submit" name="change" id="btn" value="Change"><input type="button" value="Go Back" name="back" onClick="location.href='index';"></td>
    </tr>

 </table>

</form>

</section>

</body>

</html>