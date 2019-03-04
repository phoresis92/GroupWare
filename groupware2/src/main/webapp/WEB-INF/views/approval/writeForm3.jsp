<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    <c:set var="mem1" value="${ apvReWrite.approval_mem1 }" />
    <c:set var="mem2" value="${ apvReWrite.approval_mem2 }" />
    <c:set var="mem3" value="${ apvReWrite.approval_mem3 }" />
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
.table{
table-layout: fixed;
}

</style>

<!-- include libraries(jQuery, bootstrap) -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
 --><script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- jQuery -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!-- summernote -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>


  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">

$(document).on('focus',".datepick", function(){
    $(this).datepicker({
    	defaultDate: new Date(),
    	beforeShow: function (textbox, instance) {
		       var txtBoxOffset = $(this).offset();
		       var top = txtBoxOffset.top;
		       var left = txtBoxOffset.left;
		       var textBoxWidth = $(this).outerWidth();
		               setTimeout(function () {
		                   instance.dpDiv.css({
		                       top: top-210, //you can adjust this value accordingly  
		                       left: left//show at the end of textBox
		               });
		           }, 0);

		   }
    });
});

$(document).ready(function(){
	
	var result = 0 ;
	var arr = $('.calAmount');
	console.log(arr);
	for(var h = 0 ; h < arr.length ; h++){
		console.log(arr[h].value);
		if(arr[h].value.trim() != ''){
		result += parseInt(arr[h].value.trim());
		}
	}
	console.log(result);
	$('#totalResult').text(numberWithCommas(result));
	
	if(${ empty payList }){
		addRow();
	}else{
		/* $.ajax({
	    	data: form_data,
	    	type: "POST",
	    	url: '${ pageContext.request.contextPath}/approval/payList',
	    	cache: false,
	    	contentType: false,
	    	enctype: 'multipart/form-data',
	    	processData: false,
	    	success: function(img_name) {
	      		$(el).summernote('editor.insertImage', img_name);
	    	}
	  	}); */
	}
	
	
	
	$('#summernote').summernote({
		  lang: 'ko-KR',
	      height: 200,
	      popover: {
	    	  image:[],
	    	  link:[],
	    	  air:[]
	      } ,
	      toolbar: [
	    	    // [groupName, [list of button]]
	    	    ['style', ['bold', 'italic', 'underline', 'clear']],
	    	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    	    ['fontsize', ['fontsize']],
	    	    ['color', ['color']],
	    	    ['para', ['ul', 'ol', 'paragraph']],
	    	    ['table', ['table']],
	    	    ['insert', ['link', 'picture', 'hr']],
	    	    ['height', ['height']]
	    	  ],
	    	  focus: true,
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}
	  });
	  


}) // ready end

var i;
if(${ empty payList}){
	i = 0;
}else{
	i = ${fn:length(payList)};
}

console.log("this is i!!!! : "+i);

function addRow(){
	
	var arr = $('#tbody > tr');
	if(arr.length >9){
		alert('지출항목은 10개 까지 가능합니다.');
		return;
	}
	
	i++;
	
	
$('<tr></tr>').attr('id','Row'+i+'').appendTo('#tbody');
	
	$('<td></td>').attr('id','chkbox'+i+'').appendTo('#Row'+i+'');//선택
	$('<input/>').css('width','100%').attr('id','cb'+i+'').attr('type','checkbox').appendTo('#chkbox'+i+'');
	
	$('<td></td>').attr('id','date'+i+'').appendTo('#Row'+i+'');//년월일
	$('<input/>').css('width','100%').attr('id','datepk'+i+'').attr('class','datepick').appendTo('#date'+i+'');
	
	$('<td></td>').attr('id','title'+i+'').appendTo('#Row'+i+'');//내용
	$('<select></select>').css('width','100%').attr('id','titleSel'+i+'').appendTo('#title'+i+'');
	$('<option>선택</option>').attr('value','t1').appendTo('#titleSel'+i+'');
	$('<option>교통비</option>').attr('value','t2').appendTo('#titleSel'+i+'');
	$('<option>사무비품</option>').attr('value','t3').appendTo('#titleSel'+i+'');
	$('<option>출장비</option>').attr('value','t4').appendTo('#titleSel'+i+'');
	$('<option>식대</option>').attr('value','t5').appendTo('#titleSel'+i+'');
	$('<option>주유비</option>').attr('value','t6').appendTo('#titleSel'+i+'');
	
	$('<td></td>').attr('id','amount'+i+'').appendTo('#Row'+i+'');//금액
	$('<input/>').css('width','100%').attr('id','cashAmount'+i+'').attr('class','calAmount').attr('onkeydown','return onlyNumber(event)').attr('onkeyup','removeChar(event)').appendTo('#amount'+i+'');
	
	$('<td></td>').attr('id','bank'+i+'').appendTo('#Row'+i+'');//지급은행
	$('<select></select>').css('width','100%').attr('class','bSelect').attr('id','bankSel'+i+'').appendTo('#bank'+i+'');
	$('<option>은행선택</option>').attr('value','b1').appendTo('#bankSel'+i+'');
	$('<option>우리</option>').attr('value','b2').appendTo('#bankSel'+i+'');
	$('<option>신한</option>').attr('value','b3').appendTo('#bankSel'+i+'');
	$('<option>농협</option>').attr('value','b4').appendTo('#bankSel'+i+'');

	$('<td></td>').attr('id','depoN'+i+'').appendTo('#Row'+i+''); //계좌번호
	$('<input/>').css('width','100%').attr('value','${deposit.depo_number}').attr('id','depoNum'+i+'').attr('onkeydown','return onlyNumber(event)').attr('onkeyup','removeChar(event)').appendTo('#depoN'+i+'');
	
	$('<td></td>').attr('id','depoO'+i+'').appendTo('#Row'+i+''); //예금주
	$('<input/>').css('width','100%').attr('value','${sessionScope.member.member_name}').attr('id','depoOwn'+i+'').appendTo('#depoO'+i+'');
	
	$('<td></td>').attr('id','cc'+i+'').appendTo('#Row'+i+''); //비고
	$('<input/>').css('width','100%').attr('id','comment'+i+'').appendTo('#cc'+i+'');
	
	selectBank();
	
}//addRow end


function removeRow(){
	for(var j = 1 ; j < i+1 ; j++){
		console.log(j,$('#cb'+j+'').is(':checked'));
		if($('#cb'+j+'').is(':checked')){
			$('#Row'+j+'').remove();
		}
		
	}
	
	var arr = $('#tbody > tr');
	if(arr.length == 0){ 
		addRow();
	}
	
	removeChar();
	
}//removeRow end

function resetRow(){
	
	if(confirm('정말 초기화 하시겠습니까?')){
		$('#tbody').empty();
		addRow();
		removeChar();
	}
	
}//resetRow end

function selectBank(){
	$('.bSelect').val('b${deposit.depo_bank_id}')
}



function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
	
	var result = 0 ;
	var arr = $('.calAmount');
	console.log(arr);
	for(var h = 0 ; h < arr.length ; h++){
		console.log(arr[h].value);
		if(arr[h].value.trim() != ''){
		result += parseInt(arr[h].value.trim());
		}
	}
	console.log(result);
	$('#totalResult').text(numberWithCommas(result));
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


function sendFile(file, el) {
	var form_data = new FormData();
  	form_data.append('file', file);
  	$.ajax({
    	data: form_data,
    	type: "POST",
    	url: '${ pageContext.request.contextPath}/approval/apv_textImg',
    	cache: false,
    	contentType: false,
    	enctype: 'multipart/form-data',
    	processData: false,
    	success: function(img_name) {
      		$(el).summernote('editor.insertImage', img_name);
    	}
  	});
}


var doubleSubmitFlag = true;




function sendApv(){
	
	
	if('${mem1}' != null){
		$('#authId1').val(${mem1});
	}
	if('${mem2}' != null){
		$('#authId2').val(${mem1});
	}
	if('${mem3}' != null){
		$('#authId3').val(${mem1});
	}
	
	for(var i = 1 ; i <=3 ; i++){
		
		$('#authId'+i+'').val($('#apv_mem'+i+'').text())
		
	}
	
	if($('#authId1').val() == ''){
		alert('결재라인을 선택해주세요')
		console.log($('#authId1').val());
		return;
	}
	if(($('#approval_title').val()).trim() == ''){
		alert('제목을 입력해주세요')
		return;
	}
	if(($('#summernote').val()).trim() == ''){
		alert('내용을 입력해주세요')
		return;
	}
	
	
	var arr = $('#tbody > tr');
	for(var i = 0 ; i < arr.length ; i++){
		var num = (arr[i].id).slice(3);
		
		if($('#datepk'+num+'').val().trim() == ''){
			alert('지출항목의 년월일을 입력해주세요');
			return;
		}else if($('#titleSel'+num+'').val().trim() == 't1'){
			alert('지출항목의 내용을 선택하세요');
			return;
		}else if($('#cashAmount'+num+'').val().trim() == ''){
			alert('지출항목의 금액을 입력하세요');
			return;
		}else if($('#bankSel'+num+'').val().trim() == 'b1'){
			alert('지출항목의 지급은행을 선택하세요');
			return;
		}else if($('#depoNum'+num+'').val().trim() == ''){
			alert('지출항목의 계좌번호를 입력하세요');
			return;
		}else if($('#depoOwn'+num+'').val().trim() == ''){
			alert('지출항목의 예금주를 입력하세요');
			return;
		}
	}
	
	
	
	
	
	if(confirm('제출 이후에는 삭제하실 수 없습니다.\n정말 제출 하시겠습니까?')){
		if(doubleSubmitFlag){
			$('#approval_cc').val(null);
			
			
			//=========================================================================================
				
				
				
				
				for(var i = 0 ; i < arr.length ; i++){
					console.log(arr[i].id);
					console.log((arr[i].id).slice(3));
					var num = (arr[i].id).slice(3);
					/* 
					$('#datepk'+num+'').val() //년월일
					$('#titleSel'+num+'').val() //내용
					$('#cashAmount'+num+'').val() //금액
					$('#bankSel'+num+'').val() //지급은행
					$('#depoNum'+num+'').val() //계좌번호
					$('#depoOwn'+num+'').val() //예금주
					$('#comment'+num+'').val() //비고
					 */
					console.log($('#datepk'+num+'').val());
					console.log($('#titleSel'+num+'').val());
					console.log($('#cashAmount'+num+'').val());
					console.log($('#bankSel'+num+'').val());
					console.log($('#depoNum'+num+'').val());
					console.log($('#depoOwn'+num+'').val());
					console.log($('#comment'+num+'').val());
					
					
					/* $('<input></input>').attr('name','list['+i+'].pay_date').attr('value',$('#datepk'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('name','list['+i+'].pay_title').attr('value',$('#titleSel'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('name','list['+i+'].pay_cash').attr('value',$('#cashAmount'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('name','list['+i+'].pay_bank').attr('value',$('#bankSel'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('name','list['+i+'].pay_deposit').attr('value',$('#depoNum'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('name','list['+i+'].pay_dpowner').attr('value',$('#depoOwn'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('name','list['+i+'].pay_comment').attr('value',$('#comment'+num+'').val()).appendTo('#sendApv'); */
					
					/* $('<input></input>').attr('name','pay_date').attr('value',$('#datepk'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('name','pay_title').attr('value',$('#titleSel'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('name','pay_cash').attr('value',$('#cashAmount'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('name','pay_bank').attr('value',$('#bankSel'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('name','pay_deposit').attr('value',$('#depoNum'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('name','pay_dpowner').attr('value',$('#depoOwn'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('name','pay_comment').attr('value',$('#comment'+num+'').val()).appendTo('#sendApv'); */

					$('<input></input>').attr('type','hidden').attr('name','pay_date'+i).attr('value',$('#datepk'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('type','hidden').attr('name','pay_title'+i).attr('value',$('#titleSel'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('type','hidden').attr('name','pay_cash'+i).attr('value',$('#cashAmount'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('type','hidden').attr('name','pay_bank'+i).attr('value',$('#bankSel'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('type','hidden').attr('name','pay_deposit'+i).attr('value',$('#depoNum'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('type','hidden').attr('name','pay_dpowner'+i).attr('value',$('#depoOwn'+num+'').val()).appendTo('#sendApv');
					$('<input></input>').attr('type','hidden').attr('name','pay_comment'+i).attr('value',$('#comment'+num+'').val()).appendTo('#sendApv');

					
					
				}// for end
					$('<input></input>').attr('type','hidden').attr('name','maxCount').attr('value',arr.length).appendTo('#sendApv'); 
				
				/* .attr('type','hidden') */
				
			//=========================================================================================
		
			//console.log($(':radio[name="formList"]:checked').val());
			
			if('${ apvReWrite.approval_cate }' == '' || '${ apvReWrite.approval_cate }' == null){
				$('#apvCateGo').val(3);
			}else{
				$('<input></input>').attr('type','hidden').attr('value',${ apvReWrite.approval_id }).attr('name','approval_id').appendTo('#sendApv');
			}
			
			console.log($('#authId1').val());
			console.log($('#authId2').val());
			console.log($('#authId3').val());
			console.log($('#approval_title').val());
			console.log($('#summernote').val());
			console.log($('#apvCateGo').val());
			console.log($('#apv_comment').val());			
			
		$('#sendApv').submit();
			doubleSubmitFlag = false;
		
		}else{
			return;
		}
	}else{
		return;
	}
}// sendApv end

</script>

</head>
<body>

<div class="container">
<div class="container-fluid">

		<!-- 게시글 -->
 	<div class="col-lg-12">
 			
              <div class="card" >
                <div class="card-header py-3" align="center">
                  <h4><strong>[지출결재 작성]</strong></h4> 
     <table class="table table text-center">
       <tr><td><strong>제출자</strong>
	${ sessionScope.member.member_name }
	<c:choose>
	
	<c:when test="${ empty sessionScope.member.rank_name }">관리자</c:when>
	<c:otherwise>${ sessionScope.member.rank_name }</c:otherwise>
	
	</c:choose></td>
	<td><strong>제출부서</strong>
	
	<c:choose>
	
	<c:when test="${ sessionScope.member.department_name == null }">관리자</c:when>
	<c:otherwise>${ sessionScope.member.department_name }</c:otherwise>
	
	</c:choose></td>
	<td><strong>기안일자</strong> ${ now }</td>
	
	</tr>
     </table>
                 
                </div>
                
                
                
                <div class="card-body text-center">
                 
                 <!-- 결제칸 -->
    <input type="hidden" id="authDept1" name="authDept1" value="${ apvReWrite.department_name1 }">
	<input type="hidden" id="authDept2" name="authDept2" value="${ apvReWrite.department_name2 }">
	<input type="hidden" id="authDept3" name="authDept3" value="${ apvReWrite.department_name3 }">
	
	
                
                
               
    
    <!-- 감싸는테이블 -->
    <table width="100%">
	<tr><td align="center">
	<div>
		<button class="btn btn-outline-primary"" onclick="selectMem()">결재라인 추가</button>
	</div>
	
	</td>
	
	<td rowspan="3"> 
	<!-- 내부테이블 -->
	<table border="1" style="display: inline-block">
	
	<tr>
	<td class="tt" rowspan='3'>결재</td>
	<td class="aa">작성자</td>
	
	<td id="authRank1" class="aa">
	<c:choose>
		<c:when test="${ empty apvReWrite.rank_name1 }"><c:if test="${ not empty apvReWrite.member_name1 }">입사대기</c:if></c:when>
		<c:otherwise>${ apvReWrite.rank_name1 }</c:otherwise>
	</c:choose>
	</td>
	
	<td id="authRank2" class="aa">
	<c:choose>
		<c:when test="${ empty apvReWrite.rank_name2 }"><c:if test="${ not empty apvReWrite.member_name2 }">입사대기</c:if></c:when>
		<c:otherwise>${ apvReWrite.rank_name2 }</c:otherwise>
	</c:choose>
	</td>
	
	<td id="authRank3" class="aa">
	<c:choose>
		<c:when test="${ empty apvReWrite.rank_name3 }"><c:if test="${ not empty apvReWrite.member_name3 }">입사대기</c:if></c:when>
		<c:otherwise>${ apvReWrite.rank_name3 }</c:otherwise>
	</c:choose>
	</td>
		
	<tr>
	
	<td>${ sessionScope.member.member_name }</td>
	<td id="authName1">${ apvReWrite.member_name1 }</td>
	<td id="authName2">${ apvReWrite.member_name2 }</td>
	<td id="authName3">${ apvReWrite.member_name3 }</td>
	
	</tr>
	
	<tr>
	
	<td>${ sessionScope.member.member_id }</td>
	<td id="apv_mem1">${ apvReWrite.approval_mem1 }</td>
	<td id="apv_mem2">${ apvReWrite.approval_mem2 }</td>
	<td id="apv_mem3">${ apvReWrite.approval_mem3 }</td>
	
	</tr>
	
	</table></td>
	<tr><td>

</td></tr>
	<tr><td align="center">
	<button class="btn btn-outline-primary  btn-sm"  onclick="addRow()">지출항목 추가</button>
	<button class="btn btn-outline-primary  btn-sm"  onclick="removeRow()">지출항목 삭제</button>
	<button class="btn btn-outline-primary  btn-sm"  onclick="resetRow()">지출항목 초기화</button><br><br>
	<strong>총 결제금액 :<span id="totalResult"></span></strong> </td></tr>
	<tr><td colspan="2" align="left">
	

	</td></tr>
	
	
	</table>
	</div>
	<hr>
	
	
	<input type="hidden" id="authDept1" name="authDept1" value="${ apvReWrite.department_name1 }">
	<input type="hidden" id="authDept2" name="authDept2" value="${ apvReWrite.department_name2 }">
	<input type="hidden" id="authDept3" name="authDept3" value="${ apvReWrite.department_name3 }">
	
	<!-- 수정해주세요 ㅜㅜ -->


<table class="table" border=1>

		<tr>
			<th style="width:7%;" >선택</th>
			<th>년월일</th>
			<th>내용</th>
			<th>금액</th>
			<th>지급은행</th>
			<th>계좌번호</th>
			<th>예금주</th>
			<th>비고</th>
		</tr>
	
		
		<tbody id="tbody">
			<c:forEach var="item" items="${ payList }" varStatus="stat">
			<tr id="Row${ stat.count }">
				<td id="chkbox${ stat.count }">
					<input style="width:100%;" id="cb${ stat.count }" type="checkbox">
				</td>
				<td id="date${ stat.count }">
					<input style="width:100%;" id="datepk${ stat.count }" class="datepick" value="${ item.pay_date }">
				</td>
				<td id="title${ stat.count }">
					<select style="width:100%;" id="titleSel${ stat.count }" value="t${ item.pay_title }">
						<option value="t1">선택</option>
						<option value="t2">교통비</option>
						<option value="t3">사무비품</option>
						<option value="t4">출장비</option>
						<option value="t5">식대</option>
						<option value="t6">주유비</option>
					</select>
				</td>
				<td id="amount${ stat.count }">
					<input style="width:100%;" id="cashAmount${ stat.count }" class="calAmount" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" value="${ item.pay_cash }">
				</td>
				<td id="bank${ stat.count }">
					<select style="width:100%;" class="bSelect" id="bankSel${ stat.count }" value="b${ item.pay_bank }">
						<option value="b1">은행선택</option>
						<option value="b2">우리</option>
						<option value="b3">신한</option>
						<option value="b4">농협</option>
					</select>
				</td>
				<td id="depoN${ stat.count }">
					<input style="width:100%;" value="${item.pay_deposit}" id="depoNum${ stat.count }" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" value="${ item.pay_deposit }">
				</td>
				<td id="depoO${ stat.count }">
					<c:choose>
						<c:when test="${ empty item.pay_dpowner }">
							<input style="width:100%;" value="${sessionScope.member.member_name}" id="depoOwn${ stat.count }">
						</c:when>
						<c:otherwise>
							<input style="width:100%;" id="depoOwn${ stat.count }" value="${ item.pay_dpowner }">
						</c:otherwise>
					</c:choose>
				</td>
				<td id="cc${ stat.count }">
					<input style="width:100%;" id="comment${ stat.count }" value="${ item.pay_comment }">
				</td>
			</tr>
			
			<script>
			
			
			
			$('#bankSel${ stat.count }').val('b${ item.pay_bank }');
			$('#titleSel${ stat.count }').val('t${ item.pay_title }');
			
			</script>
			
			</c:forEach>
		</tbody>
	</table>
	
	
<form id="sendApv" action="${ pageContext.request.contextPath }/apv_payment/approval" method="POST" enctype="multipart/form-data"> <!-- ============================================================================================================================================================= -->
	

	<input type="hidden" id="authId1" name="approval_mem1" >
	<input type="hidden" id="authId2" name="approval_mem2" >
	<input type="hidden" id="authId3" name="approval_mem3" >
	<input type="hidden" id="apvCateGo" name="approval_cate" value="3">
	<input type="hidden" id="approval_cc" name="approval_cc" value="${ apvReWrite.approval_cc }">
	&nbsp;제목 : <input class="form-control" id="approval_title" type="text" name="approval_title" value="${ apvReWrite.approval_title }">
	<br>
	<div>
		<textarea id="summernote" name="approval_content" >
		<c:choose>
		<c:when test="${ empty apvReWrite.approval_content }">
		<!--StartFragment-->
		<table style="border: currentColor; border-collapse: collapse;"><tbody><tr><td valign="center" style="padding: 1.41pt; border: currentColor; width: 450.77pt; height: 56.96pt;"><p class="예스폼" style="text-align: center; font-family: 맑은 고딕; font-size: 20pt; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<span style="color: rgb(128, 0, 128); font-family: 맑은 고딕; font-size: 20pt; font-weight: bold;"><u>지출결의서</u></span></p></td></tr></tbody></table><!--StartFragment--><table style="border: currentColor; border-collapse: collapse;"><tbody><tr><td valign="center" style="background: rgb(243, 243, 243); border-width: 1.98pt 1.13pt 1.13pt; border-style: solid dotted dotted solid; border-color: rgb(0, 0, 0) rgb(160, 160, 160) rgb(160, 160, 160) rgb(243, 243, 243); padding: 1.41pt; width: 84.74pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; font-family: 맑은 고딕;"><span style="font-family: 맑은 고딕;">발의일자</span></p></td><td valign="center" style="border-width: 1.98pt 1.13pt 1.13pt; border-style: solid dotted dotted; border-color: rgb(0, 0, 0) rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 141.34pt; height: 20.32pt;">&nbsp;</td><td valign="center" style="background: rgb(243, 243, 243); border-width: 1.98pt 1.13pt 1.13pt; border-style: solid dotted dotted; border-color: rgb(0, 0, 0) rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 84.74pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: center; font-family: 맑은 고딕;"><span style="font-family: 맑은 고딕;">처리사항</span></p></td><td valign="center" style="border-width: 1.98pt medium 1.13pt 1.13pt; border-style: solid none dotted dotted; border-color: rgb(0, 0, 0) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 141.35pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="background: rgb(243, 243, 243); border-width: 1.13pt; border-style: dotted dotted dotted solid; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) rgb(243, 243, 243); padding: 1.41pt; width: 84.74pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; font-family: 맑은 고딕;"><span style="font-family: 맑은 고딕;">결재일자</span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 141.34pt; height: 20.32pt;">&nbsp;</td><td valign="center" style="background: rgb(243, 243, 243); padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 84.74pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: center; font-family: 맑은 고딕;"><span style="font-family: 맑은 고딕;">계정과목</span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 141.35pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">&nbsp; <!--[if !supportEmptyParas]--></span></p></td></tr><tr><td valign="center" style="background: rgb(243, 243, 243); border-width: 1.13pt; border-style: dotted dotted dotted solid; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) rgb(243, 243, 243); padding: 1.41pt; width: 84.74pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; font-family: 맑은 고딕;"><span style="font-family: 맑은 고딕;">지출일자</span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 141.34pt; height: 20.32pt;">&nbsp;</td><td valign="center" style="background: rgb(243, 243, 243); padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 84.74pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: center; font-family: 맑은 고딕;"><span style="font-family: 맑은 고딕;">비  고</span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 141.35pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="background: rgb(243, 243, 243); border-width: 1.13pt; border-style: dotted solid; border-color: rgb(160, 160, 160) rgb(243, 243, 243); padding: 1.41pt; width: 452.17pt; height: 20.32pt;" colspan="6"><p class="예스폼" style="text-align: center; font-family: 맑은 고딕;"><span style="font-family: 맑은 고딕;">내  역</span></p></td></tr><tr><td valign="center" style="background: rgb(243, 243, 243); border-width: 1.13pt; border-style: dotted dotted dotted solid; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) rgb(243, 243, 243); padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: center; font-family: 맑은 고딕;"><span style="font-family: 맑은 고딕;">적  요</span></p></td><td valign="center" style="background: rgb(243, 243, 243); padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: center; font-family: 맑은 고딕;"><span style="font-family: 맑은 고딕;">금  액</span></p></td><td valign="center" style="background: rgb(243, 243, 243); border-width: 1.13pt; border-style: dotted solid dotted dotted; border-color: rgb(160, 160, 160) rgb(243, 243, 243) rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; font-family: 맑은 고딕;"><span style="font-family: 맑은 고딕;">비  고</span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentcolor; padding: 1.41pt; width: 235.61pt; height: 27px;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">&nbsp;&nbsp;<!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->&nbsp;&nbsp;<o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 27px;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentcolor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 27px;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 27px;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 27px;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 27px;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><br></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt 1.13pt 1.13pt medium; border-style: dotted dotted dotted none; border-color: rgb(160, 160, 160) rgb(160, 160, 160) rgb(160, 160, 160) currentColor; padding: 1.41pt; width: 235.61pt; height: 20.32pt;" colspan="3"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="padding: 1.41pt; border: 1.13pt dotted rgb(160, 160, 160); width: 108.28pt; height: 20.32pt;" colspan="2"><p class="예스폼" style="text-align: right; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-right: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td><td valign="center" style="border-width: 1.13pt medium 1.13pt 1.13pt; border-style: dotted none dotted dotted; border-color: rgb(160, 160, 160) currentColor rgb(160, 160, 160) rgb(160, 160, 160); padding: 1.41pt; width: 108.28pt; height: 20.32pt;"><p class="예스폼" style="text-align: center; color: rgb(100, 100, 100); font-family: 맑은 고딕;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p></td></tr><tr><td valign="center" style="border-width: 1.13pt medium; border-style: dotted none solid; border-color: rgb(160, 160, 160) currentColor rgb(0, 0, 0); padding: 1.41pt; width: 452.17pt; height: 131.71pt;" colspan="6"><p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); font-family: 맑은 고딕;">위 금액을 영수(청구)합니다.</span></p>
<p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p>
<p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p>
<p class="예스폼" style="text-align: left; color: rgb(100, 100, 100); font-family: 맑은 고딕; margin-left: 10pt;"><span style="color: rgb(100, 100, 100); mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p>
<p class="예스폼" style="text-align: center; font-family: 맑은 고딕;"><span lang="EN-US" style="mso-fareast-font-family: 맑은 고딕;">20  년  월  일</span></p>
<p class="예스폼" style="text-align: center; font-family: 맑은 고딕;"><span style="mso-fareast-font-family: 맑은 고딕;">  <!--[if !supportEmptyParas]-->&nbsp;<!--[endif]-->  <o:p></o:p></span></p>
<p class="예스폼" style="text-align: right; font-family: 맑은 고딕; margin-right: 10pt;"><span style="font-family: 맑은 고딕;">영수자 : </span><u style="text-underline: #000000 single;"><span lang="EN-US" style="mso-fareast-font-family: 맑은 고딕;">               </span></u><span lang="EN-US" style="mso-fareast-font-family: 맑은 고딕;"> (인)</span></p></td></tr></tbody></table><p><br></p>
		</c:when>
		<c:otherwise>${ apvReWrite.approval_content }</c:otherwise>
		</c:choose>
		</textarea> <br></div>
	
		<label for="file">첨부:</label><input type="file" name="file" value="${ apvReWrite.approval_filepath }"/>
	  <hr>
                 
</form> <!-- ============================================================================================================================================================= -->
		<div class="container" align="center">
		<input class="btn btn-outline-primary"" type="button" value="뒤로가기" onclick="history.back(-1);">
		<button class="btn btn-outline-primary"" onclick="sendApv()">제출하기</button>
			<c:if test="${ isReturn != 1 }">
				<button class="btn btn-outline-primary"" data-toggle="modal" data-target="#comment" >저장하기</button>
			</c:if>
			<div><br></div>
	</div>
	
	
	

		
		
	
	</div>
</div></div></div>


	<!-- 임시저장 코멘트 -->
	<div class="modal" id="comment">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">임시저장</h4>
					<button type="button" class="close float-right" data-dismiss="modal">&times;</button>
				</div>

					<div class="form-group">
						<div class="modal-body">
							<h5>
								<label>임시저장 태그를 달아주세요.</label>
							</h5>
							<input class="form-control" name="apv_comment" type="text" id="apv_comment" value="${ apvReWrite.approval_cc }"/>
						</div>
						<div class="modal-footer float-right">
							<button class="btn btn-dark float-right" type="submit" onclick="tempStore()" >저장</button>
						</div>
						<div class="float-left" style="padding: 0 0 0 20px">
							<label>임시저장의 경우 파일은 저장되지 않습니다.</label><br>
							<label>최종 제출시 파일을 입력해주세요.</label>
						</div>
					</div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	
	function selectMem(){
		window.open('${pageContext.request.contextPath}/approval/pikAuthMem','결제자선택','width=1100 , height=500 ,resizable = no, scrollbars = no');
	}
	
	function tempStore(){


		if(${ not empty apvReWrite.approval_id }){
		$('<input></input>').attr('type','hidden').attr('value',${ apvReWrite.approval_id }).attr('name','approval_id').appendTo('#sendApv');
		}
		
		if(($('#approval_title').val()).trim() == ''){
			alert('제목을 입력해주세요')
			return;
		}
		if(($('#summernote').val()).trim() == ''){
			alert('내용을 입력해주세요')
			return;
		}
	
		
		$('#apvCateGo').val(3);
		if($('#apvCateGo').val() == ''){
		$('#apvCateGo').val(${ apvReWrite.approval_cate });
		}
		
		$('#approval_cc').val($('#apv_comment').val());
		
		if('${mem1}' != null){
			$('#authId1').val(${mem1});
		}
		if('${mem2}' != null){
			$('#authId2').val(${mem1});
		}
		if('${mem3}' != null){
			$('#authId3').val(${mem1});
		}
		
		for(var i = 1 ; i <=3 ; i++){
			
			$('#authId'+i+'').val($('#apv_mem'+i+'').text())
			
		}
		
		//=========================================================================================
		
		
		var arr = $('#tbody > tr');
		
		
		for(var i = 0 ; i < arr.length ; i++){
			console.log(arr[i].id);
			console.log((arr[i].id).slice(3));
			var num = (arr[i].id).slice(3);
			

			$('<input></input>').attr('type','hidden').attr('name','pay_date'+i).attr('value',$('#datepk'+num+'').val()).appendTo('#sendApv');
			$('<input></input>').attr('type','hidden').attr('name','pay_title'+i).attr('value',$('#titleSel'+num+'').val()).appendTo('#sendApv');
			$('<input></input>').attr('type','hidden').attr('name','pay_cash'+i).attr('value',$('#cashAmount'+num+'').val()).appendTo('#sendApv');
			$('<input></input>').attr('type','hidden').attr('name','pay_bank'+i).attr('value',$('#bankSel'+num+'').val()).appendTo('#sendApv');
			$('<input></input>').attr('type','hidden').attr('name','pay_deposit'+i).attr('value',$('#depoNum'+num+'').val()).appendTo('#sendApv');
			$('<input></input>').attr('type','hidden').attr('name','pay_dpowner'+i).attr('value',$('#depoOwn'+num+'').val()).appendTo('#sendApv');
			$('<input></input>').attr('type','hidden').attr('name','pay_comment'+i).attr('value',$('#comment'+num+'').val()).appendTo('#sendApv');

			
			
		}// for end
			$('<input></input>').attr('type','hidden').attr('name','maxCount').attr('value',arr.length).appendTo('#sendApv'); 
			$('<input></input>').attr('type','hidden').attr('name','temp').attr('value','temp').appendTo('#sendApv'); 
		
		
	//=========================================================================================

		
		
		if($('#apv_comment').val().trim() != ''){
			$('#sendApv').submit();
			
			console.log($('#authId1').val());
			console.log($('#authId2').val());
			console.log($('#authId3').val());
			console.log($('#approval_title').val());
			console.log($('#summernote').val());
			console.log($('#apvCateGo').val());
			console.log($('#apv_comment').val());
			
		}else{
			alert('태그 내용을 입력해주세요')
			return;
		}
		
	}
	
	</script>

</body>
</html>