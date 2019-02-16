<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            <a class="card-link" href="#">결재</a><br>
    		<a class="card-link" href="#">결재보기</a><br>
    		<a class="card-link" href="#">지난결재</a><br>
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
    		 <a class="card-link" href="${ pageContext.request.contextPath }/calendar">캘린더</a><br>
    		 <a class="card-link" href="#">휴가</a><br>
    		 <a class="card-link" href="#">보너스</a><br>
        </div>
      </div>
    </div>
</div>
</body>
</html>