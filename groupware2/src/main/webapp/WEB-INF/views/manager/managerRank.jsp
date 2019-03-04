<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/pagination.js"></script>
<script>
var ori_id;
var page;
var condition;
var startNum;
var endNum;

$(document).ready(function(){
	$.getList();
});
$(function(){
	$(document).on("click", "#a_add_rank", function(){	
		$("input[name='rank_id']").val("");
		$("input[name='rank_name']").val("");
		$(".modal-title").html("직급 추가");
		$("#modal_btn_edit_rank").hide();
		$("#modal_btn_add_rank").show();
		$.init_set();
	});
	$(document).on("click", "#a_edit_rank", function(){
		var rank_id = $(this).parent('td').siblings('td:first').html();
		var rank_name = $(this).parent('td').siblings('td:odd').html();
		ori_id = rank_id;
		$("input[name='rank_id']").val(rank_id);
		$("input[name='rank_name']").val(rank_name);
		$(".modal-title").html("직급 정보 변경");
		$("#modal_btn_add_rank").hide();
		$("#modal_btn_edit_rank").show();
		$.init_set();
	});
	$(document).on("click", "#a_del_rank", function(){
		if (confirm("정말 삭제하시겠습니까?")){
			var rank_id = $(this).parent('td').siblings('td:first').html();
			var param = "rank_id="+rank_id;
			$.ajax({
				type:"POST",
				url:"../rank/delete",
				data:param,
				success:function(data){
					var obj = eval('('+data+')');
					alert(obj.value);
					$.getList(page);
				}
			});
		};
	});
	$("#modal_btn_add_rank").click(function(){
		var flag = true;
		var rank_id = $("input[name='rank_id']").val();
		var rank_name = $("input[name='rank_name']").val();
		if (rank_id == ""){
			flag = false;
		}
		if (rank_name == ""){			flag = false;
		}
		if (rank_id >= 100) {
			alert("번호 범위는 0~99입니다.");
			flag = false;
		}
		var param = "rank_id="+rank_id+"&rank_name="+rank_name;
		if (flag) {
			$.ajax({
				type:"POST",
				url:"../rank/add",
				data:param,
				success:function(data){
					var obj = eval('('+data+')');
					if (obj.value){
						$.getList(page);
					} else {
						alert("번호가 중복됩니다.");
					}		
				}
			});
		} else {return false;}
		
	});	
	$("#modal_btn_edit_rank").click(function(){
		var flag = true;
		var rank_id = $("input[name='rank_id']").val();
		var rank_name = $("input[name='rank_name']").val();
		if (rank_id == ""){
			flag = false;
		}
		if (rank_name == ""){
			flag = false;
		}
		if (rank_id >= 100) {
			alert("번호 범위는 0~99입니다.");
			flag = false;
		}
		if (flag){
			var param = "rank_id="+rank_id+"&rank_name="+rank_name+"&ori_id="+ori_id;
			$.ajax({
				type:"POST",
				url:"../rank/edit",
				data:param,
				success:function(data){
					var obj = eval('('+data+')');
					if (obj.value){
						$.getList(page);
					} else {
						alert("번호가 중복됩니다.");
					}		
				}
			});
		} else {return false;}		
	});
	// 'input'에서 enter 키 눌렀을 때 로그인 버튼 실행
	$(".modal-body input").keyup(function(e){
		if (e.keyCode == 13){
			if ($(".modal-title").html() == "직급 추가"){
				$("#modal_btn_add_rank").click();
			} else if ($(".modal-title").html() == "직급 정보 변경"){
				$("#modal_btn_edit_rank").click();
			}
		}
	}); //key up end
	$("#searchForm input").keyup(function(e){
		if (e.keyCode == 13){		
			$("#btn_rank_opt").click();
		}
	}); //key up end
	// Label Zoom 효과 - input 선택했을 때
	$("input").focus(function() {
		// 'textbox' class가 적용된 태그 안에서 input[type="text"], input[type="password"] 검색
	    var $input = $('.textbox').find('input[type="text"], input[type=number]');
	    $input.on({
	        'focus': function () { // input 태그가 focus를 가지면 'focus' class 추가
	            $(this).parent().addClass('focus');
	        },
	        'blur': function () { // input 태그가 focus를 잃으면
	            if ($(this).val() == '') { // input 태그에  value값이 없으면 'focus' class 삭제
	                $(this).parent().removeClass('focus');                
	            } 
	        }
	    });
	});
	$("#btn_rank_opt").click(function(){
		var opt = $("select[name='opt']").val();
		condition = $("input[name='condition']").val();
		$.getList();
	});
})

// 찾기 중에 오류가 날 때 zoom 관련 css 초기화 되어 다시 설정
$.init_set = function() {
	$("input[type='text'], input[type='number']").each(function () {
        if ($(this).val() !== '') { // input 태그가 value값을 가지면 'focus' class 추가
            // label focus
            $(this).closest('.textbox').addClass('focus');
        } else { // input 태그에  value값이 없으면 'focus' class 삭제
            $(this).closest('.textbox').removeClass('focus');
        }
    });
}

$.getList = function(p){	
	if (p == undefined) {
		p = 1;
	}
	page = p;
	$.ajax({
		type:"POST",
		url:"../rank/list?condition="+condition,
		success:function(data){
			var arr = eval('('+data+')');
			var paging = $.getPage(page, arr);
			var str = '';
			str = '<table class="table table-hover text-center">';
			str += '<thead><tr class="text-center"><th>번호</th><th>직급명</th><th>직원수</th>';
			str += '<th class="text-right">';
			str += '<button id="a_add_rank" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modal_edit_rank">추가</button>';
			str += '</th></tr></thead>';
			for(i = startNum; i < endNum; i++){
				str += '<tr>';
				str += '<td>' + arr[i].rank_id + '</td>';
				str += '<td>' + arr[i].rank_name + '</td>';
				str += '<td>' + arr[i].rank_count + '</td>';
				str += '<td class="text-right">';
				str += '<button id="a_edit_rank" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modal_edit_rank">수정</button>';
				str += '<button id="a_del_rank" class="btn btn-outline-primary btn-sm">삭제</button>';
				str += '</td>';
				str += '</tr>';
			}
			str += "</table>";	
			$("#div_rank").html(str);
			$(".pagination").html(paging);
		}
	});
}
</script>
</head>
<body>
	<!-- Table -->
<div id="div_rank" class="container-fluid">
<%-- <table class="table table-hover text-center">
	<thead>
	<tr class="text-center">
		<th>번호</th>
		<th>직급명</th>
		<th>직원수</th>
		<th class="text-right">
			<a id="a_add_rank"  class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#modal_edit_rank">추가</a>			
		</th>
	</tr>
	</thead>
	<c:forEach items="${list}" var="rank" varStatus="status">
		<tr>
			<td>${rank.rank_id}</td>
			<td>${rank.rank_name}</td>
			<td></td>
			<td class="text-right">
				<a id="a_edit_rank" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#modal_edit_rank">수정</a>
				<a id="a_del_rank" class="btn btn-outline-secondary btn-sm">삭제</a>
			</td>
		</tr>
	</c:forEach>
	</table> --%>
</div>

	<!-- Paging -->
	<div class="container">
		<ul class="pagination justify-content-center"></ul>
	</div>	
	<br>
	<!-- 검색 -->
	<div id="searchForm" align="center">
			<select name="opt" class="btn btn-outline-primary">
				<option value="0">직급</option>
			</select>
			<input type="text" class="btn btn-outline-primary" size="20" name="condition" />&nbsp;
			<input type="button" id="btn_rank_opt" class="btn btn-outline-primary" value="검색" />
	</div>
	<br>

	<!-- The Modal -->
  <div class="modal fade" id="modal_edit_rank">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"></h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <table class="table table-borderless">
          <tr>          	
          	<td>
          		<div class="form-group textbox">
				<label for="modal_rank_id">번호</label>
				<input type="number" class="form-control" id="modal_rank_id" name="rank_id" min="0" max="99"/>
				</div>
			</td>
          </tr>
          <tr>
          	<td>
				<div class="form-group textbox">
				<label for="modal_rank_name">직급명</label>
				<input type="text" class="form-control" id ="modal_rank_name" name="rank_name"/>
				</div>
			</td>
          	</tr>
          </table>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
      		<button id="modal_btn_add_rank" type="button" class="btn btn-outline-primary" data-dismiss="modal">추가</button>
        	<button id="modal_btn_edit_rank" type="button" class="btn btn-outline-primary" data-dismiss="modal">수정</button>
        	<button type="button" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
</html>