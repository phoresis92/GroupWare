<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>
<h4>${sessionScope.id }님 페이지</h4><br>
<a class="btn btn-success" href="${pageContext.request.contextPath}/member/myInfo">회원정보조회</a><br><br>
<a class="btn btn-success" href="${pageContext.request.contextPath}/member/logout">로그아웃</a><br><br>
<a class="btn btn-success" href="${pageContext.request.contextPath}/member/out">탈퇴</a><br><br>
<a class="btn btn-success" href="${pageContext.request.contextPath}/board/list">게시판</a><br><br>
<a class="btn btn-success" href="${pageContext.request.contextPath}/imgBoard/list">이미지게시판</a><br><br>
<a class="btn btn-success" href="${pageContext.request.contextPath}/download/list">자료실</a>
</body>
</html>