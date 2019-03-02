<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* 미결재 알림 */
$.ajax({
	type:'POST',
	url: '${ pageContext.request.contextPath }/approval/notAuthApvCount',
	success: function(data){
		//console.log(data);
		$('#apvCount2').text(data);
	}
})
$.ajax({
	type:'POST',
	url: '${ pageContext.request.contextPath }/approval/notAuthApvCount',
	success: function(data){
		//console.log(data);
		$('#apvCount3').text(data);
	}
})
</script>
</head>
<body>
<input type="hidden" id="header_member_id" value="${sessionScope.member.member_id}"/>
 <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" style="margin-bottom:0rem !important;">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
          
			<div><a href="${pageContext.request.contextPath}/member/main"><img id="file_img" src="${pageContext.request.contextPath}/resources/img/logooo.png" alt="사진"  height="60px"></a></div>


          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- 미결재 알람 -->
                <span class="badge badge-danger badge-counter"><span id="apvCount2"></span></span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  미결재 알림
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">미결제 알람</div>
                    <span class="font-weight-bold">미결제 문서가(<strong id="apvCount3"></strong>)건 있습니다.<br>확인해주세요! </span>
                  </div>
                </a>
                
                <a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/approval/notAuthApvList?page=1">문서함으로 가기</a>
              </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter"> <span id="header_email_count">0</span> <!-- 숫자가 들어갈 공간 -->  </span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  새로운 메일
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                   <div class="icon-circle bg-warning">
                <i class="far fa-envelope"></i>
                   
 </div>
                    
                  </div>
               
                  <div class="font-weight-bold">
                  <div class="small text-gray-500">확인하지 않은 메일</div>
                    <div class="text-truncate">미확인 메일이 (<span id="header_email_count2">0</span>)건 있습니다. <br> 확인해주세요!</div>
                    
                  </div>
                </a>
                
                <a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/email/receive">받은 메일함으로 가기</a>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.member.member_name}님</span>
                
               <!--  <img class="img-profile rounded-circle"> -->
                <i class="fas fa-user"></i>
              </a>
              
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/myinfo">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  내 정보
                </a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/editPw?type=0">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  정보 변경
                </a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/myboard?member_name=${sessionScope.member.member_name}">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  내 게시글
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  로그아웃
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- 상단바 끝 -->
        
  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃하시겠습니까?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">로그아웃을 누르시면 현재 세션을 벗어나 로그인 창으로 이동합니다.</div>
        <div class="modal-footer">
          <button class="btn btn-outline-primary" type="button" data-dismiss="modal">돌아가기</button>
          <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
        </div>
      </div>
    </div>
  </div>        
</body>
</html>