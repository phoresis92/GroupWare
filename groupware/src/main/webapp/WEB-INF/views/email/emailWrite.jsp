<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
  
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

  <!-- summernote -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

<script type="text/javascript">
$(document).ready(function(){

	$('#summernote').summernote({
		  lang: 'ko-KR',
	      height: 400,
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

$(function(){
	$("#receiver_id, #title, #summernote").keyup(function(){
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
			    	<textarea class="form-control" rows="10" id="summernote" name="content">${email.content}</textarea>
			    </div>
			    <div align="center">
			    <button type="submit" id="email_write" class="btn btn-outline-primary" disabled>보내기</button>
			    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/email/receive">목록</a></div>
			</form>			
		</c:otherwise>
	</c:choose>
  
<br>
</div>
</div>
</div>
</body>
</html>