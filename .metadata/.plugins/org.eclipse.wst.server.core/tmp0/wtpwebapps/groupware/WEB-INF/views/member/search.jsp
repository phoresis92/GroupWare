<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<style>
body { 
	background: url('${pageContext.request.contextPath}/resources/img/background.jpg') no-repeat 50% 50% fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	 background-size: cover;
}
a {color: #000000 !important;background:blue;}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/search.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	$("#frm1").submit(function() {
		var findid = true;
		if ($("#member_name1").val() == "") {
			$("#member_name1").siblings("[data-toggle='tooltip']").tooltip('show');
			findid = false;
		}
		if ($("#member_birth1").val() == "") {
			$("#member_birth1").siblings("[data-toggle='tooltip']").tooltip('show');
			findid = false;
		}
		if (findid) {
			return true;
		}
		return false;
	});
	$("#frm2").submit(function() {
		var findpw = true;
		if ($("#member_id2").val() == "") {
			$("#member_id2").siblings("[data-toggle='tooltip']").tooltip('show');
			findpw = false;
		}
		if ($("#member_name2").val() == "") {
			$("#member_name2").siblings("[data-toggle='tooltip']").tooltip('show');
			findpw = false;
		}
		if ($("#member_birth2").val() == "") {
			$("#member_birth2").siblings("[data-toggle='tooltip']").tooltip('show');
			findpw = false;
		}
		if (findpw) {
			return true;
		}
		return false;
	});
	// Label Zoom 효과 - input 선택했을 때
	$("input").focus(function() {
		// 'textbox' class가 적용된 태그 안에서 input[type="text"], input[type="password"] 검색
	    var $input = $('.textbox').find('input[type="text"]');
	    $input.on({
	        'focus': function () { // input 태그가 focus를 가지면 'focus' class 추가
	            $(this).parent().addClass('focus');
	        },
	        'blur': function () { // input 태그가 focus를 잃으면
	            if ($(this).val() == '') { // input 태그에  value값이 없으면 'focus' class 삭제
	                $(this).parent().removeClass('focus');                
	            } 
	            // 선택한 input에서 다른곳으로 focus가 이동하면 툴팁 숨기기
	            $(this).siblings("[data-toggle='tooltip']").tooltip('hide');           
	        }
	    });
	});
	// 찾기 중에 오류가 날 때 zoom 관련 css 초기화 되어 다시 설정
	$('input[type=text]').each(function () {
        if ($(this).val() !== '') { // input 태그가 value값을 가지면 'focus' class 추가
            // label focus
            $(this).closest('.textbox').addClass('focus');
        } else { // input 태그에  value값이 없으면 'focus' class 삭제
            $(this).closest('.textbox').removeClass('focus');
        }
    });
	//페이지 로딩 완료 후 focus 이동 - 처음에 label zoom 효과 안되는 오류 수정(임시방편)
	$(document).ready(function(){
		$("input[name='member_name']").focus();
		$("input[name='member_name']").blur();
	});
	$("a[data-toggle='tab']").click(function(){
		$("a[data-toggle='tooltip']").tooltip('hide');
	});
});
</script>
</head>
<body>
<div class="container">
<div class="row content">
<div class="col-sm"></div>
<div class="joinbox commonbox col-sm-5">

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
    	<form id="frm1" action="${pageContext.request.contextPath}/member/searchId" method="post">
    	
    	<!-- 이름 -->
		<div class="form-group textbox">
			<label for="member_name">이름</label>
			<a href="#" data-toggle="tooltip" data-placement="left" title="이름을 입력하세요!"></a>
			<input type="text" class="form-control" id="member_name1" name="member_name" maxlength="12">
		</div>
	
		<!-- 생년월일 -->
		<div class="form-group textbox">
			<label for="member_birth">생년월일(ex 19901231)</label>
			<a href="#" data-toggle="tooltip" data-placement="left" title="생년월일을 입력하세요!"></a>
			<input type="text" class="form-control" id="member_birth1" name="member_birth" maxlength="8">
		</div>
		
		<!-- 사번 찾기 버튼 -->
		<div class="form-group textbox">
			<button id="subBtn1" type="submit" class="btn btn-primary">사번 찾기</button>
		</div>
		</form>
    </div>
    
    <div id="menu2" class="container tab-pane fade"><br>
    	<form id="frm2" action="${pageContext.request.contextPath}/member/searchPw" method="post">
    	
    	<!-- 아이디 -->
		<div class="form-group textbox">
			<label for="member_id">아이디</label>
			<a href="#" data-toggle="tooltip" data-placement="left" title="아이디를 입력하세요!"></a>
			<input type="text" class="form-control" id="member_id2" name="member_id" maxlength="12">
		</div>
		
    	<!-- 이름 -->
		<div class="form-group textbox">
			<label for="member_name">이름</label>
			<a href="#" data-toggle="tooltip" data-placement="left" title="이름을 입력하세요!"></a>
			<input type="text" class="form-control" id="member_name2" name="member_name" maxlength="12">
		</div>
	
		<!-- 생년월일 -->
		<div class="form-group textbox">
			<label for="member_birth">생년월일(ex 19901231)</label>
			<a href="#" data-toggle="tooltip" data-placement="left" title="생년월일을 입력하세요!"></a>
			<input type="text" class="form-control" id="member_birth2" name="member_birth" maxlength="8">
		</div>
		
		<!-- 비밀번호 찾기 버튼 -->
		<div class="form-group textbox">
			<button id="subBtn2" type="submit" class="btn btn-primary">비밀번호 찾기</button>
		</div>
		</form>
    </div>
  </div>
</div>

<div class="col-sm"></div>
</div>
</div>
</body>
</html>