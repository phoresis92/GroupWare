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
        title: '성별 비율',
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
        title: '직급별 비율',
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
        title: '부서별 비율'
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart'));

      chart.draw(data, options);
    }
});
</script>

</head>
<body>


  <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
              							<h2>회원 통계</h2>

          </div>

          <!-- Content Row -->
          <div class="row">

          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- 차트헤더 -->
            <div class="col-xl-6 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">성별 비율</h6>
                  
                </div>
                <!-- 차트바디 -->
                <div class="card-body">
                  
                    <div id="piechart_3d" style="width: 600px; height: 400px;"></div>

                  
                  
                </div>
              </div>
            </div>
            
              <!-- 차트헤더 -->
            <div class="col-xl-6 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">직급별 사원 비율</h6>
                  
                </div>
                <!-- 차트바디 -->
                <div class="card-body">
                  
                  
			 <div id="donutchart" style="width: 600px; height: 400px;"></div>

                  
                  
                </div>
              </div>
            </div>
            
             <!-- 차트헤더 -->
            <div class="col-xl-6 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">부서별 사원 비율</h6>
                  
                </div>
                <!-- 차트바디 -->
                <div class="card-body">
                  
                  
			<div id="piechart" style="width: 600px; height: 400px;"></div>

                  
                  
                </div>
              </div>
            </div>

         
          </div>

        </div>
        <!-- /.container-fluid -->

</body>
</html>