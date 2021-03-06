<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/join.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
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
<form id="form_join" action="${pageContext.request.contextPath}/member/join" method="post">
            <div class="row">
            
              <div class="col-lg-6 d" style="background-color:#eaf8ff"><%-- <img id="file_img" src="${pageContext.request.contextPath}/resources/img/ALPHA.png" alt="사진"> --%>
              
              <div class="p-5">
               <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Create Account</h1>
                  </div>
              <!-- 이름 -->
<div class="form-group textbox">
	<label for="member_name">이름</label>
	<a href="#" data-toggle="tooltip" data-placement="left" title="필수입력사항"></a>
	<input type="text" class="form-control" id="member_name" name="member_name" maxlength="12">
</div>

<!-- 비밀번호 -->
<div class="form-group textbox">
	<label for="member_pw">비밀번호</label>
	<a href="#" data-toggle="tooltip" data-placement="left" title="필수입력사항"></a>
	<input type="password" class="form-control" id="member_pw" name="member_pw" maxlength="16" style="ime-mode: disabled;">
</div>

<!-- 생년월일 -->
<div class="form-group textbox">
	<label for="member_birth">생년월일(ex 19901231)</label>
	<a href="#" data-toggle="tooltip" data-placement="left" title="필수입력사항"></a>
	<input type="text" class="form-control" id="member_birth" name="member_birth" maxlength="8">
</div>

<!-- 성별 -->
<div class="custom-control custom-radio custom-control-inline">
<div class="form-group textbox">
   	 <input type="radio" class="custom-control-input" id="member_m" name="member_gender" value="남" checked>
   	 <p class="text-white text_border">남</p>
   	 <label class="custom-control-label" for="member_m"></label>
  </div>
</div>
<div class="custom-control custom-radio custom-control-inline mr-10">
  <div class="form-group textbox">
    <input type="radio" class="custom-control-input" id=member_w name="member_gender" value="여">
    <p class="text-white text_border">여</p>
    <label class="custom-control-label" for="member_w"></label>
  </div> 
</div>

<!-- 이메일 -->
<div class="form-group textbox">
	<label for="member_email">메일</label>
	<a href="#" data-toggle="tooltip" data-placement="left" title="필수입력사항"></a>
	<input type="text" class="form-control" id="member_email" name="member_email" maxlength="30">
</div>
              
              </div>
              
              
              </div>
              <div class="col-lg-6">
                <div class="p-5">
                     <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4"> &nbsp; </h1>
                  </div>
                

<!-- 주소 -->
<div class="input-group">
<div class="form-group textbox mr-3"> 
	<label for="sample6_postcode">우편번호</label>
	<a href="#" data-toggle="tooltip" data-placement="left" title="필수입력사항"></a>
	<input type="text" class="form-control" id="sample6_postcode" name="member_address1" readonly tabindex="-1">	
</div>
<div class="form-group textbox">
	<input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
</div>
</div>
<div class="form-group textbox">
	<label for="sample6_address">주소</label>
	<input type="text" class="form-control" id="sample6_address" name="member_address2" readonly tabindex="-1">
</div>
<div class="form-group textbox">
	<label for="sample6_detailAddress">상세주소</label>
	<input type="text" class="form-control" id="sample6_detailAddress" name="member_address3">	
	<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
</div>

<!-- 휴대폰번호 -->
<div class="form-group textbox">
	<label for="member_phone">휴대폰번호(-없이 입력)</label>
	<input type="text" class="form-control" id="member_phone" name="member_phone" maxlength="11">
</div>

<!-- 가입 버튼 -->
<div class="form-group textbox">
<button type="submit" class="btn btn-primary btn-lg">가입하기</button>
</div>

<div class="form-group textbox">
		 <a href="${pageContext.request.contextPath}/member/login" class="btn btn-google btn-user btn-block">
                       Back to login 
                    </a>
		</div>


             
                  
                </div>
              </div>
            </div>
</form>
          </div>
        </div>

      </div>
    </div>

  </div>
  


</body>
</html>