<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">


<script>
$(function(){
	$("#checked_email").click(function(){
		if ($("#checked_email").is(':checked')){
			$("#email_account").val($("#member_email").val());
			$(this).parent().addClass('focus');
		} else{
			$("#email_account").val("");
			$(this).parent().removeClass('focus');
		}	
	});	
	$("#editinfo").click(function(){
		var flag = true;
		if ($("#member_pw").val() == "") {
			$("#member_pw").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if (flag == true){
			var id = $("input[name='member_id']").val();
			var pw = $("#member_pw").val();
			var param = "member_id="+id+"&member_pw="+pw;
			$.ajax({
				type:"POST",
				url:"../member/checkLogin",
				data:param,
				success:function(data){
					var obj = eval('('+data+')');
					if(obj.value){
						$('#edit').collapse('toggle');
						if ($('#member_pw').attr('readonly') != 'readonly'){
							$('#member_pw').attr('readonly',true);
						} else{
							$('#member_pw').attr('readonly',false);
						}						
					}else{
						$("#member_pw").siblings("[data-toggle='tooltip']").tooltip('show');
					}
				}
			});				
		} 
	});
})

</script>
</head>
<body>

<h3>${sessionScope.member.member_name}님 정보</h3>
<table class="table table-bordered">

<tr>
<td colspan="3" rowspan="5"><img src="${sessionScope.member.member_img}" alt="사진" width="120px" height="150px"></td>
<td>사번</td>
<td>${sessionScope.member.member_id}</td>
<td>이메일</td>
<td colspan="3">${sessionScope.member.member_email}</td>
</tr>

<tr>
<td>이름</td>
<td>${sessionScope.member.member_name}</td>
<td>생년월일</td>
<td>${sessionScope.member.member_birth}</td>
<td>성별</td>
<td>${sessionScope.member.member_gender}</td>
</tr>

<tr>
<td>소속법인</td>
<td>KIT Groupware</td>
<td>부서</td>
<td>${sessionScope.member.member_department}</td>
<td>직책</td>
<td>${sessionScope.member.member_rank}</td>
</tr>

<tr>
<td>재직여부</td>
<td></td>
<td>입사일</td>
<td>${sessionScope.member.member_indate}</td>
<td></td>
<td></td>
</tr>

<tr>
<td>호봉</td>
<td></td>
<td></td>
<td colspan="3"></td>
</tr>

<tr>
<td colspan="3" rowspan="3"><img src="${sessionScope.member.member_sign}" alt="싸인" width="45px" height="45px"></td>
<td>전화번호</td>
<td>${sessionScope.member.member_phone}</td>
<td>타메일(업무용)</td>
<td colspan="3">${account.email_account}</td>
</tr>

<tr>
<td>우편번호</td>
<td>${sessionScope.member.member_address1}</td>
<td>주소</td>
<td colspan="3">${sessionScope.member.member_address2}</td>
</tr>

<tr>
<td>상세주소</td>
<td colspan="3">${sessionScope.member.member_address3}</td>
<td>최종수정일</td>
<td>${sessionScope.member.member_modidate}</td>
</tr>

</table>

<!-- 수정 버튼 -->
<table class="table-bordered table-sm">
<tr>
<td>
<div class="form-group textbox">
<label for="member_pw">비밀번호</label>
<a href="#" data-toggle="tooltip" data-placement="left" title="비밀번호를 확인해주세요!"></a>
<input type="password" class="form-control" id="member_pw" name="member_pw" maxlength="16" style="ime-mode: disabled;">
</div>
<td>
<div class="form-group textbox">
<button type="button" id="editinfo" class="btn btn-secondary">수정하기</button>
</div>
</td>
</tr>
</table>


<!-- 수정 -->
<div id="edit" class="container-fluid collapse commonbox">
<div class="content">

<form action="${pageContext.request.contextPath}/member/edit" method="post" enctype="multipart/form-data">
<input type="hidden" name="member_id" value="${sessionScope.member.member_id}">

<table class="table table-bordered table-sm">
<tr>
<td rowspan="3">
<img src="${sessionScope.member.member_img}" alt="사진" width="120px" height="150px">
</td>
<td colspan="2">
<!-- 이메일 -->
<div class="form-group textbox" >
	<label for="member_email">이메일</label>
	<input type="text" class="form-control" id="member_email" name="member_email" maxlength="30" value="${sessionScope.member.member_email}">
</div>
</td>
<td>
<div class="custom-control custom-checkbox">
	<input type="checkbox" class="custom-control-input"	id="checked_email" name="checked_email" ${sessionScopr.member.member_email eq account.email_account ? 'checked' : ''}>
	<label class="custom-control-label" for="checked_email">업무 이메일로 사용</label>
</div>
</td>
</tr>
<tr>
<td colspan="2">
<!-- 업무 메일 -->
<div class="form-group textbox">
	<label for="email_account">업무 메일(gmail만 가능)</label>
	<input type="text" class="form-control" id="email_account" name="email_account" maxlength="30" value="${account.email_account}">
</div>
</td>
<td>
<!-- 업무 메일 비밀번호 -->
<div class="form-group textbox">
	<label for="email_pw">업무 메일 비밀번호</label>
	<input type="password" class="form-control" id="email_pw" name="email_pw" maxlength="16" style="ime-mode: disabled;" value="${account.email_pw}">
</div>
</td>
</tr>
<tr>
<td>
<!-- 주소 -->
<div class="form-group textbox mr-3"> 
	<label for="sample6_postcode">우편번호</label>
	<input type="text" class="form-control" id="sample6_postcode" name="member_address1" value="${sessionScope.member.member_address1}" readonly tabindex="-1">	
</div>
</td>
<td>
<div class="form-group textbox">
	<input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
</div>
</td>
<td></td>
</tr>
<tr>
<td>
변경<input type="file" name="img_file" size="5px"/>
<button type="button">초기화</button>
</td>
<td colspan="3">
<div class="form-group textbox">
	<label for="sample6_address">주소</label>
	<input type="text" class="form-control" id="sample6_address" name="member_address2" value="${sessionScope.member.member_address2}" readonly tabindex="-1">
</div>
</td>
</tr>
<tr>
<td>
<img src="${sessionScope.member.member_sign}" alt="싸인" width="45px" height="45px">
</td>
<td colspan="3">
<div class="form-group textbox">
	<label for="sample6_detailAddress">상세주소</label>
	<input type="text" class="form-control" id="sample6_detailAddress" name="member_address3" value="${sessionScope.member.member_address3}">	
	<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
</div>
</td>
</tr>
<tr>
<td>
변경<input type="file" name="sign_file">
<button type="button">초기화</button>
</td>
<td>
<!-- 휴대폰번호 -->
<div class="form-group textbox">
	<label for="member_phone">휴대폰번호(-없이 입력)</label>
	<input type="text" class="form-control" id="member_phone" name="member_phone" maxlength="11" value="${sessionScope.member.member_phone}">
</div>
</td>
<td></td>
<td>
<!-- 수정 버튼 -->
<div class="form-group textbox">
<button type="submit" class="btn btn-secondary">저장</button>
</div>
</td>
</tr>
</table>
</form>
</div>
</div>
<br>
</body>
</html>