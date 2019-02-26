<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.aa {
width:100px;
}
.tt{
height: 60px;
}

.body{
margin: 50px;
}

</style>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

</head>
<body id="body" class="body">

<div class="container">


	<h1>${ apvDto.apv_cate_name }</h1>

	<div class="text-right">
		<table border="1" style="display: inline-block">
		
		<tr>
		<td class="tt" rowspan='3'>결재</td>
		<td class="aa">
			<c:choose>
			
				<c:when test="${ apvDto.rank_name == null }">입사대기</c:when>
				<c:otherwise>${ apvDto.rank_name }</c:otherwise>
				
			</c:choose>
		</td>
		
		<td class="aa">
			<c:choose>
			
				<c:when test="${ apvDto.rank_name1 == null }"><c:if test="${ not empty apvDto.member_name1 }">입사대기</c:if></c:when>
				<c:otherwise>${ apvDto.rank_name1 }</c:otherwise>
				
			</c:choose>
		</td>
		<td class="aa">
			<c:choose>
			
				<c:when test="${ apvDto.rank_name2 == null }"><c:if test="${ not empty apvDto.member_name2 }">입사대기</c:if></c:when>
				<c:otherwise>${ apvDto.rank_name2 }</c:otherwise>
				
			</c:choose>
		</td>
				<td class="aa">
			<c:choose>
			
				<c:when test="${ apvDto.rank_name3 == null }"><c:if test="${ not empty apvDto.member_name3 }">입사대기</c:if></c:when>
				<c:otherwise>${ apvDto.rank_name3 }</c:otherwise>
				
			</c:choose>
		</td>
		</tr>
		
		
		
		<tr>
		
		<td>${ apvDto.member_name }</td>
		<td id="authName1">${ apvDto.member_name1 }</td>
		<td id="authName2">${ apvDto.member_name2 }</td>
		<td id="authName3">${ apvDto.member_name3 }</td>
		
		</tr>
		
		<tr>
		
		<td>제출</td>
		<td id="authName1">${ apvDto.apv_auth_name1 }</td>
		<td id="authName2">${ apvDto.apv_auth_name2 }</td>
		<td id="authName3">${ apvDto.apv_auth_name3 }</td>
		
		</tr>
		
		</table>
	</div>
	
	
	<div>
	<table border="1">
	
	<tr>
	<th>문서상태</th>
	
			<c:choose>
			
				<c:when test="${ empty apvDto.member_name3 || apvDto.approval_auth3 == 3 || apvDto.approval_auth3 == 4 }">
					<c:choose>
						<c:when test="${ empty apvDto.member_name2 || apvDto.approval_auth2 == 3 || apvDto.approval_auth2 == 4}">
							<td>${ apvDto.apv_auth_name1 }</td>
						</c:when>
						<c:when test="${ apvDto.approval_auth2 == 0 && apvDto.approval_auth1 == 0 }">
							<td>${ apvDto.apv_auth_name1 }</td>
						</c:when>						
						<c:when test="${ apvDto.approval_auth2 == 4 }">
							<td>${ apvDto.apv_auth_name1 }</td>
						</c:when>
						<c:otherwise>
							<td>${ apvDto.apv_auth_name2 }</td>
						</c:otherwise>
					</c:choose>
				</c:when>
				
				<c:when test="${ apvDto.approval_auth2 == 0 }">
					<td>${ apvDto.apv_auth_name1 }</td>
				</c:when>
				<c:when test="${ apvDto.approval_auth2 == 3 && apvDto.approval_auth1 == 0 }">
					<td>${ apvDto.apv_auth_name1 }</td>
				</c:when>
				<c:otherwise>
					<td>${ apvDto.apv_auth_name3 }</td>
				</c:otherwise>
			
			</c:choose>
	
	<th>문서번호</th>
	<td>${ apvDto.approval_cate }_${ apvDto.approval_id }</td>
	</tr>
	
	<tr>
	<th>제출일자</th>
	<td colspan="3"><fmt:formatDate value="${ apvDto.approval_indate }"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
	
	<tr>
	<th>결재구분</th>
	<td colspan="3">${ apvDto.apv_cate_name }</td>
	</tr>
	
	<tr>
	<th>제출부서</th>
	<td colspan="3">
		<c:choose>
			
			<c:when test="${ apvDto.department_name == null }">발령대기</c:when>
			<c:otherwise>${ apvDto.department_name }</c:otherwise>
				
		</c:choose>
	</td>
	</tr>
	
	<tr>
	<th>기안담당</th>
	<td colspan="3">${ apvDto.member_name }&nbsp;&nbsp;${ apvDto.rank_name }</td>
	</tr>
	
	<tr>
	<th>제목</th>
	<td colspan="3">${ apvDto.approval_title }</td>
	</tr>
	
	<tr>
	<td colspan="4"></td>
	</tr>
	
	</table>
	
	<table border="1">
	<tr>
	<th>년월일</th>
	<th>내용</th>
	<th>금액</th>
	<th>지급은행</th>
	<th>계좌번호</th>
	<th>예금주</th>
	<th>비고</th>
	</tr>
	
	<tbody>
	
	<c:forEach var="item" items="${ payList }" >
	
	<tr>
	
	<td><fmt:formatDate value="${ item.pay_date }"  pattern="yyyy-MM-dd"/></td>
	<td>
		<c:forEach var="i" begin="2" end="6">
		<c:if test="${ i == item.pay_title }">${ titleMap[i] }</c:if>
		</c:forEach>
	</td>
	<td num="${ item.pay_cash }" class="payCash">${ item.pay_cash }</td>
	<td>
		<c:forEach var="i" begin="2" end="6">
		<c:if test="${ i == item.pay_bank }">${ bankMap[i] }</c:if>
		</c:forEach>
	</td>
	<td>${ item.pay_deposit }</td>
	<td>${ item.pay_dpowner }</td>
	<td>${ item.pay_comment }</td>
	
	</tr>
	
	</c:forEach>
	
	</tbody>
	</table>
	
	<div>총 금액 <span id="totalPay"></span></div>
	
	${ apvDto.approval_content }
	
	</div>
	
	
	<div>
	
	<!-- 파일 다운로드 -->
	<a href="${pageContext.request.contextPath }/approval/down?path=${ apvDto.approval_filepath }">${ apvDto.approval_filename }</a>
	
	</div>
	
	<div class="text-right">
		<p style="font-weight: bold;">(주)그룹웨어</p>
	</div>

	<table border="1" >
	
	<tr>
	<th rowspan="3">결재기록</th>
	<td style="height: 30px;"><c:if test="${ not empty apvDto.approval_auth_date1 }">[<fmt:formatDate value="${ apvDto.approval_auth_date1 }"  pattern="yyyy-MM-dd HH:mm:ss"/>]&nbsp;&nbsp;${ apvDto.department_name1 }&nbsp;${ apvDto.member_name1 }&nbsp;${ apvDto.rank_name1 }&nbsp;<Strong>${ apvDto.apv_auth_name1 }</Strong></c:if></td>
	</tr>
	<tr>
	<td style="height: 30px;"><c:if test="${ not empty apvDto.approval_auth_date2 }">[<fmt:formatDate value="${ apvDto.approval_auth_date2 }"  pattern="yyyy-MM-dd HH:mm:ss"/>]&nbsp;&nbsp;${ apvDto.department_name2 }&nbsp;${ apvDto.member_name2 }&nbsp;${ apvDto.rank_name2 }&nbsp;<Strong>${ apvDto.apv_auth_name2 }</Strong></c:if></td>
	</tr>
	<tr>
	<td style="height: 30px;"><c:if test="${ not empty apvDto.approval_auth_date3 }">[<fmt:formatDate value="${ apvDto.approval_auth_date3 }"  pattern="yyyy-MM-dd HH:mm:ss"/>]&nbsp;&nbsp;${ apvDto.department_name3 }&nbsp;${ apvDto.member_name3 }&nbsp;${ apvDto.rank_name3 }&nbsp;<Strong>${ apvDto.apv_auth_name3 }</Strong></c:if></td>
	</tr>
	
	<c:if test="${ not empty apvDto.approval_return }">
	<th>반려사유</th>
	<td>${ apvDto.approval_return }</td>
	</c:if>

	<c:choose>
	<c:when test="${ fn:contains(apvDto.approval_cc, 'wantToDel') }">
		<p style="color: red;">작성자의 삭제요청에 따른 삭제 대기 결재입니다.</p>
		<p id="delReason"></p>
	</c:when>
	<c:when test="${ not empty apvDto.approval_cc }">
	<th>임시저장 태그</th>
	<td>${ apvDto.approval_cc }</td>
	</c:when>
	</c:choose>
	</table>
	
</div>

<div class="float-left">
	<button onclick="history.back()">뒤로</button>
	<input type="button" value="인쇄" onclick="window.print()" />

</div>

<c:choose>
<%-- 임시저장 문서 --%>
<c:when test="${ auth == 2 }">
	<div class="float-right">
		<button onclick="reWrite()">재작성</button>
		<button onclick="deleteApv()">삭제</button>
	</div>
</c:when>

<%-- 관리자 삭제 버튼 --%>
<c:when test="${ auth == 3 }">
	<div class="float-right">
		<button onclick="deleteApv()" >삭제</button>
	</div>
</c:when>


<%-- 삭제 요청 버튼 --%>
<c:when test="${ apvDto.approval_member_id == sessionScope.member.member_id }">
	<div class="float-right">
		<button data-toggle="modal" data-target="#wantToDel" >삭제</button>
	</div>
</c:when>
</c:choose>


<c:if test="${ apvDto.approval_member_id == sessionScope.member.member_id && ( apvDto.approval_auth1 == 2 || apvDto.approval_auth2 == 2 || apvDto.approval_auth3 == 2 ) }">
<div class="float-right">
	<button onclick="reWrite()">재상신</button>
</div>
</c:if>

<c:if test="${ not empty auth }">
	<div class="float-right" id="authDiv">
		
	</div>
</c:if>

<form id="approve" action="${ pageContext.request.contextPath }/approval/approve" method="POST">
	<input type="hidden" id="where" name="where"> 
	<input type="hidden" id="what" name="what"> 
	<input type="hidden" id="why" name="why">
	<input type="hidden" id="approval_id" name="approval_id" value="${ apvDto.approval_id }">
</form>



	<!-- 반려 사유 -->
	<div class="modal" id="returning">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">반려</h4>
					<button type="button" class="close float-right" data-dismiss="modal">&times;</button>
				</div>

					<div class="form-group">
						<div class="modal-body">
							<h5>
								<label>반려 사유를 입력해주세요.</label>
							</h5>
							<input class="form-control" name="approval_return" type="text" id="approval_return" />
						</div>
						<div class="modal-footer">
							<button class="btn btn-dark" type="submit" onclick="returning()" >제출</button>
						</div>
					</div>
			</div>
		</div>
	</div>
	
		<!-- 삭제요청 코멘트 -->
	<div class="modal" id="wantToDel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">삭제요청</h4>
					<button type="button" class="close float-right" data-dismiss="modal">&times;</button>
				</div>

					<div class="form-group">
						<div class="modal-body">
							<h5>
								<label>삭제요청 사유를 입력해주세요.</label>
							</h5>
							<input class="form-control" name="delReason" type="text" id="delReason" />
						</div>
						<div class="modal-footer float-right">
							<button class="btn btn-dark float-right" type="submit" onclick="funcWantToDel()" >요청</button>
						</div>
						<div class="float-left" style="padding: 0 0 0 20px">
							<label>관리자의 승인 후 삭제됩니다</label><br>
							<label>최종 삭제의 경우 시간이 걸릴 수 있습니다.</label>
						</div>
					</div>
			</div>
		</div>
	</div>



<script>

$(document).ready(function(){
	if(${ sessionScope.member.member_status == 9 or apvDto.approval_member_id == sessionScope.member.member_id }){
		var approval_cc = '${ apvDto.approval_cc }';
		var reason = approval_cc.split('_');
		$('#delReason').text("삭제 요청 사유"+reason[1]);
	}
})

 

var arr = $('.payCash');
console.log(arr);
var result = 0;
for(var e = 0 ; e < arr.length ; e++){
	console.log(e);
	console.log(arr[e]);
	console.log(arr[e].innerHTML);
	result += parseInt(arr[e].innerHTML);
}

console.log(result);

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$('#totalPay').text(numberWithCommas(result));

var where;
if(${ apvDto.approval_mem1 == sessionScope.member.member_id }){
	where = 1;
}
if(${ apvDto.approval_mem2 == sessionScope.member.member_id }){
	where = 2;
}
if(${ apvDto.approval_mem3 == sessionScope.member.member_id }){
	where = 3;
}

console.log(${ apvDto.approval_id })
console.log(${ sessionScope.member.member_id })
console.log(where)
	$('#where').val(where);

if(${ auth } == 1){
if( where == 1 ){
	$('<button></button>').text('승인').attr('onclick','auth()').appendTo('#authDiv');
	$('<button></button>').text('반려').attr('data-toggle','modal').attr('data-target','#returning').appendTo('#authDiv');
}else if( where == 2 ){
	if(${ apvDto.approval_auth1 != 2 }){
		if(${ apvDto.approval_auth1 == 0 }){
			console.log('예결가능')
			$('<button></button>').text('예결').attr('onclick','preAuth()').appendTo('#authDiv');
		}else{
			$('<button></button>').text('승인').attr('onclick','auth()').appendTo('#authDiv');
			$('<button></button>').text('반려').attr('data-toggle','modal').attr('data-target','#returning').appendTo('#authDiv');
		}
	}
}else if( where == 3 ){
	if(${ apvDto.approval_auth2 != 2 }){
		if(${ apvDto.approval_auth2 == 0 }){
			console.log('예결가능')
			$('<button></button>').text('예결').attr('onclick','preAuth()').appendTo('#authDiv');
		}else{
			$('<button></button>').text('승인').attr('onclick','auth()').appendTo('#authDiv');
			$('<button></button>').text('반려').attr('data-toggle','modal').attr('data-target','#returning').appendTo('#authDiv');
		}
	}
}
}

var doubleSubmitFlag = true;

if(doubleSubmitFlag){
	function auth(){
		if(confirm('정말 승인 하시겠습니까?')){
			$('#what').val(1);
			$('#approve').submit();
		}
	}
	function returning(){
		if($('#approval_return').val().trim() == ''){
			alert('반려사유를 입력해주세요.');
			return;
		}
			$('#what').val(2);
			$('#why').val($('#approval_return').val());
			$('#approve').submit();
	}
	function preAuth(){
		if(confirm('정말 예결 하시겠습니까?')){
			$('#what').val(3);
			$('#approve').submit();
		}
	}
	doubleSubmitFlag = false;
}

function reWrite(){
	console.log("reWrite()");
	console.log(${ apvDto.approval_id })
	
	$('<form></form>').attr('id','reWriteGo').attr('action','${ pageContext.request.contextPath }/approval/reWrite').attr('method','POST').appendTo('#body');
	$('<input>').attr('type', 'hidden').attr('value','${ apvDto.approval_id }').attr('name','approval_id').appendTo('#reWriteGo');
	$('<input>').attr('type', 'hidden').attr('value','${ apvDto.approval_cate }').attr('name','reApproval').appendTo('#reWriteGo');
	$('#reWriteGo').submit();
	
}

function deleteApv(){
	if(confirm('정말 삭제하시겠습니까?')){
	$('<form></form>').attr('id','deletetemp').attr('action','${ pageContext.request.contextPath }/approval/deleteTemp').attr('method','POST').appendTo('#body');
	$('<input>').attr('type', 'hidden').attr('value','${ apvDto.approval_id }').attr('name','approval_id').appendTo('#deletetemp');

	$('<input>').attr('type', 'hidden').attr('value','${ auth }').attr('name','auth').appendTo('#deletetemp');
	
	$('#deletetemp').submit();
	}
}

function funcWantToDel(){
	if($('#delReason').val().trim() == ''){
		alert('삭제요청 사유를 입력하세요');
		return;
	}
	$('<form></form>').attr('id','delWant').attr('action','${ pageContext.request.contextPath }/approval/delWant').attr('method','POST').appendTo('#body');
	$('<input>').attr('type', 'hidden').attr('value','${ apvDto.approval_id }').attr('name','approval_id').appendTo('#delWant');
	$('<input>').attr('type', 'hidden').attr('value',$('#delReason').val()).attr('name','approval_cc').appendTo('#delWant');
	$('#delWant').submit();
}


</script>

</body>
</html>