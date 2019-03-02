<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script>
function fn_formSubmit(){
	document.form1.submit();	
}

$.ajax({
	type:'POST',
	url: '${ pageContext.request.contextPath }/approval/notAuthApvCount',
	success: function(data){
		//console.log(data);
		$('#apvCount').text(data);
	}
})
</script>

  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>KITWARE-BETA</title>
  

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  
<%--   <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 --%>
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
  
  
</head>

<body>

  <!-- Page Wrapper -->
  <div>

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="height:100% !important;">
           <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/member/main">
        
        <div class="sidebar-brand-text mx-3">KITWARE <sup>beta</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

          <!-- Divider -->


      <!-- Nav Item - Dashboard -->
     

      <!-- Divider -->
      <hr class="sidebar-divider">
 <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/boardList?bgno=2">
          <i class="fas fa-flag"></i>
          <span>공지사항</span></a>
      </li>
            <hr class="sidebar-divider">
      
   			<!-- 전자결재 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-pen-nib"></i>
          <span>전자결재</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">결재:</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/approval">일반결재</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/apv_Vacat">근태/휴가결재</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/apv_payment">지출결재</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/approval/tempApvList?page=1">임시저장함</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">결재함:</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/approval/myApvList?page=1">내문서함</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/approval/notAuthApvList?page=1">미결재문서 (<span id="apvCount"></span>)</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/approval/yesAuthApvList?page=1">결재완료문서</a>
           
          </div>
        </div>
      </li>

      <!-- 이메일 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-envelope"></i>
          <span>전자메일</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">전자메일:</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/email/write">메일 보내기</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/email/receive">받은 메일함 (<span id="menu_email_count">0</span>)</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/email/send">보낸 메일함</a></a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/email/recycle">휴지통</a></a>
                   
          </div>
        </div>
      </li>

       <!-- 일정관리 -->
        <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/calendar">
           <i class="fas fa-calendar-alt"></i>
          <span>일정관리</span></a>
      </li>
      
      <!-- 근태관리 -->
        <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/commuting/commuting">
          <i class="fas fa-building"></i>
          <span>근태관리</span></a>
      </li>
      
            <!-- 게시판 -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/boardList">
          <i class="fas fa-comment"></i>
          <span>자유게시판</span></a>
      </li>
     

      <!-- 나눔선 -->
      <hr class="sidebar-divider">

    

    <!-- 내 정보 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsemem" aria-expanded="true" aria-controls="collapsemem">
          <!-- <i class="fas fa-fw fa-wrench"></i> -->
          <i class="fas fa-id-card"></i>
          <span>내 정보관리</span>
        </a>
        <div id="collapsemem" class="collapse" aria-labelledby="headingmem" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            
            <a class="collapse-item" href="${pageContext.request.contextPath}/member/myinfo">내 정보</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/member/editPw?type=0">비밀번호 변경</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/member/myboard?member_name=${sessionScope.member.member_name}">내 게시글</a>            
             </div>
        </div>
      </li>
      
         <!-- 나눔선 -->
      <hr class="sidebar-divider">
      
      <!-- 관리자 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <!-- <i class="fas fa-fw fa-wrench"></i> -->
          <i class="fas fa-cog"></i>
          <span>관리자</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
          
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">회원관리:</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/manager/unauthorized?page=1">가입 승인</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/manager/member?page=1">회원 관리</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/manager/commuting">사원근태 관리</a>
            
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">결재관리:</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/manager/allApvList?page=1">전체결재 리스트</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/manager/apvDelList?page=1">결재 삭제요청</a>
            
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">일정관리:</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/manager/calendar/company">회사 일정 관리</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/manager/calendar/member">사원 일정 조회</a>
            
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">인사관리:</h6>       
            <a class="collapse-item" href="${pageContext.request.contextPath}/manager/department?page=1">부서 관리</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/manager/rank?page=1">직급 관리</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">통계:</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/manager/statistics">회원통계</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/manager/statistics2">부서별 통계</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/apv_payment/statistics">지출 통계</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/commuting/statistics">근태 통계</a>
       
          </div>
        </div>
      </li>
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

    

    </ul>
    <!-- 메뉴바 종료 -->


</div>
 

</body>

</html>