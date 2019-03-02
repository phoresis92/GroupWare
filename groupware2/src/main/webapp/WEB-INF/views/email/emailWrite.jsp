<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	$("#receiver_id, #title, #content").keyup(function(){
		if ($("#receiver_id").val() != "" && $("#title").val() != ""){
			$("#email_write").prop("disabled", false);
		} else{
			$("#email_write").prop("disabled", true);
		}
	});
	$("#form_send").submit(function(){
		$("#email_write").attr("disabled", "disabled");
	});
})
</script>
</head>
<body>
<div class="container-fluid text-center">
	<div class="row content">			
			<div class="col-sm text-left">
				<br>
	<h2>메일 작성</h2>
	<c:choose>
		<c:when test="${empty account.email_account}">
			<div class="row board text-center">
				업무용 메일 등록 후 이용 가능합니다.
				<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/member/myinfo">등록하기</a>		
			</div>
		</c:when>
		<c:otherwise>
			<form action="${pageContext.request.contextPath}/email/write" id="form_send" method="post">
			    <div class="form-group">
				    <label for="title">보내는 사람:</label>
				    <input type="text" class="form-control" value="${sessionScope.member.member_name}<${account.email_account}>" readonly/>
				    <input type="hidden" name="member_id" value="${sessionScope.member.member_id}"/>
				    <input type="hidden" name="email_account" value="${account.email_account}"/>
				    <input type="hidden" name="sender" value="${sessionScope.member.member_name}"/>
				    <input type="hidden" name="sender_id" value="${account.email_account}"/>
			    </div>
			    <div class="form-group">
				    <label for="title">받는 사람:</label>
				    <input type="text" class="form-control" id="receiver_id" name="receiver_id" value="${type eq '0' ? email.receiver_id : email.sender_id}">				    
			    </div>
			    <div class="form-group">
				    <label for="title">제목:</label>
				    <input type="text" class="form-control" id="title" name="title" value="${email.title}">
			    </div>
				    <div class="form-group">
				    <label for="content">내용:</label>
			    	<textarea class="form-control" rows="10" id="content" name="content">${email.content}</textarea>
			    </div>
			    <div align="center">
			    <button type="submit" id="email_write" class="btn btn-primary" disabled>보내기</button>
			    <a class="btn btn-primary" href="${pageContext.request.contextPath}/email/receive">목록</a></div>
			</form>			
		</c:otherwise>
	</c:choose>
  
<br>
</div>
</div>
</div>
</body>
</html>