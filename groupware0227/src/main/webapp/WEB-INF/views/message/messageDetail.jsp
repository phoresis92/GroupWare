<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="container-fluid text-center">
	<div class="row content">
		<div class="col-sm bg-light"></div>
			<div class="col-sm text-left" style="border: 1px solid lightgray; margin: 20px;">
				<form action="${pageContext.request.contextPath}/board"	method="post" name="board">
					<div class="container">
					<br>
					<h2>이메일 상세보기</h2>
					<br>
						<div class="row" style="border-bottom: 1px solid lightgray">
						<div class="col-sm-1">${BOARD.no}</div>
						<div class="col-sm"><strong>${BOARD.title}</strong></div>
						<div class="col-sm-4 text-right"><span style="font-size:12px; color: lightgray;">${BOARD.time}</span></div>
					</div>
					<div class="row">
						<div class="col-sm"><strong>${BOARD.id}</strong></div>
						<div class="col-sm-2">조회 ${BOARD.viewcount}</div>
						<div class="col-sm-1"><span class="fas fa-thumbs-up"></span><span id="recommend"> ${BOARD.recommend}</span></div>
						<div class="col-sm-1"><span class="fas fa-thumbs-down"></span><span id="not_recommend"> ${BOARD.not_recommend}</span></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-12">${BOARD.content}</div>
					</div>
					<br>
				</div>
					<input name="h_id" type="hidden" value="${BOARD.id}">
					<input name="h_title" type="hidden" value="${BOARD.title}">
					<input name="h_content" type="hidden" value="${BOARD.content}">
					<input name="h_recommend" type="hidden" value="${BOARD.recommend}">
					<input name="h_not_recommend" type="hidden" value="${BOARD.not_recommend}">
					<input name="h_time" type="hidden" value="${BOARD.time}">
					<input name="h_no" type="hidden" value="${BOARD.no}">
					<input name="board_code" type="hidden" value="detail">
					<br>
					<br>
					<div class="container">
					<div class="row">
						<a class="mr-sm-2 btn btn-outline-secondary btn-sm"
							href="${pageContext.request.contextPath}/board?board_code=modify&num=${BOARD.no}">수정</a>
						<a class="mr-sm-2 btn btn-outline-secondary btn-sm"
							href="${pageContext.request.contextPath}/board?board_code=delete&num=${BOARD.no}">삭제</a>
						<a class="mr-sm-2 btn btn-outline-secondary btn-sm"
							href="${pageContext.request.contextPath}/board?board_code=list&page=1">목록</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>				
</body>
</html>