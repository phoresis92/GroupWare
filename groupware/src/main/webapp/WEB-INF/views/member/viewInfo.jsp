<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <!-- 추가 -->
  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>회원정보조회</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member_view.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">

<style>
.filebox input[type="file"], .filebox input[type="button"] { /* 파일 필드 숨기기 */ 
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}

</style>
</head>
<body><!-- oncontextmenu="return false" ondragstart="return false" onselectstart="return false" 드래그 방지 -->

<h3>${m.member_name}님 정보</h3>

<table class="table table-bordered">

<tr>
<td colspan="3" rowspan="5" align="center" style="vertical-align: middle;">
	<c:choose>
		<c:when test="${empty m.member_img}">
			<c:choose>
				<c:when test="${m.member_gender eq '남'}">
					<img src="../resources/img/m_img.png" alt="사진" width="120px" height="150px">
				</c:when>
				<c:otherwise>
					<img src="../resources/img/f_img.png" alt="사진" width="120px" height="150px">
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<img src="${m.member_img}" alt="사진" width="120px" height="150px">
		</c:otherwise>
	</c:choose>
</td>
<td>사번</td>
<td>${m.member_id}</td>
<td>이메일</td>
<td colspan="3">${m.member_email}</td>
</tr>

<tr>
<td>이름</td>
<td>${m.member_name}</td>
<td>생년월일</td>
<td>${m.member_birth}</td>
<td>성별</td>
<td id="gender">${m.member_gender}</td>
</tr>

<tr>
<td>소속법인</td>
<td>KIT Groupware</td>
<td>부서</td>
<td><input type="hidden" id="m_dept" value="${m.member_department}"><span id="dept">${m.department_name}</span></td>
<td>직책</td>
<td><input type="hidden" id="m_rank" value="${m.member_rank}"><span id="rank">${m.rank_name}</span></td>
</tr>

<tr>
<td>재직여부</td>
<td><span id="hire"></span></td>
<td>입사일</td>
<td>${m.member_indate}</td>
<td>연차</td>
<td>${service}</td>
</tr>

<tr>
<td>상태</td>
<td><input type="hidden" id="m_status" value="${m.member_status}"><span id="status"></span></td>
<td>계좌정보</td>
<td><input type="hidden" id="m_deposit" value="${deposit.depo_bank_id}"><span id="deposit"></span></td>
<td colspan="2">${deposit.depo_number}</td>
</tr>

<tr>
<td colspan="3" rowspan="3" align="center" style="vertical-align: middle;" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<c:choose>
		<c:when test="${empty m.member_sign}">
			<img src="../resources/img/sign.jpg" alt="싸인" width="45px" height="45px">
		</c:when>
		<c:otherwise>
			<img src="${m.member_sign}" alt="싸인" width="45px" height="45px">
		</c:otherwise>
	</c:choose>
</td>
<td>전화번호</td>
<td>${m.member_phone}</td>
<td>타메일(업무용)</td>
<td colspan="3">${account.email_account}</td>
</tr>

<tr>
<td>우편번호</td>
<td>${m.member_address1}</td>
<td>주소</td>
<td colspan="3">${sessionScope.member.member_address2}</td>
</tr>

<tr>
<td>상세주소</td>
<td colspan="3">${m.member_address3}</td>
<td>최종수정일</td>
<td>${m.member_modidate}</td>
</tr>

</table>

<!-- 수정 버튼 -->
<c:if test="${sessionScope.member.member_id eq m.member_id}">
<table class="table-sm">
<tr>
<td>
<div class="form-group textbox">
<label for="member_pw">비밀번호</label>
<input type="password" class="form-control" id="member_pw" name="member_pw" maxlength="16" style="ime-mode: disabled;">
</div>
<td>
<div class="form-group textbox">
<button type="button" id="editinfo" class="btn btn-secondary">수정하기</button>
</div>
</td>
</tr>
</table>
</c:if>

<!-- 수정 -->
<div id="edit" class="container-fluid commonbox" style="display: none;">
<div class="content">

<form action="${pageContext.request.contextPath}/member/edit" method="post" enctype="multipart/form-data">
<input type="hidden" name="member_id" value="${m.member_id}">
<input type="hidden" name="depo_member_id" value="${m.member_id}">

<table class="table table-sm">
<tr>
<td rowspan="4" align="center" style="vertical-align: middle;">
	<c:choose>
		<c:when test="${empty m.member_img}">
			<c:choose>
				<c:when test="${m.member_gender eq '남'}">
					<img id="file_img" src="../resources/img/m_img.png" alt="사진" width="120px" height="150px">
				</c:when>
				<c:otherwise>
					<img id="file_img" src="../resources/img/f_img.png" alt="사진" width="120px" height="150px">
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<img id="file_img" src="${m.member_img}" alt="사진" width="120px" height="150px">			
		</c:otherwise>
	</c:choose>
</td>
<td colspan="2">
<!-- 이메일 -->
<div class="form-group textbox" >
	<label for="member_email">이메일</label>
	<input type="text" class="form-control" id="member_email" name="member_email" maxlength="30" value="${m.member_email}">
</div>
</td>
<td>
<div class="custom-control custom-checkbox">
	<input type="checkbox" class="custom-control-input"	id="checked_email" name="checked_email" ${m.member_email eq account.email_account ? 'checked' : ''}>
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
<div class="form-group textbox">
	<label for="bank_id">은행</label>
	<select class="form-control" id="bank_id" name="depo_bank_id">		
		<option value="2">우리은행</option>
		<option value="3">농협은행</option>
		<option value="4">신한은행</option>		
	</select>
</div>
</td>
<td colspan="2">
<!-- 계좌 -->
<div class="form-group textbox" >
	<label for="member_deposit">계좌</label>
	<input type="text" class="form-control" id="member_deposit" name="depo_number" maxlength="30" value="${deposit.depo_number}">
</div>
</td>
</tr>
<tr>
<td>
<!-- 주소 -->
<div class="form-group textbox mr-3"> 
	<label for="sample6_postcode">우편번호</label>
	<input type="text" class="form-control" id="sample6_postcode" name="member_address1" value="${m.member_address1}" readonly tabindex="-1">	
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
<div class="filebox">
<input type="hidden" name="member_img" value="${m.member_img}"/>
<label class="btn btn-success" for="change_img">변경</label>
<input id="change_img" type="file" name="img_file" accept="image/*"/>
<label class="btn btn-success" for="clear_img">초기화</label>
<input id="clear_img" type="button"/>
</div>
</td>
<td colspan="3">
<div class="form-group textbox">
	<label for="sample6_address">주소</label>
	<input type="text" class="form-control" id="sample6_address" name="member_address2" value="${m.member_address2}" readonly tabindex="-1">
</div>
</td>
</tr>
<tr>
<td  align="center" style="vertical-align: middle;" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<c:choose>
		<c:when test="${empty m.member_sign}">
			<img id="file_sign" src="../resources/img/sign.jpg" alt="싸인" width="45px" height="45px">
		</c:when>
		<c:otherwise>
			<img id="file_sign" src="${m.member_sign}" alt="싸인" width="45px" height="45px">			
		</c:otherwise>
	</c:choose>
</td>
<td colspan="3">
<div class="form-group textbox">
	<label for="sample6_detailAddress">상세주소</label>
	<input type="text" class="form-control" id="sample6_detailAddress" name="member_address3" value="${m.member_address3}">	
	<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
</div>
</td>
</tr>
<tr>
<td>
<div class="filebox">
<input type="hidden" name="member_sign" value="${m.member_sign}"/>
<label class="btn btn-success" for="change_sign">변경</label>
<input type="file" id="change_sign" name="sign_file" accept="image/*"/>
<label class="btn btn-success" for="clear_sign">초기화</label>
<input id="clear_sign" type="button"/>
</div>
</td>
<td>
<!-- 휴대폰번호 -->
<div class="form-group textbox">
	<label for="member_phone">휴대폰번호(-없이 입력)</label>
	<input type="text" class="form-control" id="member_phone" name="member_phone" maxlength="11" value="${m.member_phone}">
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

<!-- The Modal -->
  <div class="modal fade" id="modal_manager_edit">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">정보 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>          
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
      		<form id="form_edit_member" action="${pageContext.request.contextPath}/manager/memberEdit" method="post">
      		<input type="hidden" name="member_id" value="${m.member_id}">
        	<!-- 부서 -->
			<div class="form-group textbox">
				<label for="member_department">부서</label>
				<select class="form-control" id="member_department" name="member_department">
					<c:forEach var="dept" items="${dept}">
						<option value="${dept.department_id}">${dept.department_name}</option>		
					</c:forEach>		
				</select>
			</div>
        		
        	<!-- 직급 -->
			<div class="form-group textbox">
				<label for="member_rank">직급</label>
				<select class="form-control" id="member_rank" name="member_rank">
					<c:forEach var="rank" items="${rank}">
						<option value="${rank.rank_id}">${rank.rank_name}</option>		
					</c:forEach>
				</select>
			</div>
        			
        	<!-- 직급 -->
			<div class="form-group textbox">
				<label for="member_status">상태</label>
				<select class="form-control" id="member_status" name="member_status">
					<option value="0">승인대기</option>
					<option value="1">대기</option>
					<option value="2">재직</option>
					<option value="3">퇴직</option>
					<option value="4">정지</option>
					<option value="5">휴가</option>
					<option value="9">관리자</option>
				</select>
			</div>
			</form>        			
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
     	   <button type="button" id="modal_edit_member" class="btn btn-primary btn-sm" data-dismiss="modal">수정</button>
           <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">닫기</button>
        </div>
        
      </div>      
    </div>
  </div>
  
<!-- 매니저 수정 버튼 -->
<c:if test="${sessionScope.member.member_status eq '9' && sessionScope.member.member_status != m.member_status}">
	<c:choose>
		<c:when test="${sessionScope.member.member_status eq '0'}">
			<a id="authorization" class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/manager/authorization?member_id=${member.member_id}">승인</a>
		</c:when>
		<c:otherwise>
			<a id="btn_manager_edit" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#modal_manager_edit">수정</a>
		</c:otherwise>
	</c:choose>
	<a class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/manager/member?page=1">목록</a>	
</c:if>  
</body>
</html>