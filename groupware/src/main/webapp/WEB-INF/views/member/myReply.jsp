<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<title>내글</title>
<style>
.board{
	padding: 15px;
	margin: 3px;
	border: 1px solid lightgray;
	background-color: #fdfdfd;
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
	
	$("#allcheck").click(function(){
	    //클릭되었으면
	    if($("#allcheck").prop("checked")){
	        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	        $("input[name=checkedReply]").prop("checked",true);
	        //클릭이 안되있으면
	    }else{
	        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	        $("input[name=checkedReply]").prop("checked",false);
	    }
	});
	
	$("#frm").submit(function(){
		if(!$("input[name=checkedReply]").is(":checked")){
			alert("삭제할 댓글을 선택해 주세요");
			return false;
		}
		return true;
	});
});
</script>
</head>
<body>
	
	<div class="container-fluid text-center">
		<div class="row content">

			<div class="col-sm-9 text-left">
				<br>
				<h3>내 게시글</h3>
				
				<form action="${pageContext.request.contextPath}/${ADDRESS}" id="frm">
				<input type="hidden" name="reply_code" value="mydeletereply">
				<div class="btn-group">
					<a class="btn btn-outline-secondary ${ADDRESS eq 'board' ? 'active' : ''}" href="${pageContext.request.contextPath}/reply?reply_code=myreply">자유게시판 댓글</a>
					<a class="btn btn-outline-secondary ${ADDRESS eq 'corpboard' ? 'active' : ''}" href="${pageContext.request.contextPath}/corpreply?reply_code=myreply">기업게시판 댓글</a>					
				</div>
				<div class="container-fluid">
					<div class="row board text-center" style="background-color: #dddddd">
											
						<div class="col-sm"><strong>댓글</strong></div>
						<div class="col-sm-2"></div>
						<div class="col-sm-3"><strong>작성시간</strong></div>
					</div>
					<c:forEach items="${ALLREPLY}" var="ab" varStatus="status">
						<div class="row board">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"	id="check${status.count}" name="checkedReply" value="${ab.reply_no}">
								<label class="custom-control-label" for="check${status.count}"></label>
							</div>
								
							<div class="col-sm">${ab.content}</div>							
							<div class="col-sm-2 text-center"><a href="${pageContext.request.contextPath}/${ADDRESS eq 'reply' ? 'board' : 'corpboard'}?board_code=detail&num=${ab.no}"><strong>원문보기</strong></a></div>
							<div class="col-sm-3 text-center">${ab.time}</div>
						</div>
					</c:forEach>					
				</div>
					<div class="custom-control custom-checkbox" style="width:50%; float:left; margin-left: 15px; margin-top: 10px;">
						<input type="checkbox" class="custom-control-input"	id="allcheck">
						<label class="custom-control-label" for="allcheck">전체선택</label>
					</div>
					<div align="right">
					<input class="btn btn-primary" type="submit" value="삭제">
					</div>
				</form>
				
				<div class="container">
					<ul class="pagination justify-content-center">
						<c:if test="${spage != 1}">
							<li class="page-item"><a class="page-link"
								href='${pageContext.request.contextPath}/${ADDRESS}?reply_code=myreply'>[처음]</a></li>
						</c:if>
						<c:if test="${spage >=6}">
							<li class="page-item"><a class="page-link"
								href='${pageContext.request.contextPath}/${ADDRESS}?reply_code=myreply&page=${startpage-1}'>[이전]</a></li>
						</c:if>

						<c:forEach var="pagenum" begin="${startpage}" end="${endpage}">
							<c:if test="${pagenum == spage}">
								<li class="page-item active"><a class="page-link" href='#'>${pagenum}&nbsp;</a></li>
							</c:if>
							<c:if test="${pagenum != spage}">
								<li class="page-item"><a class="page-link"
									href='${pageContext.request.contextPath}/${ADDRESS}?reply_code=myreply&page=${pagenum}'>${pagenum}&nbsp;</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${endpage != maxpage}">
							<li class="page-item"><a class="page-link"
								href='${pageContext.request.contextPath}/${ADDRESS}?reply_code=myreply&page=${endpage+1}'>[다음]</a></li>
							<li class="page-item"><a class="page-link"
								href='${pageContext.request.contextPath}/${ADDRESS}?reply_code=myreply&page=${maxpage}'>[끝]</a></li>
						</c:if>
					</ul>
				</div>
				<br>
			</div>
		</div>
	</div>
	
</body>
</html>