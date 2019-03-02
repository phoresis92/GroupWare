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
	// 'tooltip'에 탭사용 안되게 수정
	$("[data-toggle='tooltip']").attr("tabindex", "-1");
	$.getList();
});
$(function(){
	$(document).on("click", "#a_add_dept", function(){	
		$("input[name='department_id']").val("");
		$("input[name='department_name']").val("");
		$(".modal-title").html("부서 추가");
		$("#modal_btn_edit_dept").hide();
		$("#modal_btn_add_dept").show();
		$.init_set();
	});
	$(document).on("click", "#a_edit_dept", function(){
		var department_id = $(this).parent('td').siblings('td:first').html();
		var department_name = $(this).parent('td').siblings('td:odd').html();
		ori_id = department_id;
		$("input[name='department_id']").val(department_id);
		$("input[name='department_name']").val(department_name);
		$(".modal-title").html("부서 정보 변경");
		$("#modal_btn_add_dept").hide();
		$("#modal_btn_edit_dept").show();
		$.init_set();
	});
	$(document).on("click", "#a_del_dept", function(){
		if (confirm("정말 삭제하시겠습니까?")){
			var department_id = $(this).parent('td').siblings('td:first').html();
			var param = "department_id="+department_id;
			$.ajax({
				type:"POST",
				url:"../dept/delete",
				data:param,
				success:function(data){
					var obj = eval('('+data+')');
					alert(obj.value);
					$.getList(page);
				}
			});
		};
	});
	$("#modal_btn_add_dept").click(function(){
		var flag = true;
		var department_id = $("input[name='department_id']").val();
		var department_name = $("input[name='department_name']").val();
		if (department_id == ""){
			$("input[name='department_id']").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if (department_name == ""){
			$("input[name='department_name']").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if (department_id >= 1000) {
			alert("번호 범위는 0~999입니다.");
			flag = false;
		}
		if (flag){
			var param = "department_id="+department_id+"&department_name="+department_name;
			$.ajax({
				type:"POST",
				url:"../dept/add",
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
	$("#modal_btn_edit_dept").click(function(){
		var flag = true;
		var department_id = $("input[name='department_id']").val();
		var department_name = $("input[name='department_name']").val();
		if (department_id == ""){
			$("input[name='department_id']").siblings("[data-toggle='tooltip']").tooltip('show');			
			flag = false;
		}
		if (department_name == ""){
			$("input[name='department_name']").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if (department_id >= 1000) {
			alert("번호 범위는 0~999입니다.");
			flag = false;
		}
		if (flag){
			var param = "department_id="+department_id+"&department_name="+department_name+"&ori_id="+ori_id;
			$.ajax({
				type:"POST",
				url:"../dept/edit",
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
	$("input").keyup(function(e){
		if (e.keyCode == 13){
			if ($(".modal-title").html() == "부서 추가"){
				$("#modal_btn_add_dept").click();
			} else if ($(".modal-title").html() == "부서 정보 변경"){
				$("#modal_btn_edit_dept").click();
			}
		}
	}); //key up end
	$("#searchForm input").keyup(function(e){
		if (e.keyCode == 13){		
			$("#btn_dept_opt").click();
		}
	}); //key up end
	// Label Zoom 효과 - input 선택했을 때
	$("input").focus(function() {
		// 'textbox' class가 적용된 태그 안에서 input[type="text"], input[type="number"] 검색
	     var $input = $('.textbox').find('input[type="text"], input[type=number]');
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
	$("#btn_dept_opt").click(function(){
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
		url:"../dept/list?condition="+condition,
		success:function(data){
			var arr = eval('('+data+')');
			var paging = $.getPage(page, arr);
			var str = '';
			str = '<table class="table table-hover text-center">';
			str += '<thead><tr class="text-center"><th>번호</th><th>부서명</th><th>직원수</th>';
			str += '<th class="text-right">';
			str += '<a id="a_add_dept" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#modal_edit_dept">추가</a>';
			str += '</th></tr></thead>';
			for(i = startNum; i < endNum; i++){							
				str += '<tr>';
				str += '<td>' + arr[i].department_id + '</td>';
				str += '<td>' + arr[i].department_name + '</td>';
				str += '<td>' + arr[i].department_count + '</td>';
				str += '<td class="text-right">';
				str += '<a id="a_edit_dept" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#modal_edit_dept">수정</a>';
				str += '<a id="a_del_dept" class="btn btn-outline-secondary btn-sm">삭제</a>';
				str += '</td>';
				str += '</tr>';
			}
			str += "</table>";	
			$('#div_dept').html(str);
			$(".pagination").html(paging);
		}
	});
}

</script>
</head>
<body>
<div id="div_dept"class="container-fluid">
<%-- <table class="table table-hover text-center">
	<thead>
	<tr class="text-center">
		<th>번호</th>
		<th>직무명</th>
		<th>직원수</th>
		<th class="text-right">
			<a class="btn btn-outline-secondary btn-sm">추가</a>
			<a class="btn btn-outline-secondary btn-sm">삭제</a>
		</th>
	</tr>
	</thead>
	<c:forEach items="${list}" var="dept" varStatus="status">
		<tr>
			<td>${dept.department_id}</td>
			<td>${dept.department_name}</td>
			<td></td>
			<td class="text-right">
				<a class="btn btn-outline-secondary btn-sm">수정</a>
				<a class="btn btn-outline-secondary btn-sm">삭제</a>
			</td>
		</tr>
	</c:forEach>
	</table> --%>
</div>
	<div class="container">
		<ul class="pagination justify-content-center"></ul>
	</div>
	<br>
	<div id="searchForm" align="center">
			<select name="opt" class="custom-select-sm">
				<option value="0">부서</option>
			</select>
			<input type="text" size="20" name="condition" />&nbsp;
			<input type="button" id="btn_dept_opt" class="btn btn-primary btn-sm" value="검색" />
	</div>
	
<!-- The Modal -->
  <div class="modal fade" id="modal_edit_dept">
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
				<label for="modal_dept_id">번호</label>
				<a href="#" data-toggle="tooltip" data-placement="left" title="필수입력사항"></a>
				<input type="number" class="form-control" id="modal_dept_id" name="department_id" min="0" max="999"/>
				</div>
			</td>
          </tr>
          <tr>
          	<td>
				<div class="form-group textbox">
				<label for="modal_dept_name">부서명</label>
				<a href="#" data-toggle="tooltip" data-placement="left" title="필수입력사항"></a>
				<input type="text" class="form-control" id="modal_dept_name" name="department_name"/>
				</div>
			</td>
          	</tr>
          </table>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
      		<button id="modal_btn_add_dept" type="button" class="btn btn-outline-secondary" data-dismiss="modal">추가</button>
        	<button id="modal_btn_edit_dept" type="button" class="btn btn-outline-secondary" data-dismiss="modal">수정</button>
        	<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
</html>