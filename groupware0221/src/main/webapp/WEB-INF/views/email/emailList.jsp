<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.board{
	padding: 15px;
	margin: 3px;
}
</style>
<script>
$(function(){
	$(".board").hover(function(){
		$(this).css("background", "#dddddd");	
	},function(){
		$(this).css("background", "#fdfdfd");
		$(".board:first").css("background", "#dddddd");
	});
});
</script>
</head>
<body>
<div class="container-fluid text-center">
	<div class="row content">			
			<div class="col-sm text-left">
				<br>
			<h2>이메일 목록</h2>
			<c:choose>
				<c:when test="${empty account.email_account})">
					<div class="row board text-center">
						업무용 메일 등록 후 이용 가능합니다.
						<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/member/myinfo">등록하기</a>		
					</div>
				</c:when>
				<c:otherwise>
					<div class="row board text-center" style="background-color: #dddddd">
						<div class="col-sm-1"><strong>읽음</strong></div>
						<div class="col-sm-2"><strong>발신자</strong></div>
						<div class="col-sm-7"><strong>제목</strong></div>
						<div class="col-sm-2"><strong>작성시간</strong></div>
					</div>
		
					<c:forEach items="${list}" var="email" varStatus="status">
						<div class="row board text-center">
							<div class="col-sm-1">						
								<input type="checkbox" id="check${status.count}" name="checked_email" value="${email.email_id}"> 읽기				
							</div>
							<div class="col-sm-2 text-left" style="overflow:hidden">${email.sender}</div>
							<div class="col-sm-7 text-left">
								<a href="${pageContext.request.contextPath}/email/detail?email_id=${email.email_id}">${email.title} </a>						
							</div>
							<div class="col-sm-2">${email.send_date}</div>
						</div>
					</c:forEach>
		
					<br>
		
					<div class="container">
						<ul class="pagination justify-content-center">
							<c:if test="${spage != 1}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/manager?manager_code=allmember&page=1">[처음]</a></li>
							</c:if>
							<c:if test="${spage >=11}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/manager?manager_code=allmember&page=${startpage-1}">[이전]</a></li>
							</c:if>
		
							<c:forEach var="pagenum" begin="${startpage}" end="${endpage}">
								<c:if test="${pagenum == spage}">
									<li class="page-item active"><a class="page-link" href='#'>${pagenum}&nbsp;</a></li>
								</c:if>
								<c:if test="${pagenum != spage}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/manager?manager_code=allmember&page=${pagenum}">${pagenum}&nbsp;</a></li>
								</c:if>
							</c:forEach>
		
							<c:if test="${endpage != maxpage}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/manager?manager_code=allmember&page=${endpage+1}">[다음]</a></li>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/manager?manager_code=allmember&page=${maxpage}">[끝]</a></li>
							</c:if>
						</ul>
					</div>
		
					<br>
					<div id="searchForm" align="center">
						<form>
							<select name="opt" class="custom-select-sm">
								<option value="0">제목</option>
								<option value="1">내용</option>
								<option value="2">제목+내용</option>
								<option value="3">글쓴이</option>
							</select>
							  <input type="text" size="20" name="condition" />&nbsp;
							  <input name="board_code" class="form-control" type="hidden" value="list"> 
							  <input type="submit" class="btn btn-primary btn-sm" value="검색" />
						</form>
					</div>					
				</c:otherwise>			
			</c:choose>
			
		</div>
	</div>
</div>
</body>
</html>