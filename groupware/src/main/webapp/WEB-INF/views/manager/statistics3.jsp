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
<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
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
        title: "항목별  총 지출, 원",
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
            title: '월별 지출 통계',
            subtitle: '교통비, 사무비품, 출장비, 식대, 주유비 : 01월-12월',
          },
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
		 	  text: '2019',
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
<script>
$(document).ready(function(){	
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	// Pie Chart Example
	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: [type[0], type[1], type[2], type[3], type[4]],
	    datasets: [{
	      data: [pay2, pay3, pay4, pay5, pay6],
	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#e3aa17', '#e04435'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#a2790f', '#b0362a'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 3,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	    },
	    legend: {
	      display: false
	    },
	    cutoutPercentage: 80,
	  },
	});
});
$(document).ready(function(){
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	function number_format(number, decimals, dec_point, thousands_sep) {
	  // *     example: number_format(1234.56, 2, ',', ' ');
	  // *     return: '1 234,56'
	  number = (number + '').replace(',', '').replace(' ', '');
	  var n = !isFinite(+number) ? 0 : +number,
	    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
	    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
	    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
	    s = '',
	    toFixedFix = function(n, prec) {
	      var k = Math.pow(10, prec);
	      return '' + Math.round(n * k) / k;
	    };
	  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
	  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	  if (s[0].length > 3) {
	    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	  }
	  if ((s[1] || '').length < prec) {
	    s[1] = s[1] || '';
	    s[1] += new Array(prec - s[1].length + 1).join('0');
	  }
	  return s.join(dec);
	}

	var pay_01 = 0, pay_02 = 0, pay_03 = 0, pay_04 = 0, pay_05 = 0, pay_06 = 0;
  	var pay_07 = 0, pay_08 = 0, pay_09 = 0, pay_10 = 0, pay_11 = 0, pay_12 = 0;
  	<c:forEach var="pay" items="${title_2}">
  		var str = "${pay.pay_date}";
  		var date_format = str.slice(4,10) + " " +str.slice(24,28);
  		var date = new Date(date_format);
  		var yy = str.slice(24,28);
  		var mm = date.toISOString().slice(0,10).replace(/-/g,"").slice(4,6);
  		if (yy == '2019'){
  			if (mm == '01'){
  		    	pay_01 += ${pay.pay_cash};
  			} else if (mm == '02'){
  	    		pay_02 += ${pay.pay_cash};
  	    	} else if (mm == '03'){
  	    		pay_03 += ${pay.pay_cash};
  	    	}else if (mm == '04'){
  	    		pay_04 += ${pay.pay_cash};
  	    	} else if (mm == '05'){
  	    		pay_05 += ${pay.pay_cash};
  	    	}  else if (mm == '06'){
  	    		pay_06 += ${pay.pay_cash};
  	    	} else if (mm == '07'){
  	    		pay_07 += ${pay.pay_cash};
  	    	}  else if (mm == '08'){
  	    		pay_08 += ${pay.pay_cash};
  	    	} else if (mm == '09'){
  	    		pay_09 += ${pay.pay_cash};
  	    	}  else if (mm == '10'){
  	    		pay_10 += ${pay.pay_cash};
  	    	} else if (mm == '11'){
  	    		pay_11 += ${pay.pay_cash};
  	    	}  else if (mm == '12'){
  	    		pay_12 += ${pay.pay_cash};
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
		    	pay_01 += ${pay.pay_cash};
			} else if (mm == '02'){
	    		pay_02 += ${pay.pay_cash};
	    	} else if (mm == '03'){
	    		pay_03 += ${pay.pay_cash};
	    	}else if (mm == '04'){
	    		pay_04 += ${pay.pay_cash};
	    	} else if (mm == '05'){
	    		pay_05 += ${pay.pay_cash};
	    	}  else if (mm == '06'){
	    		pay_06 += ${pay.pay_cash};
	    	} else if (mm == '07'){
	    		pay_07 += ${pay.pay_cash};
	    	}  else if (mm == '08'){
	    		pay_08 += ${pay.pay_cash};
	    	} else if (mm == '09'){
	    		pay_09 += ${pay.pay_cash};
	    	}  else if (mm == '10'){
	    		pay_10 += ${pay.pay_cash};
	    	} else if (mm == '11'){
	    		pay_11 += ${pay.pay_cash};
	    	}  else if (mm == '12'){
	    		pay_12 += ${pay.pay_cash};
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
		    	pay_01 += ${pay.pay_cash};
			} else if (mm == '02'){
	    		pay_02 += ${pay.pay_cash};
	    	} else if (mm == '03'){
	    		pay_03 += ${pay.pay_cash};
	    	}else if (mm == '04'){
	    		pay_04 += ${pay.pay_cash};
	    	} else if (mm == '05'){
	    		pay_05 += ${pay.pay_cash};
	    	}  else if (mm == '06'){
	    		pay_06 += ${pay.pay_cash};
	    	} else if (mm == '07'){
	    		pay_07 += ${pay.pay_cash};
	    	}  else if (mm == '08'){
	    		pay_08 += ${pay.pay_cash};
	    	} else if (mm == '09'){
	    		pay_09 += ${pay.pay_cash};
	    	}  else if (mm == '10'){
	    		pay_10 += ${pay.pay_cash};
	    	} else if (mm == '11'){
	    		pay_11 += ${pay.pay_cash};
	    	}  else if (mm == '12'){
	    		pay_12 += ${pay.pay_cash};
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
		    	pay_01 += ${pay.pay_cash};
			} else if (mm == '02'){
	    		pay_02 += ${pay.pay_cash};
	    	} else if (mm == '03'){
	    		pay_03 += ${pay.pay_cash};
	    	}else if (mm == '04'){
	    		pay_04 += ${pay.pay_cash};
	    	} else if (mm == '05'){
	    		pay_05 += ${pay.pay_cash};
	    	}  else if (mm == '06'){
	    		pay_06 += ${pay.pay_cash};
	    	} else if (mm == '07'){
	    		pay_07 += ${pay.pay_cash};
	    	}  else if (mm == '08'){
	    		pay_08 += ${pay.pay_cash};
	    	} else if (mm == '09'){
	    		pay_09 += ${pay.pay_cash};
	    	}  else if (mm == '10'){
	    		pay_10 += ${pay.pay_cash};
	    	} else if (mm == '11'){
	    		pay_11 += ${pay.pay_cash};
	    	}  else if (mm == '12'){
	    		pay_12 += ${pay.pay_cash};
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
	    	pay_01 += ${pay.pay_cash};
		} else if (mm == '02'){
    		pay_02 += ${pay.pay_cash};
    	} else if (mm == '03'){
    		pay_03 += ${pay.pay_cash};
    	}else if (mm == '04'){
    		pay_04 += ${pay.pay_cash};
    	} else if (mm == '05'){
    		pay_05 += ${pay.pay_cash};
    	}  else if (mm == '06'){
    		pay_06 += ${pay.pay_cash};
    	} else if (mm == '07'){
    		pay_07 += ${pay.pay_cash};
    	}  else if (mm == '08'){
    		pay_08 += ${pay.pay_cash};
    	} else if (mm == '09'){
    		pay_09 += ${pay.pay_cash};
    	}  else if (mm == '10'){
    		pay_10 += ${pay.pay_cash};
    	} else if (mm == '11'){
    		pay_11 += ${pay.pay_cash};
    	}  else if (mm == '12'){
    		pay_12 += ${pay.pay_cash};
    	}
	} 		    		    
    </c:forEach>
    
	// Area Chart Example
	var ctx = document.getElementById("myAreaChart");
	var myLineChart = new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	    datasets: [{
	      label: "Cost",
	      lineTension: 0.3,
	      backgroundColor: "rgba(78, 115, 223, 0.05)",
	      borderColor: "rgba(78, 115, 223, 1)",
	      pointRadius: 3,
	      pointBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointBorderColor: "rgba(78, 115, 223, 1)",
	      pointHoverRadius: 3,
	      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	      pointHitRadius: 10,
	      pointBorderWidth: 2,
	      data: [pay_01, pay_02, pay_03, pay_04, pay_05, pay_06, pay_07, pay_08, pay_09, pay_10, pay_11, pay_12],
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'date'
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: 7
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          maxTicksLimit: 5,
	          padding: 10,
	          // Include a dollar sign in the ticks
	          callback: function(value, index, values) {
	            return '￦' + number_format(value);
	          }
	        },
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: false,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    legend: {
	      display: false
	    },
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      intersect: false,
	      mode: 'index',
	      caretPadding: 10,
	      callbacks: {
	        label: function(tooltipItem, chart) {
	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	          return datasetLabel + ': ￦' + number_format(tooltipItem.yLabel);
	        }
	      }
	    }
	  }
	});
})
</script>
</head>
<body>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
    	<h2>지출통계</h2>
    </div>
          
    <!-- Content Row -->
    <div class="row">

	    <!-- 2번1번차트헤더 -->
        <div class="col-xl-6 col-lg-7">
    	    <div class="card shadow mb-4">
        	    <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            	    <h6 class="m-0 font-weight-bold text-primary">항목별 지출 통계</h6>                  
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
               		<h6 class="m-0 font-weight-bold text-primary">연도별 지출 통계</h6>
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
            	    <h6 class="m-0 font-weight-bold text-primary">지출 통계</h6>
                </div>
                
                <!-- 차트바디 -->
                <div class="card-body">
                	<div id="myChart" class="chartbox"></div>                  
                </div>
            </div>
        </div>
            
        <!-- 4번 차트헤더 -->
        <div class="col-xl-6 col-lg-7">
        	<div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            	    <h6 class="m-0 font-weight-bold text-primary">지출 통계</h6>
                </div>
                
                <!-- 차트바디 -->
                <div class="card-body">
                	<div class="chart-pie pt-4">
                    	<canvas id="myPieChart"></canvas>                   
                  	</div>
               		<div class="mt-4 text-center small">
	                    <span class="mr-2">
	                      <i class="fas fa-circle text-primary"></i> 교통비
	                    </span>
	                    <span class="mr-2">
	                      <i class="fas fa-circle text-success"></i> 사무비품
	                    </span>
	                    <span class="mr-2">
	                      <i class="fas fa-circle text-info"></i> 출장비
	                    </span>
	                     <span class="mr-2">
	                      <i class="fas fa-circle text-warning"></i> 식대
	                    </span>
	                     <span class="mr-2">
	                      <i class="fas fa-circle text-danger"></i> 주유비
	                    </span>
					</div>
				</div>
			</div>
		</div>
            
            
        <!-- 5번 긴차트헤더 -->
		<div class="col-xl col-lg">
        	<div class="card shadow mb-4">
            	<!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                	<h6 class="m-0 font-weight-bold text-primary">월별(항목별) 지출 통계</h6>
                </div>
                
                <!-- 차트바디 -->
                <div class="card-body">
					<div id="columnchart_material" style="height:257px;"></div>
				</div>
			</div>
		</div>
		
		<!-- 6번 긴차트헤더 -->
		<div class="col-xl col-lg">
        	<div class="card shadow mb-4">
            	<!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                	<h6 class="m-0 font-weight-bold text-primary">월별 지출 통계</h6>
                </div>
                
                <!-- 차트바디 -->
                <div class="card-body">
              		<div class="chart-pie pt-4">
        				<canvas id="myAreaChart"></canvas>                   
        			</div>
        		</div>
			</div>
		</div>
		
		
		
	</div>
</div>
<!-- /.container-fluid -->

<br>
<br>

  
</body>
</html>