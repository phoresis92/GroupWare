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
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>

<script type="text/javascript">
var pay2 = 0, pay3 = 0, pay4 = 0, pay5 = 0, pay6 = 0;
var type = new Array("교통비", "사무비품", "출장비", "식대", "주유비");	
$(document).ready(function(){
    <c:forEach var="pay" items="${title_2}">
    	pay2 += ${pay.pay_cash};	    		    
    </c:forEach>    
    <c:forEach var="pay" items="${title_3}">
    	pay3 += ${pay.pay_cash};	    		    
    </c:forEach>    
    <c:forEach var="pay" items="${title_4}">
    	pay4 += ${pay.pay_cash};	    		    
    </c:forEach>    
    <c:forEach var="pay" items="${title_5}">
    	pay5 += ${pay.pay_cash};	    		    
    </c:forEach>
    <c:forEach var="pay" items="${title_6}">
    	pay6 += ${pay.pay_cash};	    		    
	</c:forEach>
});
$(document).ready(function(){
	google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
	      
    	var data = google.visualization.arrayToDataTable([
            ["항목", "지출", { role: "style" } ],
            [type[0], pay2, "red"],
            [type[1], pay3, "primary"],
            [type[2], pay4, "green"],
            [type[3], pay5, "purple"],
            [type[4], pay6, "orange"]
          ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "항목별  총지출, 원",
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
});
$(document).ready(function(){
	google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
    	var pay2_2019 = 0, pay3_2019 = 0, pay4_2019 = 0, pay5_2019 = 0, pay6_2019 = 0;
    	var pay2_2018 = 0, pay3_2018 = 0, pay4_2018 = 0, pay5_2018 = 0, pay6_2018 = 0;
    	var pay2_2017 = 0, pay3_2017 = 0, pay4_2017 = 0, pay5_2017 = 0, pay6_2017 = 0;
    	<c:forEach var="pay" items="${title_2}">
    		var date = "${pay.pay_date}";
    		var yy = date.slice(24,28);
    		if (yy == '2019'){
    			pay2_2019 += ${pay.pay_cash};
    		} else if (yy == '2018'){
    			pay2_2018 += ${pay.pay_cash};
    		} else if (yy == '2017'){
    			pay2_2017 += ${pay.pay_cash};
    		}   			    		    
	    </c:forEach>    
	    <c:forEach var="pay" items="${title_3}">
	    var date = "${pay.pay_date}";
		var yy = date.slice(24,28);
		    if (yy == '2019'){
		    	pay3_2019 += ${pay.pay_cash};
			} else if (yy == '2018'){
	    		pay3_2018 += ${pay.pay_cash};
	    	} else if (yy == '2017'){
	    		pay3_2017 += ${pay.pay_cash};
	    	}  
	    </c:forEach>    
	    <c:forEach var="pay" items="${title_4}">
	    var date = "${pay.pay_date}";
		var yy = date.slice(24,28);
		    if (yy == '2019'){
		    	pay4_2019 += ${pay.pay_cash};
			} else if (yy == '2018'){
	    		pay4_2018 += ${pay.pay_cash};
	    	} else if (yy == '2017'){
	    		pay4_2017 += ${pay.pay_cash};
	    	}    
	    </c:forEach>    
	    <c:forEach var="pay" items="${title_5}">
	    var date = "${pay.pay_date}";
		var yy = date.slice(24,28);
		    if (yy == '2019'){
		    	pay5_2019 += ${pay.pay_cash};
			} else if (yy == '2018'){
	    		pay5_2018 += ${pay.pay_cash};
	    	} else if (yy == '2017'){
	    		pay5_2017 += ${pay.pay_cash};
	    	}    
	    </c:forEach>
	    <c:forEach var="pay" items="${title_6}">
	    var date = "${pay.pay_date}";
		var yy = date.slice(24,28);
		    if (yy == '2019'){
		    	pay6_2019 += ${pay.pay_cash};
			} else if (yy == '2018'){
	    		pay6_2018 += ${pay.pay_cash};
	    	} else if (yy == '2017'){
	    		pay6_2017 += ${pay.pay_cash};
	    	}    
	    </c:forEach>
    
		var data = google.visualization.arrayToDataTable([
		    ['Genre', type[0], type[1], type[2], type[3], type[4], { role: 'annotation' } ],
		    ['2017', pay2_2017, pay3_2017, pay4_2017, pay5_2017, pay6_2017, ''],
		    ['2018', pay2_2018, pay3_2018, pay4_2018, pay5_2018, pay6_2018, ''],
		    ['2019', pay2_2019, pay3_2019, pay4_2019, pay5_2019, pay6_2019, ''],
		  ]);
		
		  var options = {
		    width: 600,
		    height: 400,
		    legend: { position: 'top', maxLines: 3 },
		    bar: { groupWidth: '75%' },
		    isStacked: true,
		  };
		var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values1"));
		chart.draw(data, options);
	}
});

$(document).ready(function(){	
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  
    	  var pay2_01 = 0, pay2_02 = 0, pay2_03 = 0, pay2_04 = 0, pay2_05 = 0, pay2_06 = 0;
      	var pay2_07 = 0, pay2_08 = 0, pay2_09 = 0, pay2_10 = 0, pay2_11 = 0, pay2_12 = 0;
      	var pay3_01 = 0, pay3_02 = 0, pay3_03 = 0, pay3_04 = 0, pay3_05 = 0, pay3_06 = 0;
      	var pay3_07 = 0, pay3_08 = 0, pay3_09 = 0, pay3_10 = 0, pay3_11 = 0, pay3_12 = 0;
      	var pay4_01 = 0, pay4_02 = 0, pay4_03 = 0, pay4_04 = 0, pay4_05 = 0, pay4_06 = 0;
      	var pay4_07 = 0, pay4_08 = 0, pay4_09 = 0, pay4_10 = 0, pay4_11 = 0, pay4_12 = 0;
      	var pay5_01 = 0, pay5_02 = 0, pay5_03 = 0, pay5_04 = 0, pay5_05 = 0, pay5_06 = 0;
      	var pay5_07 = 0, pay5_08 = 0, pay5_09 = 0, pay5_10 = 0, pay5_11 = 0, pay5_12 = 0;
      	var pay6_01 = 0, pay6_02 = 0, pay6_03 = 0, pay6_04 = 0, pay6_05 = 0, pay6_06 = 0;
      	var pay6_07 = 0, pay6_08 = 0, pay6_09 = 0, pay6_10 = 0, pay6_11 = 0, pay6_12 = 0;
      	<c:forEach var="pay" items="${title_2}">
      		var str = "${pay.pay_date}";
      		var date_format = str.slice(4,10) + " " +str.slice(24,28);
      		var date = new Date(date_format);
      		var yy = str.slice(24,28);
      		var mm = date.toISOString().slice(0,10).replace(/-/g,"").slice(4,6);
      		if (yy == '2019'){
      			if (mm == '01'){
      		    	pay2_01 += ${pay.pay_cash};
      			} else if (mm == '02'){
      	    		pay2_02 += ${pay.pay_cash};
      	    	} else if (mm == '03'){
      	    		pay2_03 += ${pay.pay_cash};
      	    	}else if (mm == '04'){
      	    		pay2_04 += ${pay.pay_cash};
      	    	} else if (mm == '05'){
      	    		pay2_05 += ${pay.pay_cash};
      	    	}  else if (mm == '06'){
      	    		pay2_06 += ${pay.pay_cash};
      	    	} else if (mm == '07'){
      	    		pay2_07 += ${pay.pay_cash};
      	    	}  else if (mm == '08'){
      	    		pay2_08 += ${pay.pay_cash};
      	    	} else if (mm == '09'){
      	    		pay2_09 += ${pay.pay_cash};
      	    	}  else if (mm == '10'){
      	    		pay2_10 += ${pay.pay_cash};
      	    	} else if (mm == '11'){
      	    		pay2_11 += ${pay.pay_cash};
      	    	}  else if (mm == '12'){
      	    		pay2_12 += ${pay.pay_cash};
      	    	}
      		} 		    		    
  	    </c:forEach>    
  	    <c:forEach var="pay" items="${title_3}">
  	    var str = "${pay.pay_date}";
  		var date_format = str.slice(4,10) + " " +str.slice(24,28);
  		var date = new Date(date_format);
  		var yy = str.slice(24,28);
  		var mm = date.toISOString().slice(0,10).replace(/-/g,"").slice(4,6);
  		if (yy == '2019'){
  			if (mm == '01'){
  		    	pay3_01 += ${pay.pay_cash};
  			} else if (mm == '02'){
  	    		pay3_02 += ${pay.pay_cash};
  	    	} else if (mm == '03'){
  	    		pay3_03 += ${pay.pay_cash};
  	    	}else if (mm == '04'){
  	    		pay3_04 += ${pay.pay_cash};
  	    	} else if (mm == '05'){
  	    		pay3_05 += ${pay.pay_cash};
  	    	}  else if (mm == '06'){
  	    		pay3_06 += ${pay.pay_cash};
  	    	} else if (mm == '07'){
  	    		pay3_07 += ${pay.pay_cash};
  	    	}  else if (mm == '08'){
  	    		pay3_08 += ${pay.pay_cash};
  	    	} else if (mm == '09'){
  	    		pay3_09 += ${pay.pay_cash};
  	    	}  else if (mm == '10'){
  	    		pay3_10 += ${pay.pay_cash};
  	    	} else if (mm == '11'){
  	    		pay3_11 += ${pay.pay_cash};
  	    	}  else if (mm == '12'){
  	    		pay3_12 += ${pay.pay_cash};
  	    	}
  		} 		    		    
  	    </c:forEach>    
  	    <c:forEach var="pay" items="${title_4}">
  	    var str = "${pay.pay_date}";
  		var date_format = str.slice(4,10) + " " +str.slice(24,28);
  		var date = new Date(date_format);
  		var yy = str.slice(24,28);
  		var mm = date.toISOString().slice(0,10).replace(/-/g,"").slice(4,6);
  		if (yy == '2019'){
  			if (mm == '01'){
  		    	pay4_01 += ${pay.pay_cash};
  			} else if (mm == '02'){
  	    		pay4_02 += ${pay.pay_cash};
  	    	} else if (mm == '03'){
  	    		pay4_03 += ${pay.pay_cash};
  	    	}else if (mm == '04'){
  	    		pay4_04 += ${pay.pay_cash};
  	    	} else if (mm == '05'){
  	    		pay4_05 += ${pay.pay_cash};
  	    	}  else if (mm == '06'){
  	    		pay4_06 += ${pay.pay_cash};
  	    	} else if (mm == '07'){
  	    		pay4_07 += ${pay.pay_cash};
  	    	}  else if (mm == '08'){
  	    		pay4_08 += ${pay.pay_cash};
  	    	} else if (mm == '09'){
  	    		pay4_09 += ${pay.pay_cash};
  	    	}  else if (mm == '10'){
  	    		pay4_10 += ${pay.pay_cash};
  	    	} else if (mm == '11'){
  	    		pay4_11 += ${pay.pay_cash};
  	    	}  else if (mm == '12'){
  	    		pay4_12 += ${pay.pay_cash};
  	    	}
  		} 		    		    
  	    </c:forEach>    
  	    <c:forEach var="pay" items="${title_5}">
  	    var str = "${pay.pay_date}";
  		var date_format = str.slice(4,10) + " " +str.slice(24,28);
  		var date = new Date(date_format);
  		var yy = str.slice(24,28);
  		var mm = date.toISOString().slice(0,10).replace(/-/g,"").slice(4,6);
  		if (yy == '2019'){
  			if (mm == '01'){
  		    	pay5_01 += ${pay.pay_cash};
  			} else if (mm == '02'){
  	    		pay5_02 += ${pay.pay_cash};
  	    	} else if (mm == '03'){
  	    		pay5_03 += ${pay.pay_cash};
  	    	}else if (mm == '04'){
  	    		pay5_04 += ${pay.pay_cash};
  	    	} else if (mm == '05'){
  	    		pay5_05 += ${pay.pay_cash};
  	    	}  else if (mm == '06'){
  	    		pay5_06 += ${pay.pay_cash};
  	    	} else if (mm == '07'){
  	    		pay5_07 += ${pay.pay_cash};
  	    	}  else if (mm == '08'){
  	    		pay5_08 += ${pay.pay_cash};
  	    	} else if (mm == '09'){
  	    		pay5_09 += ${pay.pay_cash};
  	    	}  else if (mm == '10'){
  	    		pay5_10 += ${pay.pay_cash};
  	    	} else if (mm == '11'){
  	    		pay5_11 += ${pay.pay_cash};
  	    	}  else if (mm == '12'){
  	    		pay5_12 += ${pay.pay_cash};
  	    	}
  		} 		    		    
  	    </c:forEach>
  	  <c:forEach var="pay" items="${title_6}">
	    var str = "${pay.pay_date}";
		var date_format = str.slice(4,10) + " " +str.slice(24,28);
		var date = new Date(date_format);
		var yy = str.slice(24,28);
		var mm = date.toISOString().slice(0,10).replace(/-/g,"").slice(4,6);
		if (yy == '2019'){
			if (mm == '01'){
		    	pay6_01 += ${pay.pay_cash};
			} else if (mm == '02'){
	    		pay6_02 += ${pay.pay_cash};
	    	} else if (mm == '03'){
	    		pay6_03 += ${pay.pay_cash};
	    	}else if (mm == '04'){
	    		pay6_04 += ${pay.pay_cash};
	    	} else if (mm == '05'){
	    		pay6_05 += ${pay.pay_cash};
	    	}  else if (mm == '06'){
	    		pay6_06 += ${pay.pay_cash};
	    	} else if (mm == '07'){
	    		pay6_07 += ${pay.pay_cash};
	    	}  else if (mm == '08'){
	    		pay6_08 += ${pay.pay_cash};
	    	} else if (mm == '09'){
	    		pay6_09 += ${pay.pay_cash};
	    	}  else if (mm == '10'){
	    		pay6_10 += ${pay.pay_cash};
	    	} else if (mm == '11'){
	    		pay6_11 += ${pay.pay_cash};
	    	}  else if (mm == '12'){
	    		pay6_12 += ${pay.pay_cash};
	    	}
		} 		    		    
	    </c:forEach>
  	    
        var data = google.visualization.arrayToDataTable([
          ['Month', type[0], type[1], type[2], type[3], type[4]],
          ['1월', pay2_01, pay3_01, pay4_01, pay5_01, pay6_01],
          ['2월', pay2_02, pay3_02, pay4_02, pay5_02, pay6_02],
          ['3월', pay2_03, pay3_03, pay4_03, pay5_03, pay6_03],
          ['4월', pay2_04, pay3_04, pay4_04, pay5_04, pay6_04],
          ['5월', pay2_05, pay3_05, pay4_05, pay5_05, pay6_05],
          ['6월', pay2_06, pay3_06, pay4_06, pay5_06, pay6_06],
          ['7월', pay2_07, pay3_07, pay4_07, pay5_07, pay6_07],
          ['8월', pay2_08, pay3_08, pay4_08, pay5_08, pay6_08],
          ['9월', pay2_09, pay3_09, pay4_09, pay5_09, pay6_09],
          ['10월', pay2_10, pay3_10, pay4_10, pay5_10, pay6_10],
          ['11월', pay2_11, pay3_11, pay4_11, pay5_11, pay6_11],
          ['12월', pay2_12, pay3_12, pay4_12, pay5_12, pay6_12],
        ]);

        var options = {
          chart: {
            title: 'Company Performance',
            subtitle: 'Sales, Expenses, and Profit: 2014-2017',
          },
        	//bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
});

$(document).ready(function(){
	var myConfig = {
		 	type: "pie", 
		 	plot: {
		 	  borderWidth: 5,
		 	  // slice: 90,
		 	  valueBox: {
		 	    placement: 'out',
		 	    text: '%t\n%npv%',
		 	    fontFamily: "Open Sans"
		 	  },
		 	  tooltip:{
		 	    fontSize: '18',
		 	    fontFamily: "Open Sans",
		 	    padding: "5 10",
		 	    text: "%v원"
		 	  },
		 	  animation:{
		      effect: 2, 
		      method: 5,
		      speed: 500,
		      sequence: 1
		    }
		 	},
		 	source: {
		 	  text: 'gs.statcounter.com',
		 	  fontColor: "#8e99a9",
		 	  fontFamily: "Open Sans"
		 	},
		 	title: {
		 	  fontColor: "#fff",
		 	  text: 'Global Browser Usage',
		 	  align: "left",
		 	  offsetX: 10,
		 	  fontFamily: "Open Sans",
		 	  fontSize: 25
		 	},
		 	subtitle: {
		 	  offsetX: 10,
		 	  offsetY: 10,
		 	  fontColor: "#8e99a9",
		 	  fontFamily: "Open Sans",
		 	  fontSize: "16",
		 	  text: 'May 2016',
		 	  align: "left"
		 	},
		 	plotarea: {
		 	  margin: "20 0 0 0"  
		 	},
			series : [
				{
				  values : [pay2],
				  text: type[0],
				  backgroundColor: '#50ADF5',
				},
				{
				  values: [pay3],
				  text: type[1],
				  backgroundColor: '#FF7965'
				},
				{
				  values: [pay4],
				  text: type[2],
				  backgroundColor: '#FFCB45'
				},
				{
				  text: type[3],
				  values: [pay5],
				  backgroundColor: '#6877e5'
				},
				{
				  text: type[4],
				  values: [pay6],
				  backgroundColor: '#6FB07F'
				}
			]
		};

		zingchart.render({ 
			id : 'myChart', 
			data : myConfig, 
			height: 300, 
			width: 525 
		});
	
});
</script>

</head>
<body>

 <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
              							<h2>회원통계</h2>

          </div>

 

          <!-- Content Row -->

          <div class="row">

            <!-- 2번1번차트헤더 -->
            <div class="col-xl-6 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">성별통계</h6>
                  
                </div>
                <!-- 차트바디 -->
                <div class="card-body">
                  
                    
                    <div id="columnchart_values"></div>
                    

                  
                  
                </div>
              </div>
            </div>
            
              <!-- 2번 차트헤더 -->
            <div class="col-xl-6 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">직급통계</h6>
                  
                </div>
                <!-- 차트바디 -->
                <div class="card-body">
                  
                  
			 <div id="columnchart_values1"></div>


                  
                  
                </div>
              </div>
            </div>
            
             <!-- 3번 차트헤더 -->
            <div class="col-xl-6 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">부서통계</h6>
                  
                </div>
                <!-- 차트바디 -->
                <div class="card-body">
                  
                  <div id="myChart" class="chartbox"></div>
                  
		<!-- 	<div id="piechart" style="width: 600px; height: 400px;"></div> -->

                  
                  
                </div>
              </div>
            </div>
            
             <!-- 4번 차트헤더 -->
            <div class="col-xl-6 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">부서통계</h6>
                  
                </div>
                <!-- 차트바디 -->
                <div class="card-body">
                  
                  <div id="myChart" class="chartbox"></div>
                  
		<!-- 	<div id="piechart" style="width: 600px; height: 400px;"></div> -->

                  
                  
                </div>
              </div>
            </div>
            
            
              <!-- 5번 긴차트헤더 -->
            <div class="col-xl-9 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">직급통계</h6>
                  
                </div>
                <!-- 차트바디 -->
                <div class="card-body">
                  
                  
			<div id="columnchart_material"style="width: 900px; height: 500px;"></div>



                  
                  
                </div>
              </div>
            </div>
            

         
          </div>

        </div>
        <!-- /.container-fluid -->






<br>
<div id="columnchart_values"></div>
<br>
<div id="columnchart_values1"></div>
<br>
<div id="columnchart_material"style="width: 900px; height: 500px;"></div>
<br>
<div id="myChart" class="chartbox"></div>
<br>
<br>
</body>
</html>