<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/search.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">

  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <style>
  .tab-content .active{
  padding-left: 0px;
    padding-right: 0px;
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
                    <h1 class="h4 text-gray-900 mb-4">Find ID/PW</h1>
                  </div>
                

<!-- Nav tabs -->
  <ul class="nav nav-tabs textbox">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#menu1">ID</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">PassWord</a>
    </li>
  </ul>
  
  
  <!-- Tab panes -->
  <div class="tab-content">
    <div id="menu1" class="container tab-pane active"><br>
        	
    	<!-- 이름 -->
		<div class="form-group textbox">
			<label for="member_name1">이름</label>
			<a href="#" data-toggle="tooltip" data-placement="left" title="이름을 입력하세요!"></a>
			<input type="text" class="form-control" id="member_name1" name="member_name" maxlength="12">
		</div>
	
		<!-- 생년월일 -->
		<div class="form-group textbox">
			<label for="member_birth1">생년월일(ex 19901231)</label>
			<a href="#" data-toggle="tooltip" data-placement="left" title="생년월일을 입력하세요!"></a>
			<input type="text" class="form-control" id="member_birth1" name="member_birth" maxlength="8">
		</div>
		
		<div class="form-group textbox">
			<label for="member_email1">메일(gmail만 가능)</label>
			<a href="#" data-toggle="tooltip" data-placement="left" title="메일을 입력하세요!"></a>
			<input type="text" class="form-control" id="member_email1" name="member_email" maxlength="30">
		</div>
		
		<!-- 사번 찾기 버튼 -->
		<div class="form-group textbox">
			<button id="btn_find_id" type="button" class="btn btn-primary">Find ID</button>
		</div>
		
		<div class="form-group textbox">
		 <a href="${pageContext.request.contextPath}/member/login" class="btn btn-google btn-user btn-block">
                       Back to login 
                    </a>
		</div>
		
		
    </div>
    
    <div id="menu2" class="container tab-pane fade"><br>
    
    	<!-- 아이디 -->
		<div class="form-group textbox">
			<label for="member_id2">아이디</label>
			<a href="#" data-toggle="tooltip" data-placement="left" title="아이디를 입력하세요!"></a>
			<input type="text" class="form-control" id="member_id2" name="member_id" maxlength="12">
		</div>
		
    	<!-- 이름 -->
		<div class="form-group textbox">
			<label for="member_name2">이름</label>
			<a href="#" data-toggle="tooltip" data-placement="left" title="이름을 입력하세요!"></a>
			<input type="text" class="form-control" id="member_name2" name="member_name" maxlength="12">
		</div>
	
		<!-- 생년월일 -->
		<div class="form-group textbox">
			<label for="member_birth2">생년월일(ex 19901231)</label>
			<a href="#" data-toggle="tooltip" data-placement="left" title="생년월일을 입력하세요!"></a>
			<input type="text" class="form-control" id="member_birth2" name="member_birth" maxlength="8">
		</div>
		
		<!-- 비밀번호 찾기 버튼 -->
		<div class="form-group textbox">
			<button id="btn_find_pw" type="button" class="btn btn-primary">Find PassWord</button>
			
		</div>
		<div class="form-group textbox">
		 <a href="${pageContext.request.contextPath}/member/login" class="btn btn-google btn-user btn-block">
                       Back to login 
                    </a>
		</div>
    </div>
  </div>
</div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
<!-- The Modal -->
  <div class="modal fade" id="modal_findId">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">검색 결과</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
     	   <button type="button" id="find_pw" class="btn btn-primary btn-sm" data-dismiss="modal">비밀번호 찾기</button>
           <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="modal_findPw">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">       		
           <button type="button" id="find_fail" class="btn btn-primary btn-sm" data-dismiss="modal">닫기</button>
           <button type="button" id="find_success" class="btn btn-primary btn-sm" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
    </div>
</body>
</html>