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
		
			<div class="col-sm text-left" style="border: 1px solid lightgray; margin: 20px;">
				<form action="${pageContext.request.contextPath}/board"	method="post" name="board">
					<div class="container">
					<br>
					<h2>이메일 상세보기</h2>
						<div class="row" style="border-bottom: 1px solid lightgray">
						<div class="col-sm-4"><h4><strong>${email.title}</strong></h4></div>
						<div class="col-sm-4"></div>
						<div class="col-sm-4 text-right"><span style="font-size:12px; color: lightgray;">${email.send_date}</span></div>
					</div>
					<div class="row">
						<div class="col-sm-9"><strong>보낸사람</strong> ${email.sender}&#32;&#60;${email.sender_id}&#62;</div>
						<div class="col-sm-3"></div>
					</div>
					<div class="row">
						<div class="col-sm-9"><strong>받는사람</strong> ${email.receiver}&#32;&#60;${email.receiver_id}&#62;</div>
						<div class="col-sm-3"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-12">${email.content}<br>--------<br>${email.content_html}<br>--------<br>${email.content_plain}</div>
					</div>
					<br>
				</div>					
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