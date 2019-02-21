<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
<table class="table table-hover text-center">
	<thead>
	<tr class="text-center">
		<th>번호</th>
		<th>직위명</th>
		<th>직원수</th>
		<th class="text-right">
			<a class="btn btn-outline-secondary btn-sm">추가</a>
			<a class="btn btn-outline-secondary btn-sm">삭제</a>
		</th>
	</tr>
	</thead>
	<c:forEach items="${list}" var="rank" varStatus="status">
		<tr>
			<td>${rank.rank_id}</td>
			<td>${rank.rank_name}</td>
			<td></td>
			<td class="text-right">
				<a class="btn btn-outline-secondary btn-sm">수정</a>
				<a class="btn btn-outline-secondary btn-sm">삭제</a>
			</td>
		</tr>
	</c:forEach>
	</table>
</div>
</body>
</html>