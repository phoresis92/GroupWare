<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- <META HTTP-EQUIV="refresh" CONTENT="60"> -->
  <title>Calendar</title>




<!-- bootstrap ref -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>



	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/jquery-easyui/themes/icon.css">
    <!-- <link rel="stylesheet" type="text/css" href="/resources/jquery-easyui/demo.css"> -->
   <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-easyui/jquery.min.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-easyui/jquery.easyui.min.js"></script>
    
    

<!-- fullcalendar ref -->
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.css' />
<%-- <script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/jquery.min.js'></script> --%>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/moment.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lang/ko.js'></script>


</head>

<style>

.fc-content{
    cursor: pointer;
}

</style>

<script type="text/javascript">



var events_array = [];

$(document).ready(function() {
	
	var arr = eval('${list}');
	console.log(arr);
	events_array = arr;
	
});// ready end


var temp = [];

function chk(){
	console.log($('#campCal').is(':checked'))
	if($('#campCal').is(':checked')){
		
		
		$.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/calendar/getCalList",
			  data: "member_id=99999",
			  success: function(data) {	 
					var list = JSON.parse(data);
					//console.log(list);
					for(var i = 0 ; i<list.length; i++){
						var start = new Date(list[i].start);
						var end = new Date(list[i].end);
						
						var row = printCal(list[i]);
						
						if((end-start)%86400000 == 0){
							row.allDay = true
						}
						
						console.log(list[i].id)
						temp.push(list[i].id);
						
						$('#calendar').fullCalendar('addEventSource', [{
					        id: list[i].id,
					        title: list[i].title,
					        start: list[i].start,
					        end: list[i].end,
					        content: list[i].content,
					        calendar_cate: list[i].calendar_cate, 
					        calendar_cateSelf: list[i].calendar_cateSelf, 
					        member_id: list[i].member_id,
					        color: list[i].color,
					        allDay: list[i].allDay
					    }]);
						
					} //for end
			  }
		})//ajax end
	}else{
		for(var i = 0 ; i < temp.length; i++){
			console.log(temp[i])
			$('#calendar').fullCalendar('removeEvents', temp[i])
		}
	}
}//chk end

	  
	$(document).ready(function(){  
	  
    // We will refer to $calendar in future code
    var $calendar = $("#calendar").fullCalendar({ //start of options
        //weekends : false, // do not show saturday/sunday
        header: {
          left: 'prevYear,nextYear',
          center: 'title',
          right: 'today,month,agendaDay,agendaWeek prev,next'
        },
        // Make possible to respond to clicks and selections
        // allow "more" link when too many events
        eventLimit: true,
        navLinks: true,
        // Make events editable, globally
        //defaultView: 'listWeek',
        
        
        eventRender: function(event, element, view) {
              },
        // Callback triggered when we click on an event
        eventClick: function(event, jsEvent, view) {
        	console.log(event.member_id)
        	if(event.member_id == 99999 && ${sessionScope.member.member_status != 9}){
        		return;
        	}
        	
        	var cl = ${cateList};
        	
        	var cate_name;
        	
	        for(var o = 0 ; o < cl.length ; o++){
	        	if(cl[o].cal_cate_id == event.calendar_cate){
		       		cate_name = cl[o].cal_cate_name;
	        	}
	        }
	        
	        if(event.calendar_cate == 0){
	        	cate_name = event.calendar_cateSelf;
	        }
	        
	        	var cateNum = 0;
	        //console.log(typeof(event.calendar_cate));
	        //console.log(event.calendar_cate);
	        if(typeof(event.calendar_cate) == 'string'){
	        	cate_name = event.calendar_cate;
	        }else{
	        	cateNum = parseInt(event.calendar_cate);
	        }
	        	
	        
        	//console.log(cate_name)
        	//console.log(cate_name)
        	//console.log(moment(event.end).format('YYYY-MM-DD  hh:mm:ss'))
        	
        	$("#pid").val(event.id);
        	$('#colorProp').val(event.color);
        	$('#cate_num').val(cateNum);
        	
        	if(event.allDay){
	        	$('#isallDay').val('1');
	        	$('#pend').text(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD  HH:mm:ss'));
        	}else{
	        	$('#isallDay').val('0');
	        	$('#pend').text(moment(event.end).format('YYYY-MM-DD  HH:mm:ss'));
        	}
        	
	    	$("#pselect").text(cate_name);
        	$("#psubject").text(event.title);
        	$("#pcontent").html(event.content);
        	$('#pstart').text(moment(event.start).format('YYYY-MM-DD  HH:mm:ss'));
        	
        	$("#dayModal").modal();	
        	
        	

        }, // End callback eventClick
        select: function(start, end, jsEvent, view) {
        	
        },
        events: events_array
      } //End of options
    
  );// calendar end
  
	})//ready end
  

  
	  
	  //=================================================================================================================
	  
  function printCal(obj){
	  if(obj.allDay == 0){
		  if(obj.calendar_cate != 0){
				var event = {
						id: obj.calendar_id+"",
						member_id: obj.calendar_member_id,
						title: obj.title+"",
						content: obj.content+"",
						start: moment(obj.start),
						end: moment(obj.end),
						color: obj.color,
						calendar_cate: obj.calendar_cate
				};
			}else{
				var event = {
						id: obj.calendar_id+"",
						member_id: obj.calendar_member_id,
						title: obj.title+"",
						content: obj.content+"",
						start: moment(obj.start),
						end: moment(obj.end),
						color: obj.color,
						calendar_cate: obj.calendar_cateSelf
				};
			}
	}else{
		  if(obj.calendar_cate != 0){
			    var event = {
			    	id: obj.calendar_id+"",
			    	member_id: obj.calendar_member_id,
						title: obj.title+"",
						content: obj.content+"",
						start: moment(obj.start).format(),
						end: moment(obj.end).format(),
						color: obj.color,
						calendar_cate: obj.calendar_cate,
			        allDay: true
			    };
			  }else{
			    var event = {
			    	id: obj.calendar_id+"",
			    	member_id: obj.calendar_member_id,
						title: obj.title+"",
						content: obj.content+"",
						start: moment(obj.start).format(),
						end: moment(obj.end).format(),
						color: obj.color,
						calendar_cate: obj.calendar_cateSelf,
			        allDay: true
			    };
			  }
			}
	  
	  return event;
  }// printCal end
  
	function adChBx(){
		if($('#allDay').is(':checked')){
			$('#start_time').attr('disabled',true);
			$('#end_time').attr('disabled',true);
		}else{
			$('#start_time').removeAttr('disabled')
			$('#end_time').removeAttr('disabled')
		}
	}

	
	function modadChBx(){
		if($('#modallDay').is(':checked')){
			$('#modstart_time').attr('disabled',true);
			$('#modend_time').attr('disabled',true);
		}else{
			$('#modstart_time').removeAttr('disabled')
			$('#modend_time').removeAttr('disabled')
		}
	}
	
	

</script>



<style media="screen">
  #calendar {
    width: 90%;
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
  .centered {
    text-align: center;
  }
  
  .colpick {
  z-index: 9999;
}
#myModal .modal-body {
    overflow-y: visible;
}
  
</style>

<body>

	<div class="container-fluid" style="margin-top:30px;">
		<div class="row">
			<div class="col-3">
				
					<h2>직원 선택</h2>
					
				<div id="showComp">
					<input id="campCal" type="checkbox" value="campCal" onchange="chk()">회사일정 같이보기
				</div>
					
					<div class="container col-5" style="padding:0px; margin: 0px; width: 500px;">
				    <div class="easyui-panel" style="overflow-x:hidden; height:500px; width: 240px;">
				        <ul id="tt" class="easyui-tree">


						<li><span>KITWARE</span>
							<ul>
								<c:forEach items="${deptList}" var="dept">
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
			<!-- The calendar container -->
			<div class="col-9">
			
				<div id="calendar"></div>
			</div>
		</div>
	</div>
	
	
	
	
					<!-- 일정보기 ================================================================================================================================== -->
					<div class="modal fade" id="dayModal" role="dialog">
    					<div class="modal-dialog">
							<div class="modal-content">
							<form class="form-horizontal" role="form" id="sform" action="${root}/schedule/sadd.kitri" method="get">
								<!-- MODAL HEADER -->
								<div class="modal-header">
									<h4 class="modal-title">일정 보기</h4>
									<button type="button" class="close float-right" data-dismiss="modal">&times;</button>
								</div>
								
								<!-- MODAL BODY -->
								<div class="modal-body" id="modalBody">
								<!-- hidden value -->
								<input type="hidden" id="pid">
								<input type="hidden" id="colorProp">
								<input type="hidden" id="cate_num">
								<input type="hidden" id="isallDay">
									<div class="form-group row">
										<div align= "center" style="padding-left: 40px;"><label >구분</label></div>
											<!-- spring form 태그로 select 불러오기 -->
											<label class="col-lg-10" id="pselect"></label>
										</div>
									<div class="form-group row" style="padding-left: 40px;">
										<div align= "center"><label >시작날짜</label></div>
											<label class="col-lg-10" id="pstart"></label>
										</div>
									<div class="form-group row" style="padding-left: 40px;">
										<div align= "center"><label >종료날짜</label></div>
											<label class="col-lg-10" id="pend"></label>
									</div>
									<div class="form-group row" style="padding-left: 40px;">
										<div align= "center"><label >제목</label></div>
											<label class="col-lg-10" id="psubject"></label>
									</div>
									<div class="form-group row" style="padding-left: 40px;">
										<div align= "center"><label >내용</label></div>
										<div id="pcontent" class="col-lg-10">
										</div>
									</div>
								</div>
								
							</form>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
									
	
	
	<script>
	
	
	
	$('#tt').tree({
		onClick: function(node){
			$('#calendar').fullCalendar( 'removeEvents' );
			console.log(node.text);
			
			$('#campCal').prop("checked", false);
			
			var arr = (node.text).split("|");
			
			
			$.ajax({
	              type: 'POST',
	              url: "${pageContext.request.contextPath}/calendar/getCalList",
	              data: "member_id="+arr[1]+"",
	              success: function(data) {
	            	  var list = JSON.parse(data);
						//console.log(list);
						for(var i = 0 ; i<list.length; i++){
							var start = new Date(list[i].start);
							var end = new Date(list[i].end);
							
							var row = printCal(list[i]);
							
							if((end-start)%86400000 == 0){
								row.allDay = true
							}
							
							
							$('#calendar').fullCalendar('addEventSource', [{
						        id: list[i].id,
						        // select 값 가져오기
						        title: list[i].title,
						        start: list[i].start,
						        end: list[i].end,
						        content: list[i].content,
						        calendar_cate: list[i].calendar_cate, 
						        calendar_cateSelf: list[i].calendar_cateSelf, 
						        member_id: list[i].member_id,
						        color: list[i].color,
						        allDay: list[i].allDay
						    }]);
							
						} //for end
	            }// success end
			});// ajax
			
		}
	});
	
	</script>
	

</body>

</html>