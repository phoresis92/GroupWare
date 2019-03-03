$(function(){
	// 아이디 찾기 버튼 눌렀을 때
	$("#btn_find_id").click(function() {		
		var flag = true;
		var name = $("#member_name1").val();
		var birth = $("#member_birth1").val();
		var email = $("#member_email1").val();
		if (name == "") {
			$("#member_name1").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if (birth == "") {
			$("#member_birth1").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if (email == "") {
			$("#member_email1").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if (flag == true){
			
			var param = "member_name="+name+"&member_birth="+birth+"&member_email="+email;
			$.ajax({
				type:"POST",
				url:"../member/searchId",
				data:param,
				success:function(data){
					var arr = eval('('+data+')');
					var str = '';
					if (arr.length == 0) {
						str = '<div class="alert alert-danger">일치하는 회원이 없습니다!</div>';
					}
					else {
						str = '<table class="table table-hover text-center">';
						str += "<tr><th>사원 번호</th></tr>";
						for(i=0;i<arr.length;i++){
							str += "<tr><td>" + arr[i].value+"</td></tr>";
						}
						str += "</table>";
					}
					$('.modal-body').html(str);
					$("#modal_findId").modal();						
				}
			});			
		}
	});
	
	// 비밀번호 찾기 버튼 눌렀을 때
	$("#btn_find_pw").click(function() {
		$("#btn_find_pw").prop("disabled", true);
		var flag = true;
		if ($("#member_id2").val() == "") {
			$("#member_id2").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if ($("#member_name2").val() == "") {
			$("#member_name2").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if ($("#member_birth2").val() == "") {
			$("#member_birth2").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if (flag) {
			var id = $("#member_id2").val();
			var name = $("#member_name2").val();
			var birth = $("#member_birth2").val();
			var param = "member_id="+id+"&member_name="+name+"&member_birth="+birth;
			$.ajax({
				type:"POST",
				url:"../member/searchPw",
				data:param,
				success:function(data){
					var obj = eval('('+data+')');
					if(obj.value){
						$('.modal-body').html("임시 비밀번호를 메일로 발송했습니다.");
						$("#find_fail").hide();
						$("#find_success").show();
					}
					else {
						$('.modal-body').html("일치하는 회원이 없습니다.");
						$("#find_success").hide();
						$("#find_fail").show();
					}
					$("#btn_find_pw").prop("disabled", false);
					$("#modal_findPw").modal();
				}
			});			
		} else{
			$("#btn_find_pw").prop("disabled", false);
		}
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
	
	// 페이지 로딩 완료 후 focus 이동 - 처음에 label zoom 효과 안되는 오류 수정(임시방편)
	$(document).ready(function(){
		$("input:first").focus();
		$("[data-toggle='tooltip']:first").focus();
		// 'tooltip'에 탭사용 안되게 수정
		$("[data-toggle='tooltip']").attr("tabindex", "-1");		
	});
	
	// 'tab' 눌렀을 때 모든 'tooltip' 숨김
	$("a[data-toggle='tab']").click(function(){
		$("a[data-toggle='tooltip']").tooltip('hide');
	});	
	
	// tab 눌렀을 때 input 내용 초기화
	$('a[data-toggle="tab"]').click(function (){		
		$('input[type=text]').each(function () {
			$(this).val('');
			$(this).closest('.textbox').removeClass('focus');
	    });
	});
	
	// Modal에서 table의 'tr' 눌렀을 때 id값 가지고 비밀번호 찾기 이동 (첫번째 'tr'은 제외)
	$(document).on('click', '.table tr:nth-child(n+2)', function (){		
		// 'td'에 표시된 아이디값 변수에 저장		
		var id = $(this).children().text();
		
		// 비밀번호 찾기 tab 클릭
		$("#find_pw").click();
		
		// 비밀번호 찾기 tab에서 변수에 저장한 id값 input에 넣음
		$("#member_id2").val(id);
	});
	
	// Modal에서 비밀번호 찾기 버튼 눌렀을 때
	$('#find_pw').click(function () {
		// 아이디 찾기에서 입력한 이름과 생년월일을 변수에 저장
		var name = $("#member_name1").val();
		var birth = $("#member_birth1").val();
		
		// 비밀번호 찾기 tab 클릭
		$("a[href='#menu2']").click();
		
		// 비밀번호 찾기 tab에서 변수에 저장한 값을 input에 넣음
		$("#member_name2").val(name);
		$("#member_birth2").val(birth);
		
		// Label Zoom 적용
		$("#member_name2").focus();
		$("#member_birth2").focus();
		$("#member_id2").focus();
    });
	
	$("#menu1 input[type=text]").keyup(function(e){
		if (e.keyCode == 13){
			$("#btn_find_id").click();
		}
	});
	
	$("#menu2 input[type=text]").keyup(function(e){
		if (e.keyCode == 13){
			$("#btn_find_pw").click();
		}
	});
	
	$("#find_success").click(function(){
		$(location).attr("href", "../member/login");
	});
});

