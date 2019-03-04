<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
  
<script src="${pageContext.request.contextPath}/resources/js/pagination.js"></script>
<script type="text/javascript">
var page;
var condition;
var option;
var startNum;
var endNum;
var type;

$(document).ready(function(){
	type = $("#type").val();
	condition = "";
	option = "";
	$.getList();	
});

$(function(){
	$(document).on("click", "td span", function(){
		var email_id = $(this).children("input[type='hidden']").val();
		var param = "email_id="+email_id;
		$.ajax({
			type:"POST",
			url:"../email/status",
			data:param,
			success:function(data){
				$.getList(page);
				$.setCount(data);
			}
		});
	});	
	
	$("#btn_email_opt").click(function(){
		option = $("select[name='option']").val();
		condition = $("input[name='condition']").val();
		$.getList();
	});
	
	$(document).on("click", "#allcheck", function(){
	    //클릭되었으면
	    if($("#allcheck").prop("checked")){
	        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	        $("input[name=checked_email]").prop("checked",true);
	        //클릭이 안되있으면
	    }else{
	        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	        $("input[name=checked_email]").prop("checked",false);
	    }
	});
	
	$(document).on("click", "#btn_delete", function(){
		if(!$("input[name=checked_email]").is(":checked")){
			alert("삭제할 메일을 선택해 주세요");
			return;
		}
		var items = [];
		$('input[name=checked_email]:checked').each(function () {
		    items.push($(this).val());
		});
		var param = {"arr" : items};
		$.ajax({
			type:"POST",
			url:"../email/checkdelete",
			data:param,
			success:function(data){
				alert("삭제완료");
				$.getList(page);
				$.setCount(data);
			}
		});
	});	
	$(document).on("click", "#btn_restore", function(){
		if(!$("input[name=checked_email]").is(":checked")){
			alert("복구할 메일을 선택해 주세요");
		}
		var items = [];
		$('input[name=checked_email]:checked').each(function () {
		    items.push($(this).val());
		});
		var param = {"arr" : items};
		$.ajax({
			type:"POST",
			url:"../email/checkrestore",
			data:param,
			success:function(data){
				alert("복구완료");
				$.getList(page);
			}
		});
	});
	
	$(document).on("click", "#btn_read", function(){
		if(!$("input[name=checked_email]").is(":checked")){
			alert("메일을 선택해 주세요");
		}
		var items = [];
		$('input[name=checked_email]:checked').each(function () {
		    items.push($(this).val());
		});
		var param = {"arr" : items};
		$.ajax({
			type:"POST",
			url:"../email/checkstatus",
			data:param,
			success:function(data){
				$.getList(page);
				$.setCount(data);
			}
		});
	});
	
	$(document).on("click", "#allcheck, input[name=checked_email]", function(){
		if($("input[name=checked_email]").is(":checked")){
			$("#btn_delete").attr("disabled", false);
			$("#btn_read").attr("disabled", false);
			$("#btn_restore").attr("disabled", false);
		} else {
			$("#btn_delete").attr("disabled", true);
			$("#btn_read").attr("disabled", true);
			$("#btn_restore").attr("disabled", true);
		}
	});
})
$.setCount = function(count){
	$("#email_count").html(count);
	$("#menu_email_count").html(count);
	$("#main_email_count").html(count);
	$("#header_email_count").html(count);
	$("#header_email_count2").html(count);
}

$.getList = function(p){	
	if (p == undefined) {
		p = 1;
	}
	page = p;
	var param = "type="+type+"&option="+option+"&condition="+condition;
	$.ajax({
		type:"POST",
		url:"../email/list",
		data:param,
		success:function(data){
			var arr = eval('('+data+')');
			var paging = $.getPage(page, arr);
			var str = '';
			if (type == 0){
				str += '<button type="button" id="btn_delete" class="btn btn-outline-primary" disabled>삭제</button>&nbsp;';
				str += '<button type="button" class="btn btn-outline-primary" disabled>읽음</button>&nbsp;';
			} else if (type == 1){
				str += '<button type="button" id="btn_delete" class="btn btn-outline-primary" disabled>삭제</button>&nbsp;';
				str += '<button type="button" id="btn_read" class="btn btn-outline-primary" disabled>읽음</button>&nbsp;';				
			} else if (type == 3){
				str += '<button type="button" id="btn_delete" class="btn btn-outline-primary" disabled>삭제</button>&nbsp;';
				str += '<button type="button" id="btn_restore" class="btn btn-outline-primary" disabled>복구</button>&nbsp;';				
			}
		
			str += '<table class="table table-hover text-center">';
			str += '<colgroup><col width="8%" /><col width="10%" /><col width="*%" /><col width="20%" /></colgroup>';
			str += '<thead><tr class="text-center"><th class="text-left">';
			str += '<div class="custom-control custom-checkbox">';
			str += '<input type="checkbox" class="custom-control-input"	id="allcheck">';
			str += '<label class="custom-control-label" for="allcheck"></label></div>';
			str += '</th><th>발신자</th><th>제목</th><th>작성시간</th></tr></thead>';
			str += '<tbody>';
			for(i = startNum; i < endNum; i++){				
				str += '<tr>';
				str += '<td class="text-left">';
				//str += '<input type="checkbox" id="'+i+'" name="checked_email" value="'+arr[i].email_id+'">';
				str += '<div class="custom-control custom-checkbox">';
				str += '<input type="checkbox" id="'+i+'" name="checked_email" value="'+arr[i].email_id+'" class="custom-control-input">';
				str += '<label class="custom-control-label" for="'+i+'"></label>&nbsp;&nbsp;&nbsp;';				
				str += '<span>';				
				if (arr[i].email_status == 0){
					str += '<i class="far fa-envelope"></i>';					
				} else {
					str += '<i class="far fa-envelope-open"></i>';					
				}
				str += '<input type="hidden" name="email_id" value="'+arr[i].email_id+'"/></span>';
				str += '</div></td>';
				str += '<td class="text-left">'+arr[i].sender+'</td>';
				str += '<td class="text-left">';
				str += '<a href="${pageContext.request.contextPath}/email/detail?email_id='+arr[i].email_id+'&type='+arr[i].type+'">';
				if (arr[i].email_status == 0){
					str += '<strong>'+arr[i].title+'</strong>';					
				} else {
					str += arr[i].title;					
				}
				str += '</a>';
				str += '</td>';
				str += '<td>'+arr[i].send_date+'</td>';
				str += '</tr>';				
			}
			str += "</tbody></table>";	
			$("#div_email").html(str);
			$(".pagination").html(paging);
		}
	});
}
</script>
</head>
<body>
<div class="container-fluid text-center">
	<div class="row content">			
			<div class="col-sm text-left">
						
		<c:choose>
				<c:when test="${empty account.email_account}">
					<div class="row board text-center">
						업무용 메일 등록 후 이용 가능합니다.
						<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/member/myinfo">등록하기</a>		
					</div>
				</c:when>
				
				<c:otherwise>					
					<c:if test="${type eq '0'}">
						<h2>보낸 편지함</h2>						
					</c:if>
					<c:if test="${type eq '1'}">
						<h2>받은 편지함(<span id="email_count">0</span>)</h2>
						<%-- <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/email/receive">사내 메일</a>
						<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/exMail/receive">외부 메일</a> --%>
					</c:if>
					<%-- <c:if test="${type eq '2'}">
						<h2>받은 편지함(외부)</h2>
						<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/email/receive">사내 메일</a>
						<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/exMail/receive">외부 메일</a>
					</c:if> --%>
					<c:if test="${type eq '3'}">
						<h2>휴지통</h2>
						<%-- <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/email/recycle">사내 메일</a>
						<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/exMail/recycle">외부 메일</a> --%>
					</c:if>
					<%-- <c:if test="${type eq '4'}">
						<h2>휴지통(외부)</h2>						
						<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/email/recycle">사내 메일</a>
						<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/exMail/recycle">외부 메일</a>
					</c:if> --%>
					<input type="hidden" id="type" value="${type}"/>
					<div id="div_email" class="container-fluid">
					
					<%-- <table class="table table-hover text-center">		
						<colgroup>
							<col width='8%' />
							<col width='10%' />
							<col width='*%' />
							<col width='20%' />				
						</colgroup>
						<thead>
							<tr class="text-center">
								<th></th> 
								<th>발신자</th>
								<th>제목</th>
								<th>작성시간</th>				
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="email" varStatus="status">	
								<c:url var="link" value="email/detail">
									<c:param name="email_id" value="${email.email_id}" />
									<c:param name="type" value="${type}" />
								</c:url>				  				
								<tr>
									<td class="text-left">
										<input type="checkbox" id="check${status.count}" name="checked_email" value="${email.email_id}">
										<c:choose>
											<c:when test="${email.email_status eq '0' }"><i class="fas fa-envelope"></i></c:when>
											<c:otherwise><i class="fas fa-envelope-open"></i></c:otherwise>
										</c:choose>
									</td>
									<td class="text-left">${email.sender}</td>
									<td class="text-left">									
									<a href="${pageContext.request.contextPath}/${link}">
									<c:choose>
									<c:when test="${email.email_status eq '0' }"><strong>${email.title}</strong></c:when>
									<c:otherwise>${email.title}</c:otherwise>
									</c:choose>
									</a>
									</td>
									<td>${email.send_date}</td>				
								</tr>
							</c:forEach>
						</tbody>
					</table> --%>
					</div>
		
					<br>
		
					<div class="container">
						<ul class="pagination justify-content-center">							
						</ul>
					</div>
		
					<br>
					<div id="searchForm" align="center">
					<div>
						<select name="option" class="btn btn-outline-primary" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		            	    <option value="title">제목</option>
							<option value="content">내용</option>
							<option value="title/content">제목+내용</option>
							<option value="sender/sender_id">보낸사람</option>
	                    </select>
						
                       			<input type="text" class="btn btn-outline-primary" name="condition" placeholder="검색어 입력" aria-label="Search" aria-describedby="basic-addon2">
	                        	
	                        		<button class="btn btn-outline-primary" id="btn_email_opt" type="button"><i class="fas fa-search fa-sm"></i></button>
	                        				        
				    </div>
					</div>					
				</c:otherwise>			
			</c:choose>
			<br>
		</div>
	</div>
</div>

      
</body>
</html>