<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function joinCheck() {
	var isjoin = true;
	if (document.getElementById("id").value == "") {
		document.getElementById("notice_id").innerHTML = "<font color='red'>아이디를 입력하세요.</font>";
		isjoin = false;
	}
	if (document.getElementById("pwd").value == "") {
		document.getElementById("notice_pwd").innerHTML = "<font color='red'>비밀번호를 입력하세요.</font>";
		isjoin = false;
	}
	if (document.getElementById("name").value == "") {
		document.getElementById("notice_name").innerHTML = "<font color='red'>이름을 입력하세요.</font>";
		isjoin = false;
	}
	if (document.getElementById("email").value == "") {
		document.getElementById("notice_email").innerHTML = "<font color='red'>이메일을 입력하세요.</font>";
		isjoin = false;
	}
	if (isjoin) {
		document.getElementById("frm").submit();
	}
}

$(document).ready(function(){
	$("#check").click(function(){
		var id = $("#id").val();
		if(id == '' || id == null) {
			alert('id를 입력하시오.');
			return;
		}
		var param = "id="+id;
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/member/checkId",
			data:param,
			success:function(data){
				var obj = eval('('+data+')');
				var str = '';
				if(obj.flag){
					str = '사용가능한 아이디';					
				} else {
					str = '중복된 아이디';
					$('#id').val('');
				}
				$('#idCheckResult').html(str);
			}
		});
	});
});

</script>
</head>
<body>
<form id="frm" action="${pageContext.request.contextPath}/member/join" method="post">
<input type="text" id="id" name="id" maxlength="12"	placeholder="아이디">
<input type="button" value="중복체크" id="check"><span id="idCheckResult"></span>
<div id="notice_id"></div>
<br>
<input type="password" id="pwd" name="pwd" maxlength="16" style="ime-mode: disabled;" placeholder="비밀번호">
<div id="notice_pwd"></div>
<br>
<input type="text" id="name" name="name" maxlength="12"	placeholder="이름">
<div id="notice_name"></div>
<br>
<input type="text" id="email" name="email" maxlength="20"	placeholder="이메일">
<div id="notice_email"></div>
<br>
<input type="radio" id="type1" name="type" value="1">판매자
<input type="radio" id="type2" name="type" value="2" checked>구매자
</form>
<br>
<input type="button" value="가입하기" onclick="joinCheck();">										
</body>
</html>