<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">

  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
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
              <div class="col-lg-6 d" style="background-color:eaf8ff"><img id="file_img" src="${pageContext.request.contextPath}/resources/img/ALPHA.png" alt="사진"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome KIT!</h1>
                  </div>
                
            <form id="form_login" action="${pageContext.request.contextPath}/member/login" method="post">			
				<!-- 아이디 -->
				<div class="form-group textbox">
					<label for="member_id">Enter your ID</label>
					<a href="#" data-toggle="tooltip" data-placement="left" title="아이디를 입력하세요!"></a>
					<input type="text" class="form-control" id="member_id" name="member_id" maxlength="12">
				</div>
				
				<!-- 비밀번호 -->
				<div class="form-group textbox">
					<label for="member_pw">Password</label>
					<a href="#" data-toggle="tooltip" data-placement="left" title="비밀번호를 입력하세요!"></a>
					<input type="password" class="form-control" id="member_pw" name="member_pw" maxlength="16" style="ime-mode: disabled;">
				</div>
</form>
      <!-- 로그인 실패 -->
			<div class="form-group textbox" >
				<div class="alert alert-danger" id="loginfail" style="display:none;">
			  	  <strong>로그인 정보가 맞지 않습니다!</strong>
			 	</div>
			</div>             
                   
                   <!-- 로그인 버튼 -->
			<div class="form-group textbox">
				<button class="btn btn-primary btn-user btn-block" id="btn_login" type="button" class="btn btn-primary">Login</button>
			</div>
                   
       
			
                    <hr>
                    <a href="${pageContext.request.contextPath}/member/search" class="btn btn-google btn-user btn-block">
                       Forgot Id or Password? 
                    </a>
                    
                    <a href="${pageContext.request.contextPath}/member/join" class="btn btn-facebook btn-user btn-block">
                      Create an Account!
                    </a>
                  </form>

                  <hr>
                  <div class="text-center">
                    <a class="small" href="">About Kitware!</a>
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
