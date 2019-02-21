<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$.ajax({
	type:'POST',
	url: '${ pageContext.request.contextPath }/approval/notAuthApvCount',
	success: function(data){
		//console.log(data);
		$('#apvCount').text(data);
	}
})

</script>

</head>
<body>
<div id="accordion">
    <div class="card">
      <div class="card-header">
        <a class="card-link" data-toggle="collapse" href="#collapseOne">
    	      전자결재
        </a>
      </div>
      <div id="collapseOne" class="collapse" data-parent="#accordion">
        <div class="card-body">
            <a class="card-link" href="${ pageContext.request.contextPath }/approval">일반결재</a><br>
            <a class="card-link" href="${ pageContext.request.contextPath }/apv_Vacat">근태/휴가결재</a><br>
    		<a class="card-link" href="${ pageContext.request.contextPath }/approval/tempApvList?page=1">임시저장함</a><br>
        </div>
      </div>
    </div>
    
    <div class="card">
      <div class="card-header">
        <a class="card-link" data-toggle="collapse" href="#collapseOne">
    		결재함
        </a>
      </div>
      <div id="collapseOne" class="collapse" data-parent="#accordion">
        <div class="card-body">
    		<a class="card-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=1">내문서함</a><br>
    		<a class="card-link" href="${ pageContext.request.contextPath }/approval/notAuthApvList?page=1">미결재문서(<span id="apvCount"></span>)</a><br>
    		<a class="card-link" href="${ pageContext.request.contextPath }/approval/yesAuthApvList?page=1">결재완료문서</a><br>
        </div>
      </div>	
    </div>
    
    <div class="card">
      <div class="card-header">
        <a class="card-link" data-toggle="collapse" href="#collapseTwo">
    	      커뮤니티
        </a>
      </div>
      <div id="collapseTwo" class="collapse" data-parent="#accordion">
        <div class="card-body">
          <a class="card-link" href="#">공지사항</a><br>
  		  <a class="card-link" href="#">게시판</a><br>
 		  <a class="card-link" href="#">자료실</a><br>
        </div>
      </div>
    </div>
    
    <div class="card">
      <div class="card-header">
        <a class="card-link" data-toggle="collapse" href="#collapseThree">
    	      근태관리
        </a>
      </div>
      <div id="collapseThree" class="collapse" data-parent="#accordion">
        <div class="card-body">        	
    		 <a class="card-link" href="#">출결</a><br>
    		 <a class="card-link" href="#">휴가</a><br>
    		 <a class="card-link" href="#">보너스</a><br>
        </div>
      </div>
    </div>
        
    <div class="card">
      <div class="card-header">
        <a class="card-link" data-toggle="collapse" href="#collapseThree">
        	일정관리
        </a>
      </div>
      <div id="collapseThree" class="collapse" data-parent="#accordion">
        <div class="card-body">        	
    		 <a class="card-link" href="${ pageContext.request.contextPath }/calendar">내일정</a><br>
        </div>
      </div>
    </div>
</div>
</body>
</html>