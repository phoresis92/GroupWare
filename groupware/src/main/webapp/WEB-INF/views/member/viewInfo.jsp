<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
</head>
<body>
<h3>${sessionScope.id }님 정보</h3>
<form action="${pageContext.request.contextPath}/member/edit" method="post">
<input type="text" id="id" name="id" maxlength="12"	value="${m.id}" readonly>
<br>
<input type="password" id="pwd" name="pwd" maxlength="16" value="${m.pwd}" style="ime-mode: disabled;" placeholder="비밀번호">
<br>
<input type="text" id="name" name="name" maxlength="12"	value="${m.name}" readonly>
<br>
<input type="text" id="email" name="email" maxlength="20" value="${m.email}" placeholder="이메일">
<input type="submit" value="수정">
<button type="button" onclick="javascript:history.go(-1)">뒤로가기</button>
</form>
<br>
</body>
</html>