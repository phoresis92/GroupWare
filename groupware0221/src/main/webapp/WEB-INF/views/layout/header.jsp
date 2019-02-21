<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
setInterval(function(){
	var id = $("#header_member_id").val();
	var param = "member_id="+id;
	$.ajax({
		type:"POST",
		url:"../email/recycle",
		data:param,
		success:function(data){}
	});	
}, 60000)
$(function(){
	if($("#header_member_id").val() == "") {
		$(location).attr("href", "../member/logout");
	}
});
</script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="${pageContext.request.contextPath}/member/main">KITWARE</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/approval"><i class="fas fa-pen-nib"></i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/email/write"><i class="fas fa-envelope"></i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/calendar"><i class="fas fa-calendar-alt"></i></a>
      </li> 
      <li class="nav-item">
        <a class="nav-link" href="#"><i class="fas fa-comment"></i></a>
      </li>
    </ul>
    <ul class="nav navbar-nav">
    	<li class="nav-item">
    		<a class="nav-link" href="#">
				<i class="fas fa-bell"></i>
			</a>
		<li class="nav-item dropdown">
			<a class="nav-link" data-toggle="dropdown" href="#">
				<i class="fas fa-user"></i> ${sessionScope.member.member_name}님</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/member/logout">
				<i class="fas fa-sign-out-alt"></i> 로그아웃
			</a>
		</li>		
	</ul>
  </div>  
</nav>
<input type="hidden" id="header_member_id" value="${sessionScope.member.member_id}"/>
</body>
</html>