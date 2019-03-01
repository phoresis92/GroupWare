<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script>

$(document).ready(function(){
	
	$('#word').focus();
	
	if(${ map['cate1'] == null }){
		$('#cate1').attr('checked',false);
	}else{
		$('#cate1').attr('checked',true);
	}
	if(${ map['cate2'] == null }){
		$('#cate2').attr('checked',false);
	}else{
		$('#cate2').attr('checked',true);
	}
	if(${ map['cate3'] == null }){
		$('#cate3').attr('checked',false);
	}else{
		$('#cate3').attr('checked',true);
	}
	if(${ map['condition'] != null }){
		$('#condition').val("${ map['condition'] }");
	}
	
	$('#word').val("${ map['word'] }");
	
	
	var arr = $('input[name=length]');
	
	for(var i in arr){
		if(arr[i].value == "${ map['length'] }"){
			arr[i].setAttribute('checked','checked');
		}
	}
	
	
})


function detail(j){
	
	console.log(j)
	
	$('<form></form>').attr('action',"${pageContext.request.contextPath}/approval/myApvDetail").attr('method', 'POST').attr('id','detail').appendTo('#body');
	$('<input></input>').attr('type','hidden').attr('value',j).attr('name','approval_id').appendTo('#detail');
	$('<input></input>').attr('type','hidden').attr('value', ${ auth }).attr('name','auth').appendTo('#detail');
	$('#detail').submit();
	
}

function search(){
	
	var param = "";
	
	console.log($('input[name=length]:checked').val());
	param += "length="+$('input[name=length]:checked').val();
	$('<input></input>').attr('type','hidden').attr('name','length').attr('value',$('input[name=length]:checked').val()).appendTo('#goSearch')
	/* console.log($("input:checkbox[name='cate1']:checked").val());
	console.log($("input:checkbox[name='cate1']:checked").val());
	console.log($("input:checkbox[name='cate1']:checked").val()); */
	if($('#cate1').is(':checked')){
		console.log($('#cate1').val());
		param += "&cate1="+$('#cate1').val();
		$('<input></input>').attr('type','hidden').attr('name','cate1').attr('value',$('#cate1').val()).appendTo('#goSearch')
	}
	if($('#cate2').is(':checked')){
		console.log($('#cate2').val());
		param += "&cate2="+$('#cate2').val();
		$('<input></input>').attr('type','hidden').attr('name','cate2').attr('value',$('#cate2').val()).appendTo('#goSearch')
	}
	if($('#cate3').is(':checked')){
		console.log($('#cate3').val());
		param += "&cate3="+$('#cate3').val();
		$('<input></input>').attr('type','hidden').attr('name','cate3').attr('value',$('#cate3').val()).appendTo('#goSearch')
	}
	
	console.log($('#condition').val())
	param += "&condition="+$('#condition').val();
	$('<input></input>').attr('type','hidden').attr('name','condition').attr('value',$('#condition').val()).appendTo('#goSearch')

	console.log($('#word').val());
	 param += "&word="+$('#word').val();
	$('<input></input>').attr('type','hidden').attr('name','word').attr('value',$('#word').val()).appendTo('#goSearch')

	$('<input></input>').attr('type','hidden').attr('name','page').attr('value',1).appendTo('#goSearch')

	$('<input></input>').attr('type','hidden').attr('name','toSearch').attr('value','${ toSearch }').appendTo('#goSearch')
	
	
	
	$('#goSearch').submit();
	
	/*$.ajax({
        type: 'POST',
        url: "${pageContext.request.contextPath}/apvList/search",
        data: param,
        success: function(data) {
        	var json = JSON.parse(data);
			console.log(json);
            
            return;
        }
      }); */
	
}//search end

function resetSc(){
	$('<input></input>').attr('type','hidden').attr('name','length').attr('value', null).appendTo('#goSearch')
	$('<input></input>').attr('type','hidden').attr('name','cate1').attr('value',null).appendTo('#goSearch')
	$('<input></input>').attr('type','hidden').attr('name','cate2').attr('value',null).appendTo('#goSearch')
	$('<input></input>').attr('type','hidden').attr('name','cate3').attr('value',null).appendTo('#goSearch')
	$('<input></input>').attr('type','hidden').attr('name','condition').attr('value','writer').appendTo('#goSearch')
	$('<input></input>').attr('type','hidden').attr('name','word').attr('value',null).appendTo('#goSearch')
	$('<input></input>').attr('type','hidden').attr('name','page').attr('value',1).appendTo('#goSearch')
	$('<input></input>').attr('type','hidden').attr('name','toSearch').attr('value','${ toSearch }').appendTo('#goSearch')
	
	$('#goSearch').submit();
}//resetSc end

$(function(){
	  $('#word').keypress(function(e) {
	    if(e.which == 13) {
	      $(this).blur();
	      $('#search').focus().click();
	      $('#word').focus();
	    }
	  });
});

</script>

</head>
<body id="body">

	<form id="goSearch" method="POST" action="${ pageContext.request.contextPath }/apvList/search"></form>
		<input type="checkbox" id="cate1" value="1" > 일반결제문서
		<input type="checkbox" id="cate2" value="2" > 휴가결제문서 
		<input type="checkbox" id="cate3" value="3" > 지출결제문서 <br>
		<input type="radio" name="length" value="all" checked="checked"> 전체 
		<input type="radio" name="length" value="today" > 당일
		<input type="radio" name="length" value="week" > 1주일
		<input type="radio" name="length" value="month" > 1개월
		<input type="radio" name="length" value="three" > 3개월
		<input type="radio" name="length" value="half" > 6개월 <br>
		
		<select id="condition">
			<option value="writer">제출자</option>
			<option value="title">제목</option>
			<option value="apvNum">문서번호</option>
		</select>
		<input id="word" type="text" placeholder="검색어 입력">

	<button id="search" onclick="search()">검색</button>
	<button onclick="resetSc()">검색 초기화</button>
	
	
	
	<table>
	
	<tr>
	<th>문서번호</th>
	<th>작성자</th>
	<th>제목</th>
	<th>문서분류</th>
	<th>상태</th>
	<th>제출일</th>
	</tr>
	
	<c:if test="${ pageInfo.totalCount != 0 }">
	<c:forEach var="item" items="${ apvList }" begin="${ pageInfo.startNum }" end="${ pageInfo.endNum }">
	
		<tr onclick="detail(${item.approval_id})" style="cursor: pointer;">
			<td>${ item.approval_id }</td>
			<td>${ item.member_name } <c:choose><c:when test="${ not empty item.rank_name }">${ item.rank_name }</c:when><c:otherwise>입사대기</c:otherwise></c:choose></td>
			<td><a >${ item.approval_title }</a></td>
			<td>${ item.apv_cate_name }</td>
			
			<c:choose>
			
				<c:when test="${ empty item.member_name3 || item.approval_auth3 == 3 || item.approval_auth3 == 4 }">
					<c:choose>
						<c:when test="${ empty item.member_name2 || item.approval_auth2 == 3 || item.approval_auth2 == 4}">
							<td>${ item.apv_auth_name1 }</td>
						</c:when>
						<c:when test="${ item.approval_auth2 == 0 && item.approval_auth1 == 0 }">
							<td>${ item.apv_auth_name1 }</td>
						</c:when>						
						<c:when test="${ item.approval_auth2 == 4 }">
							<td>${ item.apv_auth_name1 }</td>
						</c:when>
						<c:otherwise>
							<td>${ item.apv_auth_name2 }</td>
						</c:otherwise>
					</c:choose>
				</c:when>
				
				<c:when test="${ item.approval_auth2 == 0 }">
					<td>${ item.apv_auth_name1 }</td>
				</c:when>
				<c:when test="${ item.approval_auth2 == 3 && item.approval_auth1 == 0 }">
					<td>${ item.apv_auth_name1 }</td>
				</c:when>
				<c:otherwise>
					<td>${ item.apv_auth_name3 }</td>
				</c:otherwise>
			
			</c:choose>
			
			<td><fmt:formatDate value="${ item.approval_indate }"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	
	</c:forEach>
	</c:if>
	
	</table>
	
	<div>
			
			<ul class="pagination justify-content-center">
			
				<c:choose>
					<c:when test="${ pageInfo.page eq 1 }">
					
					<li class="page-item disabled"><a class="page-link" href="#">1</a></li>
					
					</c:when>
					
					<c:when test="${ pageInfo.page eq 0 }">
					
					<li class="page-item disabled"><a class="page-link" href="#">1</a></li>
					
					</c:when>
				
					<c:otherwise>
					
					<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=1">1</a></li>
					
					</c:otherwise>
				</c:choose>
			
			
				<c:choose>
					<c:when test="${ pageInfo.page <= 1 }">
										
					<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
					
					</c:when>
					
					<c:otherwise>
					
					<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=${ pageInfo.page -1 }">이전</a></li>
					
					</c:otherwise>
					
				</c:choose>
			
			
				<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
				
					<c:choose>
					<c:when test="${i eq pageInfo.page }">
					
					<li class="page-item active"><a class="page-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=${ i }">${ i }</a></li>
					
					</c:when>
					
					<c:otherwise>
					
					<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=${ i }">${ i }</a></li>
					
					</c:otherwise>
					
					</c:choose>
				</c:forEach>
			
			
			
			
				<c:choose>
				
					<c:when test="${ pageInfo.page >= pageInfo.totalPage }">
					
					<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
					
					</c:when>
					
					<c:otherwise>
					
					<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=${ pageInfo.page +1 }">다음</a></li>
	
					</c:otherwise>
				
				</c:choose>
				
			


				
				<c:choose>
				
					<c:when test="${ pageInfo.page eq pageInfo.totalPage }">
					
					<li class="page-item disabled"><a class="page-link" href="#">${ pageInfo.totalPage }</a></li>
					
					</c:when>
					
					<c:otherwise>
					
					<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=${ pageInfo.totalPage }">${ pageInfo.totalPage }</a></li>
					
					</c:otherwise>
					
				</c:choose>
				
			</ul> <!-- Paging end -->


			</div>


	
<!-- 	approval_id number auto_increment primary key,
approval_cate number(3) not null,
approval_member_id number(20) not null,
approval_mem1 number(20),
approval_mem2 number(20),
approval_mem3 number(20),
approval_auth1 number(1),
approval_auth2 number(1),
approval_auth3 number(1),
approval_title varchar2(500) not null,
approval_content varchar2(5000) not null,
approval_filepath varchar2(1000),
approval_filename varchar2(1000),
approval_return varchar2(1000),
approval_indate date default sysdate,
approval_enddate date,
approval_cc varchar2(1000),
 -->
 
 
 
 
 
 
                 <!-- fullcalendar ref -->
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.css' />
<%-- <script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/jquery.min.js'></script> --%>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/moment.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lang/ko.js'></script> 

<!-- summernote -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>


       		<!-- ======================================================================================================================================================================메인캘린더 -->

			<script type="text/javascript">
			
			var events_array = [];
			var temp = []; 
			var cl;
			
			$.ajax({
                type: 'POST',
                async : false,
                url: "${pageContext.request.contextPath}/calendar/getCateList",
                success: function(data) {
  					var json = JSON.parse(data);
  					
                    cl = json;
                    
                }
              });
			
			console.log(cl);
			
			$(document).ready(function(){
				
				  $('#summernote').summernote({
					  lang: 'ko-KR',
				      height: 200,
				      popover: {
				    	  image:[],
				    	  link:[],
				    	  air:[]
				      },
				      toolbar: [
				    	    // [groupName, [list of button]]
				    	    ['style', ['bold', 'italic', 'underline', 'clear']],
				    	    ['font', ['strikethrough', 'superscript', 'subscript']],
				    	    ['fontsize', ['fontsize']],
				    	    ['color', ['color']],
				    	    ['para', ['ul', 'ol', 'paragraph']],
				    	    ['height', ['height']]
				    	  ]
				  });
				  
				  $('#modsummernote').summernote({
					  lang: 'ko-KR',
				      height: 200,
				      popover: {
				    	  image:[],
				    	  link:[],
				    	  air:[]
				      },
				      toolbar: [
				    	    // [groupName, [list of button]]
				    	    ['style', ['bold', 'italic', 'underline', 'clear']],
				    	    ['font', ['strikethrough', 'superscript', 'subscript']],
				    	    ['fontsize', ['fontsize']],
				    	    ['color', ['color']],
				    	    ['para', ['ul', 'ol', 'paragraph']],
				    	    ['height', ['height']]
				    	  ]
				  });
				
				 // We will refer to $calendar in future code
			    var $calendar = $("#calendar").fullCalendar({ //start of options
			        //weekends : false, // do not show saturday/sunday
			        header: {
			          left: 'prevYear,nextYear',
			          center: 'title',
			          right: 'listWeek,today,month,agendaDay,agendaWeek prev,next'
			        },
			        // Make possible to respond to clicks and selections
			        selectable: true,
			        // allow "more" link when too many events
			        eventLimit: true,
			        navLinks: true,
			        // Make events editable, globally
			        editable: true,
			        resizeable: false,
			        defaultView: 'listWeek',
			        
			      //Drop =================================
			        eventDrop: function(event, delta, revertFunc) {
			        	
			        	
			        		if (event.member_id == ${sessionScope.member.member_id} || (${sessionScope.member.member_status == 9}&& event.member_id == 99999)) {
			        			
			        			if(confirm("정말 변경하시겠습니까?")){
			                      
			        				
			        				var allDayCheck = 0;
			        				if(event.allDay){
			        					allDayCheck = 1;
			        				}
			        				
			        	        	var cateNum = 0;
			        	        	var cate_name;
			        		        if(typeof(event.calendar_cate) == 'string'){
			        		        	cate_name = event.calendar_cate;
			        		        }else{
			        		        	cateNum = parseInt(event.calendar_cate);
			        		        }
			        				
			        				var st = moment(event.start).format('YYYY-MM-DD hh:mm:ss');
			        				var en = moment(event.end).format('YYYY-MM-DD hh:mm:ss');
			        				var stitle = event.title;
			        				var scontent = event.content;
			        				var calCate = cateNum;
			                      	var cateSelf = cate_name;
			                      	var colorFix = event.color;
			                      	var calId = event.id;
			                      	
			        				
			          		    var param = "calendar_start="+st+"&calendar_end="+en+"&calendar_title="+stitle.trim()+"&calendar_content="+scontent+"&calendar_cate="+calCate+"&calendar_allDay="+allDayCheck+"&calendar_cateSelf="+cateSelf+"&calendar_color="+colorFix+"&calendar_id="+calId+"&calendar_member_id=${ who }";
			        	      	
			                      $.ajax({
			                          type: 'POST',
			                          url: "${pageContext.request.contextPath}/calendar/modiEvent",
			                          data: param,
			                          success: function(data) {
			            					console.log(data);
			                              // Call the "updateEvent" method
			                              $calendar.fullCalendar("updateEvent", event);
			                              
			                              return;
			                          }
			                        });
			        			}else{
			            		      revertFunc();
			            			  return;   
			                    }
			                      
			                    
			        	    }else{
			        	    	
			        			  //alert("본인의 이벤트만 변경할 수 있습니다.")
			        		      revertFunc();
			        			  return;        	    	
			        	    	
			        	    }
			        },
			        
			        eventResize: function(event, delta, revertFunc) {
			        	
			        
			        	console.log(event.member_id)
			    		if (event.member_id == ${sessionScope.member.member_id} || (${sessionScope.member.member_status == 9}&& event.member_id == 99999)) {
			    			
			    			if(confirm("정말 변경하시겠습니까?")){
			                  
			    				
			    				var allDayCheck = 0;
			    				if(event.allDay){
			    					allDayCheck = 1;
			    				}
			    				
			    	        	var cateNum = 0;
			    	        	var cate_name;
			    		        if(typeof(event.calendar_cate) == 'string'){
			    		        	cate_name = event.calendar_cate;
			    		        }else{
			    		        	cateNum = parseInt(event.calendar_cate);
			    		        }
			    				
			    				var st = moment(event.start).format('YYYY-MM-DD hh:mm:ss');
			    				var en = moment(event.end).format('YYYY-MM-DD hh:mm:ss');
			    				var stitle = event.title;
			    				var scontent = event.content;
			    				var calCate = cateNum;
			                  	var cateSelf = cate_name;
			                  	var colorFix = event.color;
			                  	var calId = event.id;
			    				
			      		    var param = "calendar_start="+st+"&calendar_end="+en+"&calendar_title="+stitle.trim()+"&calendar_content="+scontent+"&calendar_cate="+calCate+"&calendar_allDay="+allDayCheck+"&calendar_cateSelf="+cateSelf+"&calendar_color="+colorFix+"&calendar_id="+calId+"&calendar_member_id=${ who }";
			    	      	// +"&calendar_member_id=${ sessionScope.id }"
			    	      	console.log(param);
			    	      	
			                  $.ajax({
			                      type: 'POST',
			                      url: "${pageContext.request.contextPath}/calendar/modiEvent",
			                      data: param,
			                      success: function(data) {
			        					console.log(data);
			                          // Call the "updateEvent" method
			                          $calendar.fullCalendar("updateEvent", event);
			                          
			                          return;
			                      }
			                    });
			    			}else{
			        		      revertFunc();
			        			  return;   
			                }
			                  
			                
			    	    }else{
			    	    	
			    			  //alert("본인의 이벤트만 변경할 수 있습니다.")
			    		      revertFunc();
			    			  return;        	    	
			    	    	
			    	    }
			        },
			        //This is the callback that will be triggered when a selection is made
			        eventRender: function(event, element, view) {
			              },
			        select: function(start, end, jsEvent, view) {
			          // Ask for a title. If empty it will default to "New event"
			         
			          $('#start_date').val(moment(start).format('YYYY-MM-DD'));
			          $('#start_time').val(moment("2013-02-08 09:30 ").format('hh:mm:ss'));
			          $('#end_date').val(moment(end).subtract(1, 'days').format('YYYY-MM-DD'));
			          $('#end_time').val(moment(end).format('hh:mm:ss'));
			          
			          $("#myModal").modal();
			 
			        }, // End select callback
			        // Callback triggered when we click on an event
			        eventClick: function(event, jsEvent, view) {
			        	console.log(event.member_id)
			        	if(event.member_id == 99999 && ${sessionScope.member.member_status != 9}){
			        		return;
			        	}
			        	
			        	
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
				        	
				        if(typeof(event.calendar_cate) == 'string'){
				        	cate_name = event.calendar_cate;
				        }else{
				        	cateNum = parseInt(event.calendar_cate);
				        }
				        	
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
			        events: events_array
			      } //End of options
			    
			  );// calendar end
				
				
				var member_id = '${sessionScope.member.member_id}';
				$.ajax({
					  type: 'POST',
					  url: "${pageContext.request.contextPath}/calendar/getCalList",
					  data: "member_id="+member_id,
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
								
								//console.log(list[i].id)
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
				
			}) //ready end
			
			
			  function registBtn(){
				  
				  var stitle = $('#sname').val();
				  var scontent = $('#summernote').val();
				  
				  var start = $('#start_date').val();
				  var end = $('#end_date').val();
				  var start_time = $('#start_time').val();
				  var end_time = $('#end_time').val();

				  var calCate = $('#calCate').val();
				  var selfInput =$('#selfInput').val();
				  
				  var allDay = $('#allDay').is(":checked");
				  var colorFix;
				 // console.log(allDay);
				  
				 var cateSelf;
				 
				  if(calCate == 0 && selfInput.trim() == ''){
					  alert('일정 구분을 입력해주세요');
					  return;
				  }else if(calCate == 0){
					  cateSelf = selfInput.trim();
					  colorFix = $('#colorFix').val();
				  }else {
					  
					
					for(var i in cl){
						if(cl[i].cal_cate_id == calCate){
							colorFix = cl[i].cal_cate_color;
						}
					}

				  }
				  
					  
							console.log(colorFix);
			      	
				  
				  if(stitle.trim() == ''){
					  alert('제목을 다시 입력해 주세요');
					  $('#sname').val('');
					  return;
				  }
			      
				  
			      if (stitle != '' && scontent != '' && start != null && end != null) {
			    	  
			    	var st;
			    	var en;
					
			    	
			      	
			      	if(!allDay && st >= en){
			    		alert("종료 일이 시작일 보다 빠를 수 없습니다.");
			    		return;
			      	}
					
			      	
			      	var allDayCheck = 0;
			      	if(allDay){
			      		st = start;
			      		en = moment(end).add(1, 'days').format('YYYY-MM-DD');
			      		allDayCheck = 1;
			      	}else{
				      	st = start+" "+start_time;
				      	en = end+" "+end_time;
				      	allDayCheck = 0;
			      	}
			      	
				    var param = "calendar_start="+st+"&calendar_end="+en+"&calendar_title="+stitle.trim()+"&calendar_content="+scontent+"&calendar_cate="+calCate+"&calendar_allDay="+allDayCheck+"&calendar_cateSelf="+cateSelf+"&calendar_color="+colorFix+"&calendar_member_id=${ who }";
			      	// +"&calendar_member_id=${ sessionScope.member.member_id }"
			      	console.log(param);
			      	
			        $.ajax({
			          type: 'POST',
			          url: "${pageContext.request.contextPath}/calendar/addEvent",
			          data: param,
			          success: function(data) {
			        	  if(data != null){
			        	  
			        		  obj = JSON.parse(data);
			        		  console.log(obj);
			        		  
			        		  var event = printCal(obj);
			        		  
			            $('#calendar').fullCalendar("renderEvent", event, true);
			            
			            
			            $("#myModal").modal('hide');
			            $('#sname').val('');
			            $('#selfInput').val('');
			            $('#summernote').summernote('reset');
			            $('#firstNode').removeAttr('selected');
			            $('#firstNode').attr('selected','selected');
			            $('#selfCate').css('display','none');
			            $('#allDay').prop('checked',false);
			            $('#start_time').removeAttr('disabled');
						$('#end_time').removeAttr('disabled');
			            
			        	  }else{
			        		  alert('일정 등록 오류가 발생하였습니다.');
			        		  return;
			        	  }
			          } // success end
			        }); // ajax end
			        // Push event into fullCalendar's array of events
			        // and displays it. The last argument is the
			        // "stick" value. If set to true the event
			        // will "stick" even after you move to other
			        // year, month, day or week.
			      }else{
			    	  alert('일정을 입력해주세요');
			    	  return;
			      };
			      // Whatever happens, unselect selection
			      //$calendar.fullCalendar("unselect");
				  
			  }// registBtn end
			  
			  
			  $(document).on("click", "#deleteBtn", function() {
				  
				  var pid = $("#pid").val();
				  var nPid = parseInt(pid);
				  console.log(typeof(pid))
				  console.log(typeof(nPid))
				  
				  if(confirm('정말 삭제하시겠습니까?')){
					  
					var param = "pId="+pid;
					$.ajax({
			              type: 'POST',
			              url: "${pageContext.request.contextPath}/calendar/removeCal",
			              data: param,
			              success: function(data) {
			            	console.log(data);
			            	  	
			            	  	$('#calendar').fullCalendar('removeEvents', data);
			            	  	
			            		$("#dayModal").modal("hide");	
			            }// success end
					});// ajax
					  
				  }else{
					  return;
				  }//remove? end
				  
			  });// delBtn end
			
			
			function printCal(obj){
				  if(obj.allDay == 0){
					  if(obj.calendar_cate != 0){
							var event = {
									id: obj.id+"",
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
									id: obj.id+"",
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
						    	id: obj.id+"",
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
						    	id: obj.id+"",
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
			
			  function modifyBtn(){
				  
				  
			      	
					var title = $("#psubject").text();
			      	var content = $("#pcontent").html();

			      	var endDate = moment($('#pend').text()).format('YYYY-MM-DD');
			      	var endTime = moment($('#pend').text()).format('hh:mm:ss');
			      	
			      	var startDate = moment($('#pstart').text()).format('YYYY-MM-DD');
			      	var startTime = moment($('#pstart').text()).format('hh:mm:ss');

			      	var cate_name = $('#pselect').text()
			      	var cateNum = $("#cate_num").val();
			      	var color = $('#colorProp').val();
			      	var calId = $("#pid").val();
			      	
			      	var isallDay = $('#isallDay').val();
			      	
			      	//console.log(typeof(cateNum))
			      	//console.log(cateNum)
			      	
			      	if(isallDay == 1){
			      		$('#modallDay').attr('checked',true);
			      		$('#modstart_time').attr('disabled',true);
						$('#modend_time').attr('disabled',true);
			      	}else{
			      		$('#modallDay').attr('checked',false);
			      		$('#modstart_time').attr('disabled',false);
						$('#modend_time').attr('disabled',false);
			      	}
			      	
			      	
			      	//console.log(cate_name);
			      	if(cateNum == 0){
				      	$('#modselfInput').val(cate_name);
				      	$('#modcolorFix').val(color);
				      	$('#modselfCate').css('display','block');
			      	}else{
				      	$('#modselfInput').val('');
				      	$('#modcolorFix').val('');
				      	$('#modselfCate').css('display','none');
			      	}
			      	
			      	//console.log("title"+ title, "content"+ content, "endDate"+ endDate, "startDate"+ startDate, "cateNum"+ cateNum, "color"+ color, "calId"+ calId);
			      	
			      	$('#modsname').val(title);
			      	//$('#modsummernote').val(content);
			      	 $('#modsummernote').summernote('code', content);
			      	 
			      	$('#modend_date').val(endDate);
			      	$('#modend_time').val(endTime);
			      	$('#modstart_date').val(startDate);
			      	$('#modstart_time').val(startTime);
			      	
			      	$('#modcalCate').val(cateNum);
			      	$('#calId').val(calId);
			      	
					  
					  $("#modModal").modal();
					  
				  }// modifyBtn end
			  
			  function modiftCal(){
				  
				  var calId = $('#calId').val();
				  
				  var stitle = $('#modsname').val();
				  var scontent = $('#modsummernote').val();
				  
				  var start = $('#modstart_date').val();
				  var end = $('#modend_date').val();
				  var start_time = $('#modstart_time').val();
				  var end_time = $('#modend_time').val();

				  var calCate = $('#modcalCate').val();
				  var selfInput =$('#modselfInput').val();
				  
				  var allDay = $('#modallDay').is(":checked");
				  var colorFix;
				  
				 var cateSelf;
				 
				  if(calCate == 0 && selfInput.trim() == ''){
					  alert('일정 구분을 입력해주세요');
					  return;
				  }else if(calCate == 0){
					  cateSelf = selfInput.trim();
					  colorFix = $('#modcolorFix').val();
				  }else {
					  
					
					for(var i in cl){
						if(cl[i].cal_cate_id == calCate){
							colorFix = cl[i].cal_cate_color;
						}
					}

				  }
				  
					  
							console.log(colorFix);
			      	
				  
				  if(stitle.trim() == ''){
					  alert('제목을 다시 입력해 주세요');
					  $('#sname').val('');
					  return;
				  }
			      
				  
			      if (stitle != '' && scontent != '' && start != null && end != null) {
			    	  
			    	var st;
			    	var en;
					
			    	
			      	
			      	if(!allDay && st >= en){
			    		alert("종료 일이 시작일 보다 빠를 수 없습니다.");
			    		return;
			      	}
					
			      	
			      	var allDayCheck = 0;
			      	if(allDay){
			      		st = start;
			      		en = moment(end).add(1, 'days').format('YYYY-MM-DD');
			      		//en = end;
			      		allDayCheck = 1;
			      	}else{
				      	st = start+" "+start_time;
				      	en = end+" "+end_time;
				      	allDayCheck = 0;
			      	}
				    var param = "calendar_start="+st+"&calendar_end="+en+"&calendar_title="+stitle.trim()+"&calendar_content="+scontent+"&calendar_cate="+calCate+"&calendar_allDay="+allDayCheck+"&calendar_cateSelf="+cateSelf+"&calendar_color="+colorFix+"&calendar_id="+calId+"&calendar_member_id=${ who }";
			      	
			      	console.log(param);
			      	
			        $.ajax({
			          type: 'POST',
			          url: "${pageContext.request.contextPath}/calendar/modiEvent", 	
			          data: param,
			          success: function(data) {
			        	  if(data != null){
			        	  
			        		  var obj = JSON.parse(data);
			        		  console.log(obj);
			        		  
			        		  var event = printCal(obj);
			        		  $('#calendar').fullCalendar('removeEvents', event.id);
			        		  
			        		  $('#calendar').fullCalendar("renderEvent", event, true);
			            
			            $("#modModal").modal('hide');
			            $('#modsname').val('');
			            $('#modselfInput').val('');
			            $('#modsummernote').summernote('reset');
			            $('#modfirstNode').removeAttr('selected');
			            $('#modfirstNode').attr('selected','selected');
			            $('#modselfCate').css('display','none');
			            $('#modstart_time').removeAttr('disabled');
						$('#modend_time').removeAttr('disabled');
			            
			        	  }else{
			        		  alert('오류가 발생하였습니다.');
			        		  return;
			        	  }
			          } // success end
			        }); // ajax end
			      }else{
			    	  alert('일정을 입력해주세요');
			    	  return;
			      };
				  
				  
			  }// modiftCal end
			  
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

       		<!-- ======================================================================================================================================================================메인캘린더 -->









                   		<!-- ======================================================================================================================================================================메인캘린더 -->
                   		
                   		
                   		<!-- The calendar container -->
						<div id="calendar"></div>
                   		
                   		
                   		
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
									<button type="button" class="btn btn-default" data-dismiss="modal" onclick="modifyBtn()">수정하기</button>
									<button type="button" class="btn btn-default" id="deleteBtn">삭제하기</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
									
						
					

					<!-- 스케쥴 등록 MODAL 시작 ================================================================================================================================== -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog modal-60size">

							<!-- Modal content-->
							<div class="modal-content">
							<form class="form-horizontal" role="form" id="sform" action="${root}/schedule/sadd.kitri" method="get">
								<!-- MODAL HEADER -->
								<div class="modal-header">
									<h4 class="modal-title">일정 등록하기</h4>
									<button type="button" class="close float-right" data-dismiss="modal">&times;</button>
								</div>
								
								<!-- MODAL BODY -->
								<div class="modal-body" >
									<div class="form-group row">
											<label class=" control-label " style="padding-left: 40px;">구분</label>
											<div class="col-5">
											
											<!-- spring form 태그로 select 불러오기 -->
											<%-- <form:form commandName="ScheduleDivisionDto">
												<form:select path="Scd_nm" items="${stype}" id="sselect" onchange="javascript:changeForm();"></form:select>
											</form:form> --%>
											
											<select onclick="inputTag(this.value)" id="calCate">
											<c:forEach var="item" items="${ cateList }" varStatus="stat">
											
												<c:choose>
												
													<c:when test="${ stat.first }">
													
													<option value="${ item.cal_cate_id }" id="firstNode" >${ item.cal_cate_name }</option>
													
													</c:when>
													<c:otherwise>
	
													<option value="${ item.cal_cate_id }" >${ item.cal_cate_name }</option>
													
													</c:otherwise>
												
												</c:choose>
												
											</c:forEach>
											<!-- <option value="0" onchange="showInput()">직접 입력</option> -->
											</select>
											
												<div id="selfCate" style="display: none;">
												<input type="text" id="selfInput" style="display: inline; width: 100px;">
												<input type="color" id="colorFix" onclick="console.log(this.value)" style="display: inline;">
												</div>
											
											</div>
											
											<script>
												function inputTag(i){
													if(i == 0){
														$('#selfCate').css('display', 'block');
													}else{
														$('#selfCate').css('display', 'none');
													}
												}
											</script>
										
											
										<div style="padding-left: 40px;">
											<input type="checkbox" name="aDay" id="allDay" onchange="adChBx();">하루종일
										</div>
										
										</div>
									<div class="form-group row">
										<label class=" control-label " style="padding-left: 40px;">시작날짜</label>
											<div class="col-8">
												<input type="date" name="sstart_date" id="start_date"> 
												<input type="time" name="sstart_time" id="start_time" class="st">
											</div>
										</div>
									<div class="form-group row">
										<label class=" control-label " style="padding-left: 40px;">종료날짜</label>
										<div class="col-8">
											<input type="date" name="send_date" id="end_date"> 
											<input type="time" name="send_time" id="end_time" class="st">
										</div>
									</div>
									<div class="form-group row">
										<label class=" control-label " style="padding-left: 40px;">제목</label>
										<div class="col-8">
											<input type="text" name="sname" id="sname" style="width: 300px;">
										</div>
									</div>
									<div class="form-group" id="text">
										<textarea id="summernote" name="summernote"></textarea>
									</div>
								</div>
							</form>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-default" id="registBtn" onclick="registBtn();">등록하기</button>
								</div>
							</div>

						</div>
					</div>
	
	
	
								<!-- 수정모달     ==================================================================================================================================-->
						<div class="modal fade" id="modModal" role="dialog">
						<div class="modal-dialog modal-60size">
						
							<div class="modal-content">
							<form class="form-horizontal" role="form" id="sform" action="${root}/schedule/sadd.kitri" method="get">
								<!-- MODAL HEADER -->
								<div class="modal-header">
									<h4 class="modal-title">일정 수정하기</h4>
									<button type="button" class="close float-right" data-dismiss="modal">&times;</button>
								</div>
								
								<!-- MODAL BODY -->
								<div class="modal-body" >
									<div class="form-group row">
											<label class=" control-label " style="padding-left: 40px;">구분</label>
											<div class="col-5">
											
											<select onclick="modinputTag(this.value)" id="modcalCate">
											<c:forEach var="item" items="${ cateList }" varStatus="stat">
											
												<c:choose>
												
													<c:when test="${ stat.first }">
													
													<option value="${ item.cal_cate_id }" id="modfirstNode" >${ item.cal_cate_name }</option>
													
													</c:when>
													<c:otherwise>
	
													<option value="${ item.cal_cate_id }" >${ item.cal_cate_name }</option>
													
													</c:otherwise>
												
												</c:choose>
												
											</c:forEach>
											<!-- <option value="0" onchange="showInput()">직접 입력</option> -->
											</select>
											
												<div id="modselfCate" style="display: none;">
												<input type="text" id="modselfInput" style=" width: 100px;">
												<input type="color" id="modcolorFix" onclick="console.log(this.value)" >
												</div>
											
											</div>
											
											<script>
												function modinputTag(i){
													if(i == 0){
														$('#modselfCate').css('display', 'block');
													}else{
														$('#modselfCate').css('display', 'none');
													}
												}
											</script>
										
											
										<div style="padding-left: 40px;">
											<input type="checkbox" name="aDay" id="modallDay" onchange="modadChBx();">하루종일
										</div>
										
										</div>
									<div class="form-group row">
										<label class=" control-label " style="padding-left: 40px;">시작날짜</label>
											<div class="col-8">
												<input type="date" name="sstart_date" id="modstart_date"> 
												<input type="time" name="sstart_time" id="modstart_time" class="st">
											</div>
										</div>
									<div class="form-group row">
										<label class=" control-label " style="padding-left: 40px;">종료날짜</label>
										<div class="col-8">
											<input type="date" name="send_date" id="modend_date"> 
											<input type="time" name="send_time" id="modend_time" class="st">
										</div>
									</div>
									<div class="form-group row">
										<label class=" control-label " style="padding-left: 40px;">제목</label>
										<div class="col-8">
											<input type="text" name="sname" id="modsname" style="width: 300px;">
										</div>
									</div>
									<div class="form-group" id="modtext">
										<textarea id="modsummernote" name="modsummernote"></textarea>
									</div>
								</div>
								<input type="hidden" id="calId">
							</form>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-default" id="modregistBtn" onclick="modiftCal();">수정하기</button>
								</div>
							</div>
						</div>
						</div>
                   		
                   		
                   		
                   		<!-- ======================================================================================================================================================================메인캘린더 -->
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


</body>
</html>