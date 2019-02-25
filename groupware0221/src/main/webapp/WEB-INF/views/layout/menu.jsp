<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
$(function(){
	$("a.card-link").addClass("w3-button w3-block w3-left-align w3-border-bottom");
	$("a.card-link[data-toggle='collapse']").addClass("w3-dark-grey dropdown-toggle");
	$(".collapse a.card-link").addClass("w3-light-grey");
	$(".collapse a.card-link").removeClass("w3-dark-grey");
	$(".collapse .collapse a.card-link").removeClass("w3-light-grey");
});

$.ajax({
	type:'POST',
	url: '${ pageContext.request.contextPath }/approval/notAuthApvCount',
	success: function(data){
		//console.log(data);
		$('#apvCount').text(data);
	}
})
</script>
</head>
<body>
<a class="card-link" data-toggle="collapse" href="#collapse_approval"><i class="fas fa-pen-nib"></i> 전자결재</a>
<div id="collapse_approval" class="collapse w3-border">
	<div><a class="card-link" data-toggle="collapse" href="#collapse_approval1">결재</a></div>
    <div id="collapse_approval1" class="collapse w3-border">
	    <div><a class="card-link" href="${pageContext.request.contextPath}/approval">일반결재</a></div>
		<div><a class="card-link" href="${pageContext.request.contextPath}/apv_Vacat">휴가결재</a></div>
		<div><a class="card-link" href="${pageContext.request.contextPath}/approval/tempApvList?page=1">임시저장함</a></div>
    </div>
    
    <div><a class="card-link" data-toggle="collapse" href="#collapse_approval2">결재함</a></div>
    <div id="collapse_approval2" class="collapse w3-border">
	    <div><a class="card-link" href="${pageContext.request.contextPath}/approval/myApvList?page=1">내문서함</a></div>
		<div><a class="card-link" href="${pageContext.request.contextPath}/approval/notAuthApvList?page=1">미결재문서(<span id="apvCount"></span>)</a></div>
		<div><a class="card-link" href="${pageContext.request.contextPath}/approval/yesAuthApvList?page=1">결재완료문서</a></div>
    </div>
     
</div>

<a class="card-link" data-toggle="collapse" href="#collapse_email"><i class="fas fa-envelope"></i> 전자메일</a>
<div id="collapse_email" class="collapse w3-border">
     <div><a class="card-link" href="${pageContext.request.contextPath}/email/write">메일 보내기</a></div>
     <div><a class="card-link" href="${pageContext.request.contextPath}/email/receive">받은 메일함</a></div>
     <div><a class="card-link" href="${pageContext.request.contextPath}/email/send">보낸 메일함</a></div>
     <div><a class="card-link" href="${pageContext.request.contextPath}/email/recycle">휴지통</a></div>
</div>

<a class="card-link" data-toggle="collapse" href="#collapse_calendar"><i class="fas fa-calendar-alt"></i> 일정관리</a>
<div id="collapse_calendar" class="collapse w3-border">
     <div><a class="card-link" href="${pageContext.request.contextPath}/calendar">내일정</a></div>
</div>

<a class="card-link" data-toggle="collapse" href="#collapse2"><i class="fas fa-comment"></i> 커뮤니티</a>
<div id="collapse2" class="collapse w3-border">
     <div><a class="card-link" href="#">공지사항</a></div>
     <div><a class="card-link" href="${pageContext.request.contextPath}/board/boardList">게시판</a></div>
     <div><a class="card-link" href="#">자료실</a></div>
</div>

<a class="card-link" data-toggle="collapse" href="#collapse3"><i class="fas fa-building"></i> 근태관리</a>
<div id="collapse3" class="collapse w3-border">
     <div><a class="card-link" href="#">출결</a></div>
     <div><a class="card-link" href="#">휴가</a></div>
     <div><a class="card-link" href="#">보너스</a></div>
</div>

<a class="card-link" data-toggle="collapse" href="#collapse_member"><i class="fas fa-id-card"></i> 내정보관리</a>
<div id="collapse_member" class="collapse w3-border">
     <div><a class="card-link" href="${pageContext.request.contextPath}/member/myinfo">내 정보</a></div>
     <div><a class="card-link" href="${pageContext.request.contextPath}/member/editPw?type=0">비밀번호 변경</a></div>
     <div><a class="card-link" href="${pageContext.request.contextPath}/member/board">내 게시글</a></div>     
</div>

<c:if test="${sessionScope.member.member_status eq '9'}">
<a class="card-link" data-toggle="collapse" href="#collapse_manager"><i class="fas fa-cog"></i> 관리자</a>
<div id="collapse_manager" class="collapse w3-border">	 
     <div><a class="card-link" data-toggle="collapse" href="#collapse_manager_member">회원 관리</a></div>
    	 <div id="collapse_manager_member" class="collapse w3-border">
    	 	<div><a class="card-link" href="${pageContext.request.contextPath}/manager/Unauthorized">가입 승인</a></div>
    	 	<div><a class="card-link" href="${pageContext.request.contextPath}/manager/member">회원 관리</a></div>
    	 </div>	 
     <div><a class="card-link" href="${pageContext.request.contextPath}/manager/department">부서 관리</a></div>
     <div><a class="card-link" href="${pageContext.request.contextPath}/manager/rank">직책 관리</a></div>
     <div><a class="card-link" data-toggle="collapse" href="#collapse_manager_approval">결재 관리</a>
    	 <div id="collapse_manager_approval" class="collapse w3-border">
			<div><a class="card-link" href="${pageContext.request.contextPath}/manager/allApvList?page=1">전체결재 리스트</a></div>
			<div><a class="card-link" href="${pageContext.request.contextPath}/manager/apvDelList?page=1">결재 삭제요청</a></div>
    	 </div>	 
     </div>
     <div><a class="card-link" data-toggle="collapse" href="#collapse_manager_approval">일정 관리</a>
    	 <div id="collapse_manager_approval" class="collapse w3-border">
			<div><a class="card-link" href="${pageContext.request.contextPath}/manager/calendar/company">회사 일정 관리</a></div>
			<div><a class="card-link" href="${pageContext.request.contextPath}/manager/calendar/member">사원 일정 조회</a></div>
    	 </div>	 
     </div>     
</div>
</c:if>
</body>
</html>