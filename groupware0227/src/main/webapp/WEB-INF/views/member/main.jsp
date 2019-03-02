<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>KITWARE-BETA</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
 <style>
/*   .container-fluid {
  padding-top: 2rem;
} */
</style>
</head>

<body id="page-top">

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">KITWARE</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> 출근확인</a>
            
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">새로운 일정</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">2</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">결재대기중 문서</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">5</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">출석현황</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                        </div>
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">게시판의 글 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">155</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">게시판 메뉴:</div>
                      <a class="dropdown-item" href="#">공지사항으로</a>
                      <a class="dropdown-item" href="${pageContext.request.contextPath}/boardList">자유게시판으로</a>
                    
                    </div>
                  </div>
                </div>
                
                <!-- fullcalendar ref -->
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.css' />
<%-- <script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/jquery.min.js'></script> --%>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/moment.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lang/ko.js'></script> 
                
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-area">
                   		<!-- ======================================================================================================================================================================메인캘린더 -->
                   		
                   		
                   		<!-- The calendar container -->
						<div id="calendar"></div>
                   		
                   		
                   		<!-- ======================================================================================================================================================================메인캘린더 -->
                  </div>
                </div>
              </div>
            </div>
            
       		<!-- ======================================================================================================================================================================메인캘린더 -->

			<script type="text/javascript">
			
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
				
			})
			</script>

       		<!-- ======================================================================================================================================================================메인캘린더 -->
            

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">완료한 프로젝트</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">차트 메뉴:</div>
                      <a class="dropdown-item" href="#">자세히 알아보기</a>
                      <a class="dropdown-item" href="#">다른 정보 보기</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">그외 차트</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="myPieChart"></canvas>
                  </div>
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> 그룹웨어 관련
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> 소셜미디어 관련
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> 쇼핑몰 관련
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            <div class="col-lg-6 mb-4">

              <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">프로젝트 진행 계획</h6>
                </div>
                <div class="card-body">
                  <h4 class="small font-weight-bold">주제선정, 요구분석 <span class="float-right">15%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 15%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">상세 디자인 <span class="float-right">25%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-warning" role="progressbar" style="width: 25%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">기능 구현 <span class="float-right">70%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar" role="progressbar" style="width: 70%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">CSS설정 <span class="float-right">90%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-info" role="progressbar" style="width: 90%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">발표 <span class="float-right">3/4</span></h4>
                  <div class="progress">
                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>


            </div>

            <div class="col-lg-6 mb-4">

              <!-- Illustrations -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">무언가 들어갈 곳.</h6>
                </div>
                <div class="card-body">
                  <div class="text-center">
                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="img/undraw_posting_photo.svg" alt="">
                  </div>
                  <p>이곳의 링크를 타고 그룹웨어 내 홈페이지로 빠른 링크, 넣을 만한 여러가지 기능들이 있습니다.!</p>
                  <a target="_blank" rel="nofollow" href="https://undraw.co/">나는 링크입니다. &rarr;</a>
                </div>
              </div>

              <!-- Approach -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">항목을 추가 할 곳</h6>
                </div>
                <div class="card-body">
                  <p>이곳은 항목이 들어갈곳입니다</p>
                  <p class="mb-0">이것은 두번째 문단입니다.</p>
                </div>
              </div>

            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->



  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃하시겠습니다?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">로그아웃을 누르시면 현재 세션을 벗어나 로그인 창으로 이동합니다.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">돌아가기</button>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>

</body>

</html>
