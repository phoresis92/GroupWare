<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script>
//Modal에서 table의 'tr' 눌렀을 때 id값 가지고 비밀번호 찾기 이동 (첫번째 'tr'은 제외)
$(document).on('click', '.table tr:nth-child(n+2)', function (){		
	// 'td'에 표시된 아이디값 변수에 저장		
	var id = $(this).children().text();
	
	// 비밀번호 찾기 tab 클릭
	$("#find_pw").click();
	
	// 비밀번호 찾기 tab에서 변수에 저장한 id값 input에 넣음
	$("#member_id2").val(id);
});
</script>
</head>
<body>
<div class="container-fluid">
<table class="table table-hover text-center">
	<thead>
	<tr class="text-center">
		<th>사번</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>성별</th>
		<th>메일</th>
		<th>휴대폰번호</th>
		<th>부서</th>
		<th>직책</th>
		<th>입사일</th>
		<th>수정일</th>
		<th class="text-right">
			<a class="btn btn-outline-secondary btn-sm">삭제</a>
		</th>
	</tr>
	</thead>
	<c:forEach items="${list}" var="member" varStatus="status">
		<tr>
			<td>${member.member_id}</td>
			<td>${member.member_name}</td>
			<td>${member.member_birth}</td>
			<td>${member.member_gender}</td>
			<td>${member.member_email}</td>
			<td>${member.member_phone}</td>
			<td>${member.department_name}</td>
			<td>${member.rank_name}</td>
			<td>${member.member_indate}</td>
			<td>${member.member_modidate}</td>
			<td class="text-right">
				<c:if test="${member.member_status eq '0'}">
					<a id="authorization" class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/manager/authorization?member_id=${${member.member_id}">승인</a>
					<a id="refuse" class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/manager/refuse?member_id=${${member.member_id}">거절</a>
				</c:if>
				<c:if test="${member.member_status != '0'}">
					<a id="editMember" class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/manager/editMember?member_id=${${member.member_id}">수정</a>
					<a id="deleteMember" class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/manager/deleteMember?member_id=${${member.member_id}">삭제</a>
				</c:if>				
			</td>
		</tr>
	</c:forEach>
	</table>
</div>
</body>
</html>