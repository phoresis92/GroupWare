$(function(){
	// 로그일 버튼 눌렀을 때
	$("#btn_login").click(function(){
		var flag = true;
		if ($("#member_id").val() == "") {
			$("#member_id").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if ($("#member_pw").val() == "") {			
			$("#member_pw").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if (flag == true){
			var id = $("#member_id").val();
			var pw = $("#member_pw").val();
			var param = "member_id="+id+"&member_pw="+pw;
			$.ajax({
				type:"POST",
				url:"../member/checkLogin",
				data:param,
				success:function(data){
					var obj = eval('('+data+')');
					if(!obj.value){
						$('#loginfail').show();
					}else{			
						$('#form_login').submit();		
					}
				}
			}); // end ajax	
		}			
	}); // end 'btn_login
	
	// Label Zoom 효과 - input 선택했을 때
	$("input").focus(function() {
		// 'textbox' class가 적용된 태그 안에서 input[type="text"], input[type="password"] 검색
	    var $input = $('.textbox').find('input[type="text"], input[type="password"]');
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
	// 로그인 중에 오류가 날 때 zoom 관련 css 초기화 되어 다시 설정
	$('input[type=text], input[type=password]').each(function () {
        if ($(this).val() !== '') { // input 태그가 value값을 가지면 'focus' class 추가
            // label focus
            $(this).closest('.textbox').addClass('focus');
        } else { // input 태그에  value값이 없으면 'focus' class 삭제
            $(this).closest('.textbox').removeClass('focus');
        }
    });
	//페이지 로딩 완료 후 focus 이동 - 처음에 label zoom 효과 안되는 오류 수정(임시방편)
	$(document).ready(function(){
		$("input:first").focus();
		$("[data-toggle='tooltip']:first").focus();
		// 'tooltip'에 탭사용 안되게 수정
		$("[data-toggle='tooltip']").attr("tabindex", "-1");		
	});
	// 'input'에서 enter 키 눌렀을 때 로그인 버튼 실행
	$("input[type=text], input[type=password]").keyup(function(e){
		if (e.keyCode == 13){
			$("#btn_login").click();
		}
	}); //key up end
});

