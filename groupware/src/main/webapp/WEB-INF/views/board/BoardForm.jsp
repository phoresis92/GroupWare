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

  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

  <!-- summernote -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

<script type="text/javascript">
$(document).ready(function(){

	$('#brdmemo').summernote({
		  lang: 'ko-KR',
	      height: 500,
	      popover: {
	    	  image:[],
	    	  link:[],
	    	  air:[]
	      } ,
	      toolbar: [
	    	    // [groupName, [list of button]]
	    	    ['style', ['bold', 'italic', 'underline', 'clear']],
	    	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    	    ['fontsize', ['fontsize']],
	    	    ['color', ['color']],
	    	    ['para', ['ul', 'ol', 'paragraph']],
	    	    ['table', ['table']],
	    	    ['insert', ['link', 'picture', 'hr']],
	    	    ['height', ['height']]
	    	  ],
	    	  focus: true,
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}
	  });
	  


}) // ready end
</script>
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
							<a href="${pageContext.request.contextPath}/boardList" class="btn btn-outline-primary">돌아가기</a> 
							<a href="#"	class="btn btn-outline-primary" onclick="fn_formSubmit()">저장</a>
					</div>

				</form>


				<br>
			</div>
		</div>
	</div>
</body>
</html>
