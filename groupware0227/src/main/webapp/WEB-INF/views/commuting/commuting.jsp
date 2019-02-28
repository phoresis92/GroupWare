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
</style>
<script type="text/javascript">
$(function(){
	$(".board").hover(function(){
		$(this).css("background", "#dddddd");	
	},function(){
		$(this).css("background", "#fdfdfd");
		$(".board:first").css("background", "#dddddd");
	});
	
	$("#allcheck").click(function(){
	    //클릭되었으면
	    if($("#allcheck").prop("checked")){
	        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	        $("input[name=checkedReply]").prop("checked",true);
	        //클릭이 안되있으면
	    }else{
	        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	        $("input[name=checkedReply]").prop("checked",false);
	    }
	});
	
	$("#frm").submit(function(){
		if(!$("input[name=checkedReply]").is(":checked")){
			alert("삭제할 댓글을 선택해 주세요");
			return false;
		}
		return true;
	});
});
setInterval('time()', 1000);

function time() {
	$.ajax({
		type:"POST",
		url:"../commuting/current_time",
		success:function(data){
			var obj = eval('('+data+')');			
			$("#current_time").html(obj.value);				
		}
	});
}
$(function(){
	$("#arrive").click(function(){
		var commuting_member_id = $("#commuting_member_id").val();
		var param = "commuting_member_id="+commuting_member_id;
		$.ajax({
			type:"POST",
			url:"../commuting/arrive",
			data:param,
			success:function(data){
				var obj = eval('('+data+')');			
				alert(obj.value);				
			}
		});
	});	
	$("#leave").click(function(){
		var commuting_member_id = $("#commuting_member_id").val();
		var param = "commuting_member_id="+commuting_member_id;
		$.ajax({
			type:"POST",
			url:"../commuting/leave",
			data:param,
			success:function(data){
				var obj = eval('('+data+')');			
				alert(obj.value);				
			}
		});
	});
	
		
});
	$(document).ready(function(){
		
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
		
	}) // ready end

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

</script>

</head>
<body>

<form id="selectDayForm" action="${ pageContext.request.contextPath }/commuting/commuting"></form>

<div>
<div id="current_time"></div>
<div class="input-group">
<input type="hidden" id="commuting_member_id" value="${sessionScope.member.member_id}"/>
<button type="button" id="arrive" class="btn btn-secondary">출근</button>
<button type="button" id="leave" class="btn btn-secondary">퇴근</button>
</div>
</div>
<div class="container-fulid">
<button type="button" id="btn_view">출근 기록 보기</button>
<div id="commuting_view"></div>
<div class="container-fulid">
	<div>
		${ year }년 ${ month }월
	</div>
	<div class="clearfix">
	<div class="float-right ">
		<button onclick="previousMonth()">이전달</button>
		<button onclick="nextMonth()">다음달</button>
	</div>
	<div class="float-right ">
		<button onclick="previousYear()">이전해</button>
		<button onclick="nextYear()">다음해</button>
	</div>
	<div class="float-right ">
		<button onclick="today()">오늘</button>
	</div>
	</div>
	<div class="row board text-center" style="background-color: #dddddd">
		<div class="col-sm"><strong>날짜</strong></div>
		<div class="col-sm"><strong>출근시간</strong></div>
		<div class="col-sm"><strong>퇴근시간</strong></div>
		<div class="col-sm"><strong>지각시간</strong></div>
		<div class="col-sm"><strong>근무시간</strong></div>
		<div class="col-sm"><strong>사유</strong></div>
	</div>
	
	<c:forEach items="${calendar}" var="calendar" varStatus="status">
		<div class="row board text-center">
			<div class="col-sm" id="day_${status.count}">${calendar.day}(${calendar.days})</div>								
			<div class="col-sm" id="arrive_${status.count}"><fmt:formatDate value="${value.commuting_arrive}" pattern="hh24:mm:ss"/></div>
			<div class="col-sm" id="leave_${status.count}"><fmt:formatDate value="${value.commuting_leave}" pattern="hh24:mm:ss"/></div>
			<div class="col-sm" id="delay_${status.count}"></div>							
			<div class="col-sm" id="over_${status.count}"></div>
			<div class="col-sm" id="reason_${status.count}"><fmt:formatDate value="${value.commuting_arrive}" pattern="yyyy-MM-dd"/></div>
		</div>
	</c:forEach>						
</div>
</div>
</body>
</html>