$(function(){
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
		$("#member_id").focus();
		$("#member_id").blur();
	});
});

