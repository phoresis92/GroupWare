<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(function(){
	$("#frm").submit(function(){
		var login = true;
		if ($("#id").val() == "") {
			$("#notice_id").html("<font color='red' size='1'>아이디를 입력해주세요.</font>");
			login = false;
		}
		if ($("#pwd").val() == "") {
			$("#notice_pwd").html("<font color='red' size='1'>비밀번호를 입력해주세요.</font>");
			login = false;
		}
		if (login == false){
			return false;
		}
		return true;
	});
});
</script>

<style>
#wrap{width:200px;margin:0 auto;margin-top:300px; _text-align:left}
#con{padding:20px; border:1px solid black; width:210px; background-color:#D9E5FF;}
body { 
	background: url('${pageContext.request.contextPath}/resources/img/login.jpg') no-repeat 50% 50% fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	 background-size: cover;	 
}
</style>

</head>
<body>
<div id="wrap">
<div id="con">
<form id="frm" action="${pageContext.request.contextPath}/member/login" method="post">
<input type="text" id="id" name="member_id" maxlength="12"	placeholder="아이디">
<div id="notice_id"></div>
<br>
<input type="password" id="pwd" name="member_pw" maxlength="16" style="ime-mode: disabled;" placeholder="비밀번호">
<div id="notice_pwd"></div>
<br>
<input type="submit" class="btn btn-secondary" value="로그인">
</form>
</div>

</div>
</body>
</html>
