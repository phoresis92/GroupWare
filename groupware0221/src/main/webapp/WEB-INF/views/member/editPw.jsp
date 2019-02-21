<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/editPw.js"></script>

<c:if test="${type eq '1'}">
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
</c:if>
<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">
<style>
.joinbox{
	margin-top:100px;
	margin-bottom:100px;
}
</style>
</head>
<body>
<div class="container">
	<div class="row content">
		<div class="col"></div>
		<div class="joinbox commonbox col-sm-6 col-md-5 col-lg-4">
			<form id="form_editPw" action="${pageContext.request.contextPath}/member/editPw" method="post">
				<input type="hidden" name="member_id" value="${sessionScope.member.member_id}">
				<input type="hidden" name="type" value="${type}">
				<!-- 현재 비밀번호 -->
				<div class="form-group textbox">
					<label for="member_pw_now">현재 비밀번호</label>
					<a href="#" data-toggle="tooltip" data-placement="left" title="현재 비밀번호를 입력하세요!"></a>
					<input type="password" class="form-control" id="member_pw_now" name="member_pw_now" maxlength="16" style="ime-mode: disabled;">
				</div>
				
				<!-- 비밀번호 -->
				<div class="form-group textbox">
					<label for="member_pw">새 비밀번호</label>
					<a href="#" data-toggle="tooltip" data-placement="left" title="새 비밀번호를 입력하세요!"></a>
					<input type="password" class="form-control" id="member_pw" name="member_pw" maxlength="16" style="ime-mode: disabled;">
				</div>
				
				<!-- 비밀번호 확인 -->
				<div class="form-group textbox">
					<label for="member_pw1">새 비밀번호 확인</label>
					<a href="#" data-toggle="tooltip" data-placement="left" title="새 비밀번호를 입력하세요!"></a>
					<input type="password" class="form-control" id="member_pw1" name="member_pw1" maxlength="16" style="ime-mode: disabled;">
				</div>
			</form>
		
			<!-- 변경 실패 -->
			<div class="form-group textbox" >
				<div class="alert alert-danger" id="editPwfail" style="display:none;">
			  	  <strong>비밀번호가 일치하지 않습니다!</strong>
			 	</div>
			</div>
			
			<!-- 로그인 버튼 -->
			<div class="form-group textbox">
				<button id="btn_edit" type="button" class="btn btn-primary">비밀번호 변경</button>
			</div>
		</div>
		<div class="col"></div>
	</div>
</div>
</body>
</html>