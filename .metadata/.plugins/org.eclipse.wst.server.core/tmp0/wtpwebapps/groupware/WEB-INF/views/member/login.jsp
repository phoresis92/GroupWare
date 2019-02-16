<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<style>
body { 
	background: url('${pageContext.request.contextPath}/resources/img/background.jpg') no-repeat 50% 50% fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	 background-size: cover;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">

<script type="text/javascript">
$(function(){
	$("#subBtn").click(function(){
		$('#notice_login').html("");
		var login = true;
		if ($("#member_id").val() == "") {
			$("#member_id").siblings("[data-toggle='tooltip']").tooltip('show');
			login = false;
		}
		if ($("#member_pw").val() == "") {			
			$("#member_pw").siblings("[data-toggle='tooltip']").tooltip('show');
			login = false;
		}
		if (login == true){
			var id = $("#member_id").val();
			var pw = $("#member_pw").val();
			var param = "member_id="+id+"&member_pw="+pw;
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/member/checkLogin",
				data:param,
				success:function(data){
					var obj = eval('('+data+')');
					if(!obj.flag){
						$('#loginfail').css('display','');
					}else{			
						$('#frm').submit();		
					}
				}
			});			
		}			
	});
});
</script>

</head>
<body>
<div class="container">
<div class="row content">
<div class="col-sm"></div>
<div class="loginbox commonbox col-sm-4">
<form id="frm" action="${pageContext.request.contextPath}/member/login" method="post">

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
<button id="subBtn" type="submit" class="btn btn-primary">로그인</button>
</div>

<!-- 찾기/가입 버튼 -->
<div class="form-group textbox btn-sm">
<div class="boxleft">
<a class="btn btn-dark" href="${pageContext.request.contextPath}/member/search">사번 / 비밀번호찾기</a>
</div>
<div class="boxright">
<a class="btn btn-dark" href="${pageContext.request.contextPath}/member/join">회원가입</a>
</div>
</div>
</div>
<div class="col-sm"></div>
</div>
</div>
</body>
</html>
