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

<!-- fullcalendar ref -->
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.css' />
<%-- <script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/jquery.min.js'></script> --%>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/moment.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lang/ko.js'></script>

<!-- summernote -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

<!-- jscolor -->
<script src="${pageContext.request.contextPath}/resources/jscolor.js"></script>

</head>

<script type="text/javascript">



var events_array = [];

$(document).ready(function() {
	
	var arr = eval('${list}');
	console.log(arr);
	events_array = arr;
	
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
					        allDay: list[i].allDay,
					        textColor: '#FFF'
					    }]);
						
					} //for end
			  }
		})//ajax end
	}else{
		for(var i = 0 ; i < temp.length; i++){
			$('#calendar').fullCalendar('removeEvents', temp[i])
			console.log(temp[i])
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
        selectable: true,
        // allow "more" link when too many events
        eventLimit: true,
        navLinks: true,
        // Make events editable, globally
        editable: true,
        resizeable: false,
        //defaultView: 'listWeek',
        
      //Drop =================================
        eventDrop: function(event, delta, revertFunc) {
        	
        	
        	console.log(event.member_id)
        		if (event.member_id == ${sessionScope.member.member_id} || (${sessionScope.member.member_status == 9}&& event.member_id == 99999)) {
        			
        			if(confirm("정말 변경하시겠습니까?")){
                      
        				
        				var allDayCheck = 0;
        				if(event.allDay){
        					allDayCheck = 1;
        				}
        				
        	        	var cateNum = 0;
        	        	var cate_name;
        		        //console.log(typeof(event.calendar_cate));
        		        //console.log(event.calendar_cate);
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
                      	
                      	
                      	console.log(st)
                      	console.log(en)
                      	console.log(stitle)
                      	console.log(scontent)
                      	console.log(calCate)
                      	console.log(cateSelf)
                      	console.log(colorFix)
                      	console.log(calId)
        				
/*     			    	id: obj.calendar_id+"",
						//username: obj.calendar_member_id+"",
						title: obj.title+"",
						content: obj.content+"",
						start: moment(obj.start).format(),
						end: moment(obj.end).format(),
						color: obj.color,
						calendar_cate: obj.calendar_cateSelf,
			        allDay: true */
        				
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
    		        //console.log(typeof(event.calendar_cate));
    		        //console.log(event.calendar_cate);
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
    				
/*     			    	id: obj.calendar_id+"",
					//username: obj.calendar_member_id+"",
					title: obj.title+"",
					content: obj.content+"",
					start: moment(obj.start).format(),
					end: moment(obj.end).format(),
					color: obj.color,
					calendar_cate: obj.calendar_cateSelf,
		        allDay: true */
    				
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
        /*select: function(start, end, jsEvent, view) {
          alert(start.format("MM/DD/YYYY hh:mm a") + " to " + end.format("MM/DD/YYYY h\
          h:mm a") + " in view " + view.name);
        },*/
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
        	
        	

        	/* 
    		if (event.username == username || chief == username) {
    			
    			
    			// Ask for a title. If empty it will default to "New event"
    	          var newTitle = prompt("변경할 제목을 입력해 주세요", event.title);
    	          // If did not pressed Cancel button
    	          if (newTitle != null) {
    	            // Update event
    	            event.title = newTitle.trim() != "" ? newTitle : event.title;
    	            
    	              var data = {
    	            		  calnum: event.calnum,
    	                      title: event.title,
    	                      start: event.start,
    	                      end: event.end
    	                    };
    	            
    	            $.ajax({
    	                type: 'GET',
    	                url: "./modifyEvent.do",
    	                data: {
    	                  "event": JSON.stringify(data),
    	                },
    	                success: function(data) {
    						console.log(data);
    	                    // Call the "updateEvent" method
    	                    $calendar.fullCalendar("updateEvent", event);
    	                }
    	              });
    	          }else{
        		      revertFunc();
        			  return;    
    	          }
    			
    	    }else{
    			  alert("본인의 이벤트만 변경할 수 있습니다.");
    		      revertFunc();
    			  return;    
    	    } */
    	
    	    

        	
        }, // End callback eventClick
        events: events_array
      } //End of options
    
  );// calendar end
  
	})//ready end
  

  
  
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
		  
		var cl = ${cateList};
		
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
	  
	  //=================================================================================================================
	  
	  
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
		 // console.log(allDay);
		  
		 var cateSelf;
		 
		  if(calCate == 0 && selfInput.trim() == ''){
			  alert('일정 구분을 입력해주세요');
			  return;
		  }else if(calCate == 0){
			  cateSelf = selfInput.trim();
			  colorFix = $('#modcolorFix').val();
		  }else {
			  
			var cl = ${cateList};
			
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
	      	// +"&calendar_member_id=${ sessionScope.id }"
	      	
	      	console.log(param);
	      	
	        $.ajax({
	          type: 'POST',
	          url: "${pageContext.request.contextPath}/calendar/modiEvent", 	
	          data: param,
	          success: function(data) {
	        	  if(data != null){
	        	  
	        		  var obj = JSON.parse(data);
	        		  console.log(obj);
/* 	        		  if(obj.allDay == 1){
	        			  
	        		  console.log(obj.end)
	        		  obj.end = moment(obj.end).subtract(1, 'days').format('YYYY-MM-DD');
	        		  console.log(obj.end)
	        		  
	        		  } */
	        		  
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
	            //$('#modallDay').prop('checked',false);
	            $('#modstart_time').removeAttr('disabled');
				$('#modend_time').removeAttr('disabled');
	            
	        	  }else{
	        		  alert('오류가 발생하였습니다.');
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
		  
		  
	  }// modiftCal end
	  
	  
	  
	  
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
						calendar_cate: obj.calendar_cate,
						textColor: '#FFF'
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
						calendar_cate: obj.calendar_cateSelf,
						textColor: '#FFF'
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
			        allDay: true,
			        textColor: '#FFF'
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
			        allDay: true,
			        textColor: '#FFF'
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
<div class="container">
	<div class="container-fluid text-center">

		<!-- 게시글 -->
 	<div class="col-lg-12">
 		
              <div class="card" >
                <div class="card-header py-3">
                  <h4 class="m-0 font-weight-bold text-primary"><strong><c:choose>
				<c:when test="${ who != 99999 }">
					<h4>내일정 관리</h4>
				</c:when>
				<c:otherwise>
					<h4>회사일정 관리</h4>
				</c:otherwise>
			</c:choose></strong></h4><div align="right"><c:if test="${ who != 99999 }">	
				<div>
					<input id="campCal" type="checkbox" value="campCal" onchange="chk()">회사일정 같이보기
				</div>
				</c:if>
				</div>
                </div>
                <div class="card-body text-center">
                  
                  <hr>
                  <div id="calendar"></div>
                 
                
			
                </div>
              </div>
			
            </div>
            </div></div>

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
										
											<!-- <label class=" control-label " style="padding-left: 20px;">색상</label>
											<div class="col-3">
												<input name="color2" type="hidden" id="color_value" value="99cc00">
	       		 								<button class="jscolor {valueElement: 'color_value'}">Pick a color</button>
											</div>
											<input class="jscolor" value="ab2567" id="colorTexto" name="colorTexto"> -->
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
										
											<!-- <label class=" control-label " style="padding-left: 20px;">색상</label>
											<div class="col-3">
												<input name="color2" type="hidden" id="color_value" value="99cc00">
	       		 								<button class="jscolor {valueElement: 'color_value'}">Pick a color</button>
											</div>
											<input class="jscolor" value="ab2567" id="colorTexto" name="colorTexto"> -->
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
	
	
	

</body>

</html>