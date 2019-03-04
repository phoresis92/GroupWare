<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/editPw.js"></script>

<c:if test="${type eq '1'}">
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
</c:if>
<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">

  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<style>
.joinbox{
	margin-top:100px;
	margin-bottom:100px;
}
</style>
</head>
<body>

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9" style="height:100% !important">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d" style="background-color:#eaf8ff !important"><img id="file_img" src="${pageContext.request.contextPath}/resources/img/ALPHA.png" alt="사진"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome KIT!</h1>
                  </div>
                
            <form id="form_editPw" action="${pageContext.request.contextPath}/member/editPw" method="post">
				<input type="hidden" name="member_id" value="${sessionScope.member.member_id}">
				<input type="hidden" name="type" value="${type}">
				<!-- 현재 비밀번호 -->
				<div class="form-group textbox">
					<label for="member_pw_now">현재 비밀번호</label>
					<input type="password" class="form-control" id="member_pw_now" name="member_pw_now" maxlength="16" style="ime-mode: disabled;">
				</div>
				
				<!-- 비밀번호 -->
				<div class="form-group textbox">
					<label for="member_pw">새 비밀번호</label>
					<input type="password" class="form-control" id="member_pw" name="member_pw" maxlength="16" style="ime-mode: disabled;">
				</div>
				
				<!-- 비밀번호 확인 -->
				<div class="form-group textbox">
					<label for="member_pw1">새 비밀번호 확인</label>
					<input type="password" class="form-control" id="member_pw1" name="member_pw1" maxlength="16" style="ime-mode: disabled;">
				</div>
				
			</form>
			
			<!-- 변경 실패 -->
			<div class="form-group textbox" >
				<div class="alert alert-danger" id="editPwfail" style="display:none;">
			  	  <strong>비밀번호가 일치하지 않습니다!</strong>
			 	</div>
			</div>
			
			<!-- 로그인 버튼 -->
			<div class="form-group textbox">
				<button id="btn_edit" type="button" class="btn btn-primary">비밀번호 변경</button>
			</div>
		</div>
         
                  
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

</body>
</html>