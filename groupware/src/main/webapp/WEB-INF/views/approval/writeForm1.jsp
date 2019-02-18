<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.aa {
width:100px;
}
.tt{
height: 60px;
}

</style>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- jQuery -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

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


function sendFile(file, el) {
	var form_data = new FormData();
  	form_data.append('file', file);
  	$.ajax({
    	data: form_data,
    	type: "POST",
    	url: '${ pageContext.request.contextPath}/approval/apv_textImg',
    	cache: false,
    	contentType: false,
    	enctype: 'multipart/form-data',
    	processData: false,
    	success: function(img_name) {
      		$(el).summernote('editor.insertImage', img_name);
    	}
  	});
}


var doubleSubmitFlag = true;


function sendApv(){
	
	if(doubleSubmitFlag){
		
		for(var i = 1 ; i <=3 ; i++){
	
			$('#authId'+i+'').val($('#authId'+i+'').text())
			
		}
		
		if($('#authId1').val() == ''){
			alert('결재라인을 선택해주세요')
			return;
		}
		if(($('#approval_title').val()).trim() == ''){
			alert('제목을 입력해주세요')
			return;
		}
		if(($('#summernote').val()).trim() == ''){
			alert('내용을 입력해주세요')
			return;
		}
	
		console.log($(':radio[name="formList"]:checked').val());
		
		$('#apvCateGo').val($(':radio[name="formList"]:checked').val());
		
		console.log($('#apv_cate').text());
		console.log($('#authId1').val());
		console.log($('#authId2').val());
		console.log($('#authId3').val());
		$('#title').val();
		$('#summernote').val();
		
		
		
		
		$('#sendApv').submit();
		doubleSubmitFlag = false;
	
	}else{
		return;
	}
	
}

</script>

</head>
<body>


<div class="container">
	<h2>결재문서 작성</h2>
	<div>
	<span>결재 문서</span>
	<span>
	
	
	<c:forEach var="item" items="${ apvCateList }" varStatus="stat">
	
	<c:choose>
	
	<c:when test="${ stat.first }">
		<input type="radio" name="formList" value="${ item.apv_cate_id }" checked="checked"/>${ item.apv_cate_name } &nbsp;&nbsp;
		<input id="apv_cate" type="hidden" value="${ item.apv_cate_id }">
	</c:when>
	<c:otherwise>
		<input type="radio" name="formList" value="${ item.apv_cate_id }" />${ item.apv_cate_name } &nbsp;&nbsp;
	</c:otherwise>
	
	</c:choose>
	
	</c:forEach>
	
	
	</span>
	
	</div>
	
	<div class="text-right">
	<table border="1" style="display: inline-block">
	
	<tr>
	<td class="tt" rowspan='2'>결재</td>
	<td class="aa">작성자</td>
	<td id="authRank1" class="aa"></td>
	<td id="authRank2" class="aa"></td>
	<td id="authRank3" class="aa"></td>
	</tr>
	
	<tr>
	
	<td>${ sessionScope.member.member_name }</td>
	<td id="authName1"></td>
	<td id="authName2"></td>
	<td id="authName3"></td>
	
	</tr>
	
	</table>
	</div>
	

	
	<button onclick="selectMem()">결재라인 추가</button>

	<div>
	
	기안일자 ${ now } <br>
	기안부서
	
	<c:choose>
	
	<c:when test="${ sessionScope.member.department_name == null }">발령대기</c:when>
	<c:otherwise>${ sessionScope.member.department_name }</c:otherwise>
	
	</c:choose>
	 <br>
	
	기안담당
	${ sessionScope.member.member_name }
	<c:choose>
	
	<c:when test="${ empty sessionScope.member.rank_name }">입사대기</c:when>
	<c:otherwise>${ sessionScope.member.rank_name }</c:otherwise>
	
	</c:choose>
	 <br>
	
	<input type="hidden" id="authDept1" name="authDept1">
	<input type="hidden" id="authDept2" name="authDept2">
	<input type="hidden" id="authDept3" name="authDept3">
	
<form id="sendApv" action="${ pageContext.request.contextPath }/approval/" method="POST" enctype="multipart/form-data"> <!-- ============================================================================================================================================================= -->
	

	<input type="hidden" id="authId1" name="approval_mem1">
	<input type="hidden" id="authId2" name="approval_mem2">
	<input type="hidden" id="authId3" name="approval_mem3">
	
	<input type="hidden" id="apvCateGo" name="approval_cate">
	
	제목<input id="approval_title" type="text" name="approval_title" > <br>
	<div>
		<textarea id="summernote" name="approval_content" ></textarea> <br>
	</div>
	
	<div class="row">
		<div class="float-left">
			<input type="file" name="file"/>
		</div>
	</div>
	
	
	
</form> <!-- ============================================================================================================================================================= -->

		<div class="text-right">
			<button onclick="sendApv()">제출하기</button>
		</div>
	
	</div>
</div>

	<script type="text/javascript">
	
	function selectMem(){
		window.open('${pageContext.request.contextPath}/approval/pikAuthMem','결제자선택','width=800 , height=500 ,resizable = no, scrollbars = no');
	}
	
	</script>

</body>
</html>