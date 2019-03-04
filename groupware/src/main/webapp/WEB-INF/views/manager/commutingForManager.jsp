<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.board{
	padding: 15px;
	margin: 3px;
	border: 1px solid lightgray;
	background-color: #fdfdfd;
}

.parentNode{
display: block;
}

</style>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-easyui/jquery.easyui.min.js"></script>

<script type="text/javascript">
$(function(){
	$(".board").hover(function(){
		$(this).css("background", "#dddddd");	
	},function(){
		$(this).css("background", "#fdfdfd");
		$(".board:first").css("background", "#dddddd");
	});
	
	
});

$( function() {
    $( "#halfPick" ).datepicker({
    	defaultDate: new Date(),
        changeMonth: true,
        changeYear: true,
    	beforeShow: function (textbox, instance) {
		       var txtBoxOffset = $(this).offset();
		       var top = txtBoxOffset.top;
		       var left = txtBoxOffset.left;
		       var textBoxWidth = $(this).outerWidth();
		               setTimeout(function () {
		                   instance.dpDiv.css({
		                       top: top, //you can adjust this value accordingly  
		                       left: left//show at the end of textBox
		               });
		           }, 0);

		   }
    });
  } );

$(document).ready(function(){
	$('#row_${day}').css('background','#FF6347');
})

function nextMonth(){
	if(${month > 11}){
		$('<input></input>').attr('type','hidden').attr('name', 'month').attr('value','${month%12}').appendTo('#selectDayForm');
		$('<input></input>').attr('type','hidden').attr('name', 'year').attr('value','${year+1}').appendTo('#selectDayForm');
	}else{
		$('<input></input>').attr('type','hidden').attr('name', 'month').attr('value','${month}').appendTo('#selectDayForm');
		$('<input></input>').attr('type','hidden').attr('name', 'year').attr('value','${year}').appendTo('#selectDayForm');
	}
	$('#selectDayForm').submit();
}


function previousMonth(){
	if(${month-2 < 0}){
		$('<input></input>').attr('type','hidden').attr('name', 'month').attr('value','${month+10}').appendTo('#selectDayForm');
		$('<input></input>').attr('type','hidden').attr('name', 'year').attr('value','${year-1}').appendTo('#selectDayForm');
	}else{
		$('<input></input>').attr('type','hidden').attr('name', 'month').attr('value','${month-2}').appendTo('#selectDayForm');
		$('<input></input>').attr('type','hidden').attr('name', 'year').attr('value','${year}').appendTo('#selectDayForm');
	}
	$('#selectDayForm').submit();
} 

function nextYear(){
	$('<input></input>').attr('type','hidden').attr('name', 'month').attr('value','${month-1}').appendTo('#selectDayForm');
	$('<input></input>').attr('type','hidden').attr('name', 'year').attr('value','${year+1}').appendTo('#selectDayForm');
	$('#selectDayForm').submit();
}


function previousYear(){
	$('<input></input>').attr('type','hidden').attr('name', 'month').attr('value','${month-1}').appendTo('#selectDayForm');
	$('<input></input>').attr('type','hidden').attr('name', 'year').attr('value','${year-1}').appendTo('#selectDayForm');
	$('#selectDayForm').submit();
} 

function today(){
		$('<input></input>').attr('type','hidden').attr('name', 'month').attr('value',null).appendTo('#selectDayForm');
		$('<input></input>').attr('type','hidden').attr('name', 'year').attr('value',null).appendTo('#selectDayForm');
	
	$('#selectDayForm').submit();
}

function datePick(){
	
	var dPick = $('#halfPick').val();
	console.log(dPick);
	
	var arr = dPick.split('/');
	console.log(arr[0])
	console.log(arr[1])
	console.log(arr[2])
	
	$('<input></input>').attr('type','hidden').attr('name', 'month').attr('value',arr[0]).appendTo('#selectDayForm');
	$('<input></input>').attr('type','hidden').attr('name', 'day').attr('value',arr[1]).appendTo('#selectDayForm');
	$('<input></input>').attr('type','hidden').attr('name', 'year').attr('value',arr[2]).appendTo('#selectDayForm');
	$('<input></input>').attr('type','hidden').attr('name', 'dPick').attr('value',dPick).appendTo('#selectDayForm');
	
	$('#selectDayForm').submit();
}

</script>

</head>
<body>
	<div class="container-fluid text-center">
<form id="selectDayForm" action="${ pageContext.request.contextPath }/manager/commuting"></form>


<div class="row">

<div class="col-3">


					<h2>직원 선택</h2>
					
					<div style="padding:0px; margin: 0px; width: 250px;" id="parentNode">
				    <div class="easyui-panel" style="overflow-x:hidden; height:700px; width: 250px;">
				        <ul id="tt" class="easyui-tree">


						<li><span>KITWARE</span>
							<ul>
								<c:forEach items="${deptList}" var="dept" >
									<li data-options="state:'closed'"><span>${dept.department_id}) ${dept.department_name}</span>
										<ul>
 											<c:forEach items="${memList}" var="mem">
												<c:if test="${dept.department_id eq mem.member_department}">
												<c:if test="${mem.rank_name == null}"> ${ mem.rank_name = "입사대기" }</c:if>
													<li>${mem.rank_name}|${mem.member_id}|${mem.member_name}</li> 
												</c:if>
											</c:forEach>
										</ul>
									</li>
								</c:forEach>
							</ul>
						</li>
        </ul>
    </div>
    </div>
    
    
</div>

 <%--                <div class="card-header py-4">

<div class="container-fulid col-9">
	<div class="clearfix">
	<div class="float-left">
		<h2>${ year }년 ${ month }월</h2>
	</div>	
	<div class="float-right ">
		<input type="text" id="halfPick" name="halfPick" class="btn btn-outline-primary" onchange="datePick()" value="${ dPick }">
		<button class="btn btn-outline-primary" onclick="previousYear()">이전해</button>
		<button class="btn btn-outline-primary" onclick="previousMonth()">이전달</button>
		<button class="btn btn-outline-primary" onclick="today()">오늘</button>
		<button class="btn btn-outline-primary" onclick="nextMonth()">다음달</button>
		<button class="btn btn-outline-primary" onclick="nextYear()">다음해</button>
	</div>
	</div>
	<div class="row board text-center" style="background-color: #dddddd">
		<div class="col-sm"><strong>날짜</strong></div>
		<div class="col-sm"><strong>출근시간</strong></div>
		<div class="col-sm"><strong>퇴근시간</strong></div>
		<div class="col-sm"><strong>지각시간</strong></div>
		<div class="col-sm"><strong>근무시간</strong></div>
		<div class="col-sm"><strong>상태</strong></div>
		<div class="col-sm"><strong>근태사유</strong></div>
	</div>
	
	<c:forEach items="${calendar}" var="calendar" varStatus="status">
		<div class="row board text-center" id="row_${status.count}" onclick="console.log(this.value)">
			<div class="col-sm" id="day_${status.count}">${calendar.day}(${calendar.days})</div>								
			<div class="col-sm" id="arrive_${status.count}"></div>
			<div class="col-sm" id="leave_${status.count}"></div>
			<div class="col-sm" id="delay_${status.count}"></div>							
			<div class="col-sm" id="over_${status.count}"></div>
			<div class="col-sm" id="stat_${status.count}"></div>
			<div class="col-sm" id="reason_${status.count}"></div>
		</div>
	</c:forEach>						
</div>
</div></div>
 --%>
 
 
<div class="col-9">


		<!-- 게시글 -->
 	<div class="col-lg-12">
 			
             
              <div class="card" >
                <div class="card-header py-3">
   <form id="selectDayForm" action="${ pageContext.request.contextPath }/commuting/commuting"></form>          	
					<div class="container-fulid">
					
	<div class="clearfix">
	<div class="float-left">
		<h2>${ year }년 ${ month }월</h2>
	</div>	
	<div class="float-right ">
		<input type="text" id="halfPick" name="halfPick" class="btn btn-outline-primary" onchange="datePick()" value="${ dPick }">
		<button class="btn btn-outline-primary" onclick="previousYear()">이전해</button>
		<button class="btn btn-outline-primary" onclick="previousMonth()">이전달</button>
		<button class="btn btn-outline-primary" onclick="today()">오늘</button>
		<button class="btn btn-outline-primary" onclick="nextMonth()">다음달</button>
		<button class="btn btn-outline-primary" onclick="nextYear()">다음해</button>
	</div>
	</div>
	 
               
                <div class="card-body text-center">
                  <hr>
                  
                  <div style="height:650px; overflow:auto; overflow-x:hidden; overflow-y:auto;" align=left>
                  
                  
	<div class="row board text-center" style="background-color: #dddddd">
		<div class="col-sm"><strong>날짜</strong></div>
		<div class="col-sm"><strong>출근시간</strong></div>
		<div class="col-sm"><strong>퇴근시간</strong></div>
		<div class="col-sm"><strong>지각시간</strong></div>
		<div class="col-sm"><strong>근무시간</strong></div>
		<div class="col-sm"><strong>상태</strong></div>
		<div class="col-sm"><strong>근태사유</strong></div>
	</div>
	
	<c:forEach items="${calendar}" var="calendar" varStatus="status">
		<div class="row board text-center" id="row_${status.count}" onclick="console.log(this.value)">
			<div class="col-sm" id="day_${status.count}">${calendar.day}(${calendar.days})</div>								
			<div class="col-sm" id="arrive_${status.count}"></div>
			<div class="col-sm" id="leave_${status.count}"></div>
			<div class="col-sm" id="delay_${status.count}"></div>							
			<div class="col-sm" id="over_${status.count}"></div>
			<div class="col-sm" id="stat_${status.count}"></div>
			<div class="col-sm" id="reason_${status.count}"></div>
		</div>
	</c:forEach>	
</div>
                  
                  
                  </div>
                 
                  <hr>
            
                </div>
              </div>
			
            </div>
	
	</div>
	
</div>
</div>
</div>	
 
	<script>
	
	$('#tt').tree({
		onClick: function(node){
			console.log(node.text);
			
			var arr = (node.text).split("|");
			console.log(arr[1]);
			var param = "year=${ year }&month=${ month }&member_id="+arr[1];
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/commuting/view",
				data:param,
				success:function(data){
					var arr = JSON.parse(data);
					console.log(arr);
					
					for(var j = 1; j <= ${lastDay} ; j++){
						$('#arrive_'+j+'').text(null);
						$('#leave_'+j+'').text(null);
						$('#delay_'+j+'').text(null);
						$('#over_'+j+'').text(null);
						$('#reason_'+j+'').text(null);
					}
					
					for(var i = 0; i < arr.length; i++){
						arr[i].commuting_status_date;
						
						var num = parseInt(arr[i].commuting_status_date.substring(0,2));
						$('#reason_'+num+'').val(arr[i].commuting_comment);
						$('#row_'+num+'').val(arr[i].commuting_id);
						$('#stat_'+num+'').text(arr[i].commuting_status);
						try{					
							$('#arrive_'+num+'').text(arr[i].commuting_arrive.slice(2));
						}catch(Exception){}
						try{
							$('#leave_'+num+'').text(arr[i].commuting_leave.slice(2));
						}catch(Exception){	}
						 
						try{
							var arrive = new Date("2019-02-01 "+arr[i].commuting_arrive.slice(2));
							
							var ontime = new Date("2019-02-01 09:00:00");
							var gap = arrive.getTime() - ontime.getTime();
							
							if(gap/1000/60 >0){
								if(Math.floor(gap/1000/60/60)>0){
									var hour = Math.floor(gap/1000/60/60);
									$('#delay_'+num+'').text(hour+"시간"+Math.floor((gap-(hour*1000*60*60))/1000/60)+"분");
								}else{
									$('#delay_'+num+'').text(Math.ceil(gap/1000/60)+"분");
								} 
							}
						}catch(Exception){	}
						
						try{
							var work_arrive = new Date("2019-02-01 "+arr[i].commuting_arrive.slice(2));
							var work_leave = new Date("2019-02-01 "+arr[i].commuting_leave.slice(2));
							var gap2 = work_leave.getTime() - work_arrive.getTime();
							
							if(gap2/1000/60 >0){
								if(Math.floor(gap2/1000/60/60)>0){
									var hour = Math.floor(gap2/1000/60/60);
									$('#over_'+num+'').text(hour+"시간"+Math.floor((gap2-(hour*1000*60*60))/1000/60)+"분");
								}else{
									$('#over_'+num+'').text(Math.ceil(gap2/1000/60)+"분"); 
								} 
							}
						}catch(Exception){
							
						}//catch end
						$('#reason_'+num+'').text(arr[i].commuting_comment);
					}//for end
					
				}
			});//ajax end
			
			
		}// onclick
	}); //tt tree
	

	
	
	//============================================================================================================get Member commuting
	/* $(document).ready(function(){
		
		var param = "year=${ year }&month=${ month }";
		$.ajax({
			type:"POST",
			url:"../commuting/view",
			data:param,
			success:function(data){
				var arr = JSON.parse(data);
				console.log(arr);
				for(var i = 0; i < arr.length; i++){
					var arrive = arr[i].commuting_arrive;
					
					var num = parseInt(arrive.substring(0,2));
					$('#arrive_'+num+'').text(arrive.slice(2));
					try{
						$('#leave_'+num+'').text(arr[i].commuting_leave.slice(2));
					}catch(Exception){	}
					 
					var arrive = new Date("2019-02-01 "+arrive.slice(2));
					var ontime = new Date("2019-02-01 09:00:00");
					var gap = arrive.getTime() - ontime.getTime();
					
					if(gap/1000/60 >0){
						if(Math.floor(gap/1000/60/60)>0){
							var hour = Math.floor(gap/1000/60/60);
							$('#delay_'+num+'').text(hour+"시간"+Math.floor((gap-(hour*1000*60*60))/1000/60)+"분");
						}else{
							$('#delay_'+num+'').text(Math.ceil(gap/1000/60)+"분");
						} 
					}
					
					var work_arrive = new Date("2019-02-01 "+arr[i].commuting_arrive.slice(2));
					try{
						var work_leave = new Date("2019-02-01 "+arr[i].commuting_leave.slice(2));
						var gap2 = work_leave.getTime() - work_arrive.getTime();
						
						if(gap2/1000/60 >0){
							if(Math.floor(gap2/1000/60/60)>0){
								var hour = Math.floor(gap2/1000/60/60);
								$('#over_'+num+'').text(hour+"시간"+Math.floor((gap2-(hour*1000*60*60))/1000/60)+"분");
							}else{
								$('#over_'+num+'').text(Math.ceil(gap2/1000/60)+"분"); 
							} 
						}
					}catch(Exception){
						
					}
					
				}
				
			}
		});
		
	}) // ready end */
	</script>
</body>
</html>