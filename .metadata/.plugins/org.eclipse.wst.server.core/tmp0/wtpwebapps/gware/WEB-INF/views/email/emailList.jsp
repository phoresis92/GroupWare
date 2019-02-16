<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="container-fluid text-center">
	<div class="row content">			
			<div class="col-sm-9 text-left">
				<br>
			<h2>이메일 목록</h2>
			<br>
			<c:choose>
				<c:when test="${empty sessionScope.MEMBERBEAN}">
				</c:when>
				<c:otherwise>
					<div align="right">
						<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/board/board.jsp">글쓰기</a>						
					</div>
				</c:otherwise>
			</c:choose>

			<div class="row board text-center" style="background-color: #dddddd">
				<div class="col-sm-1"><strong>글번호</strong></div>
				<div class="col-sm-5"><strong>글제목</strong></div>
				<div class="col-sm-1"><strong>작성자</strong></div>
				<div class="col-sm-2"><strong>작성시간</strong></div>
				<div class="col-sm-1"><strong>조회수</strong></div>
				<div class="col-sm-1"><strong>추천</strong></div>
				<div class="col-sm-1"><strong>비추천</strong></div>
			</div>

			<c:forEach items="${ALLBOARD}" var="ab">
				<div class="row board text-center">
					<div class="col-sm-1">${ab.no}</div>
					<div class="col-sm-5 text-left">
						<a href="${pageContext.request.contextPath}/board?board_code=detail&num=${ab.no}">${ab.title} </a>
						<c:if test="${ab.rep_count != 0}">
							[${ab.rep_count}]
						</c:if>
					</div>
					<div class="col-sm-1 text-left">${ab.id}</div>
					<div class="col-sm-2">${ab.time}</div>
					<div class="col-sm-1">${ab.viewcount}</div>
					<div class="col-sm-1">${ab.recommend}</div>
					<div class="col-sm-1">${ab.not_recommend}</div>
				</div>
			</c:forEach>

			<br>

			<div class="container">
				<ul class="pagination justify-content-center">
					<c:if test="${spage != 1}">
						<li class="page-item"><a class="page-link"
							href='${pageContext.request.contextPath}/board?board_code=list&page=1'>[처음]</a></li>
					</c:if>
					<c:if test="${spage >=6}">
						<li class="page-item"><a class="page-link"
							href='${pageContext.request.contextPath}/board?board_code=list&page=${startpage-1}'>[이전]</a></li>
					</c:if>

					<c:forEach var="pagenum" begin="${startpage}" end="${endpage}">
						<c:if test="${pagenum == spage}">
							<li class="page-item active"><a class="page-link" href='#'>${pagenum}&nbsp;</a></li>
						</c:if>
						<c:if test="${pagenum != spage}">
							<li class="page-item"><a class="page-link"
								href='${pageContext.request.contextPath}/board?board_code=list&page=${pagenum}'>${pagenum}&nbsp;</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${endpage != maxpage}">
						<li class="page-item"><a class="page-link"
							href='${pageContext.request.contextPath}/board?board_code=list&page=${endpage+1}'>[다음]</a></li>
						<li class="page-item"><a class="page-link"
							href='${pageContext.request.contextPath}/board?board_code=list&page=${maxpage}'>[끝]</a></li>
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
		</div>
	</div>
</div>
</body>
</html>