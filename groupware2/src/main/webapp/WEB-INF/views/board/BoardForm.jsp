<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board</title>
  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
                <script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>
<script src="js/jquery-2.2.3.min.js"></script> -->
<script>
	function chkInputValue(id, msg) {
		if ($.trim($(id).val()) == "") {
			alert(msg + " 입력해주세요.");
			$(id).focus();
			return false;
		}
		return true;
	}
	function fn_formSubmit() {
		if (!chkInputValue("#brdwriter", "작성자를"))
			return;
		if (!chkInputValue("#brdtitle", "글 제목을"))
			return;
		if (!chkInputValue("#brdmemo", "글 내용을"))
			return;

		$("#form1").submit();
	}
</script>
</head>
<body>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm text-left">
				<br>
				<h2>자유게시판 글 작성</h2>

				<form id="form1" name="form1" action="boardSave" method="post" enctype="multipart/form-data"
				action="${pageContext.request.contextPath}/email/write"	method="post">
					<div class="form-group">
						
						<input type="hidden" id="brdwriter" name="brdwriter" value="<c:out value="${sessionScope.member.member_name}"/>">
<%-- 						<input type="text" class="form-control" id="brdwriter" name="brdwriter"	value="<c:out value="${sessionScope.member.member_name}"/>" readonly />
 --%>
					</div>

					<div class="form-group">
						<label for="title">제목:</label> <input placeholder="Enter Title" type="text" class="form-control" id="brdtitle" name="brdtitle"
						value="<c:out value="${boardInfo.brdtitle}"/>">
					</div>
					<div class="form-group">
						<label for="content">내용:</label>
						<textarea id="brdmemo" class="form-control" name="brdmemo" rows="10"><c:out value="${boardInfo.brdmemo}"/></textarea>
						 
					</div>
					<div>
						<label for="file" >첨부:</label>

						<c:forEach var="listview" items="${listview}" varStatus="status">
							<input type="checkbox" name="fileno"
								value="<c:out value="${listview.fileno}"/>">
							<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
								<c:out value="${listview.filename}" />
							</a>
							<c:out value="${listview.size2String()}" />
							<br />
						</c:forEach>

						<input type="file" name="uploadfile" multiple="" />
					</div>

					<div align="center">
						<input type="hidden" name="bgno" value="<c:out value="${bgno}"/>">
						<input type="hidden" name="brdno"
							value="<c:out value="${boardInfo.brdno}"/>"> 
							<a href="${pageContext.request.contextPath}/boardList"
							class="btn btn-outline-primary">돌아가기</a> <a href="#"
							class="btn btn-outline-primary" onclick="fn_formSubmit()">저장</a>
					</div>

				</form>


				<br>
			</div>
		</div>
	</div>
</body>
</html>
