<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
<script>
function next()
{location = "../member/login";}

setInterval('time()', 1000)

function time(){
	var time = $("#time").html();
	if (time > 1) {
		$("#time").html(time-1);
	}
}
</script>
</head>
<body onLoad="setTimeout('next()', 5000)">
<div class="container-fluid">
	<div class="row content">
		<div class="col"></div>
		<div class="loginbox commonbox col-sm-11col-md-11 col-lg-11">		
			<!-- 안내 -->
			<div class="form-group textbox text-center text-white">
				<c:choose>
					<c:when test="${type eq '1'}">
						<h3>관리자 승인 후 이용 가능합니다.</h3>
					</c:when>
					<c:when test="${type eq '2'}">
						<h3>퇴직 회원입니다.</h3>
						<h3>관리자에게 문의 해보시기 바랍니다.</h3>
					</c:when>
					<c:otherwise>
						<h3>정지 회원입니다.</h3>
						<h3>관리자에게 문의 해보시기 바랍니다.</h3>
					</c:otherwise>
				</c:choose>
				<br><h3><strong><span id="time">5</span>초 후 로그인 페이지로 이동합니다!</strong></h3>
			</div>			
		</div>
		<div class="col"></div>
	</div>
</div>
</body>
</html>