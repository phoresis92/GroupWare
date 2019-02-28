<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        ['남자', ${map.m}],
        ['여자', ${map.f}]
      ]);

      var options = {
        title: '남녀 비율',
        is3D: true,
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
      chart.draw(data, options);
    }
});
$(document).ready(function(){
	google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {      
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Task');
      data.addColumn('number', 'Hours per Day');
      
      var length = 0;
      <c:forEach var="d" items="${rank}" varStatus="status">
	  var length = "${status.count}";
 	 </c:forEach>
 	 
    data.addRows(parseInt(length));
      <c:forEach var="r" items="${rank}" varStatus="status">
    	  data.setCell(${status.count-1}, 0, '${r.name}');
    	  data.setCell(${status.count-1}, 1, '${r.count}');
      </c:forEach>

      var options = {
        title: 'My Daily Activities',
        pieHole: 0.4,
      };

      var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
      chart.draw(data, options);
    }
});
$(document).ready(function(){
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
    	var data = new google.visualization.DataTable();
        data.addColumn('string', 'Task');
        data.addColumn('number', 'Hours per Day');
        
        var length = 0;
        <c:forEach var="d" items="${dept}" varStatus="status">
  	  var length = "${status.count}";
   	 </c:forEach>
   	 
      data.addRows(parseInt(length));
        <c:forEach var="d" items="${dept}" varStatus="status">
      	  data.setCell(${status.count-1}, 0, '${d.name}');
      	  data.setCell(${status.count-1}, 1, '${d.count}');
        </c:forEach>

      var options = {
        title: 'My Daily Activities'
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart'));

      chart.draw(data, options);
    }
});
</script>

</head>
<body>

${list}<br>
${map}<br>
${map.m}<br>
${map.f}<br>

<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
${rank}<br>
<div id="donutchart" style="width: 900px; height: 500px;"></div>
${dept}<br>
<div id="piechart" style="width: 900px; height: 500px;"></div>
</body>
</html>