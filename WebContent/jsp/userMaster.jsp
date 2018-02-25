<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Master</title>
	<link rel="stylesheet" type="text/css" href="jsp/main.css">

</head>

<body onload="hideBtn()">
 <script type="text/javascript">
 
 function changedValue() {
	document.getElementById('btn').style.visibility="visible";
	
}
 function hideBtn(){
	 document.getElementById('btn').style.visibility="hidden";
 }
 
</script>   

<section class="bord">

<h1>User Master</h1>

<form  action="userMaster" method="post">

 <table  width=70% height=90% align="center">
	
	 <tr>
	 	<td>Name :</td>
	 	<td><input type="text" name="user" oninput="changedValue()" value='<%=request.getAttribute("user") == null?"":request.getAttribute("user")%>'></td>  
	 </tr>
 	
 	<tr>
 		<td> Password :</td>
 		<td><input type="text" name="pass" oninput="changedValue()" value='<%=request.getAttribute("pass") == null?"":request.getAttribute("pass")%>'></td>  
 	</tr>
	
	<tr>
		<td></td>
		<td>
			<input type="submit" name="change" value="Change" id="btn" >
			<input type="button" value="Go Back" name="back" onClick="location.href='index';">
		</td>
	</tr>
 
 </table>
 
</form>

</section>

</body>

</html>