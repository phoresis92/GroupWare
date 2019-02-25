<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">

</head>
<body>
<div class="container">
	<div class="row content">
		<div class="col"></div>
		<div class="loginbox commonbox col-sm-6 col-md-5 col-lg-4">
			<form id="form_login" action="${pageContext.request.contextPath}/member/login" method="post">			
				<!-- 아이디 -->
				<div class="form-group textbox">
					<label for="member_id">아이디</label>
					<a href="#" data-toggle="tooltip" data-placement="left" title="아이디를 입력하세요!"></a>
					<input type="text" class="form-control" id="member_id" name="member_id" maxlength="12">
				</div>
				
				<!-- 비밀번호 -->
				<div class="form-group textbox">
					<label for="member_pw">비밀번호</label>
					<a href="#" data-toggle="tooltip" data-placement="left" title="비밀번호를 입력하세요!"></a>
					<input type="password" class="form-control" id="member_pw" name="member_pw" maxlength="16" style="ime-mode: disabled;">
				</div>
			</form>
		
			<!-- 로그인 실패 -->
			<div class="form-group textbox" >
				<div class="alert alert-danger" id="loginfail" style="display:none;">
			  	  <strong>로그인 정보가 맞지 않습니다!</strong>
			 	</div>
			</div>
			
			<!-- 로그인 버튼 -->
			<div class="form-group textbox">
				<button id="btn_login" type="button" class="btn btn-primary">로그인</button>
			</div>
			
			<!-- 찾기/가입 버튼 -->
			<div class="form-group textbox">
				<div class="boxleft">
					<a class="btn btn-dark btn-sm" href="${pageContext.request.contextPath}/member/search">사번 / 비밀번호찾기</a>
				</div>
				<div class="boxright">
					<a class="btn btn-dark btn-sm" href="${pageContext.request.contextPath}/member/join">회원가입</a>
				</div>
			</div>			
		</div>
		<div class="col"></div>
	</div>
</div>
</body>
</html>
