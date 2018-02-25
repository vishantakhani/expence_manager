<%@page import="java.util.Arrays"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Expense Report</title>
<%
	ArrayList<String> labelsArray = new ArrayList<String>();
	ArrayList<Integer> dataArray = new ArrayList<Integer>();

	HashMap<String, Integer> dataMap;
	try {
		dataMap = (HashMap<String,Integer>) request.getAttribute("map");
		if (null != dataMap) {
			for(String dataKey : dataMap.keySet()){
				labelsArray.add(dataKey);
				dataArray.add(dataMap.get(dataKey));
				System.out.println(dataMap.get(dataKey)+" "+dataKey);
			}
		}
	} catch (Exception ee) {

	}
%>

<style>
body{
bachground:white
}
button{
background:#000000c9;
color:white
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
	function chart() {

		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
			// The type of chart we want to create
			type : 'bar',
			responsive : true,
			maintainAspectRatio : false,
			scaleBeginAtZero : true,
			// The data for our dataset
			data : {
				labels : <%= Arrays.toString(labelsArray.toArray()).replace("[", "[\"").replace("]", "\"]").replace(",", "\",\"") %>,
				datasets : [ {
					label : "Expense Report",
					backgroundColor : 'rgb(25, 25, 25)',
					borderColor : 'rgb(255, 99, 132)',
					data : <%= Arrays.toString(dataArray.toArray())%>,
				} ]
			},

			// Configuration options go here
			options : {}
		});
	}
</script>
</head>
<body onload="chart()">

<table width=60% align="center">
<tr><td colspan="3"><canvas style="width: 560px !important;height: 400px !important;" id="myChart"></canvas></td></tr>
<tr><td></td><td><button onClick="location.href='index';">Go Back</button></td><td></td></td></tr>
</table></body>
</html>