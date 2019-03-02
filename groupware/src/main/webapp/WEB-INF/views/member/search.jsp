<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

</head>
<body>
<div class="container">
<div class="row content">
<div class="col-sm"></div>
<div class="loginbox commonbox col-sm-7 col-md-6 col-lg-5">

<!-- Nav tabs -->
  <ul class="nav nav-tabs textbox">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#menu1">아이디 찾기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">비밀번호 찾기</a>
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
			<button id="btn_find_id" type="button" class="btn btn-primary">아이디 찾기</button>
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
			<button id="btn_find_pw" type="button" class="btn btn-primary">비밀번호 찾기</button>
		</div>
    </div>
  </div>
</div>

<div class="col-sm"></div>
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