<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	 var param = "year=${ year }&month=${ month }";
	$.ajax({
		type:"POST",
		url:"../commuting/view",
		data:param,
		success:function(data){
			var arr = JSON.parse(data);
			console.log(arr);

			google.charts.load("current", {packages:["calendar"]});
			google.charts.setOnLoadCallback(drawChart);
			
			function drawChart() {
			 var dataTable = new google.visualization.DataTable();
			 dataTable.addColumn({ type: 'date', id: 'Date' });
			 dataTable.addColumn({ type: 'number', id: 'Won/Loss' });
			 //dataTable.addColumn({ type: 'string', role:'tooltip' });

			for(var i = 0; i < arr.length; i++){			
				
				console.log(arr[i].commuting_status);
				var num = parseInt(arr[i].commuting_status_date.substring(0,2));
				var status = 0;
				try{
					var arrive = new Date("2019-02-01 "+arr[i].commuting_arrive.slice(2));
					var leave = new Date("2019-02-01 "+arr[i].commuting_leave.slice(2));
					var ontime = new Date("2019-02-01 09:00:00");
					
					var gap1 = arrive.getTime() - ontime.getTime();
					var gap2 = leave.getTime() - arrive.getTime();
					if (gap1 > 0){
						status = Math.floor(0-gap1/1000/60/60);
					} else if (gap2 > 0){
						status = Math.floor(gap2/1000/60/60);
					}					
				}catch(Exception){}				
				
				dataTable.addRows([
				     [ new Date(${year}, ${month}-1, parseInt(arr[i].commuting_status_date.substring(0,2))), status],
				   ]);
				
			}//for end	
			
			var chart = new google.visualization.Calendar(document.getElementById('calendar_basic'));
			
			 var options = {
			   title: "근태 현황",
			   height: 350,
			 };
			 chart.draw(dataTable, options);
			}
		}
	}); // ajax end
}) // ready end
</script>
<style>
.chartbox{
	width: 100%;
	height: 500px;
	overflow: hidden;
	margin:0 auto;
}
</style>

</head>
<body>
<br>	
<div id="calendar_basic" class="chartbox"></div>
<br>
</body>
</html>