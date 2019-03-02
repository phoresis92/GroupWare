$(function(){
	//유효성 검사
	$("#form_join").submit(function() {
		var flag = true;
		if ($("#member_name").val() == "") {
			$("#member_name").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if ($("#member_pw").val() == "") {
			$("#member_pw").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if ($("#member_birth").val() == "") {
			$("#member_birth").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if ($("#member_email").val() == "") {
			$("#member_email").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if ($("#sample6_postcode").val() == "") {
			$("#sample6_postcode").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if (flag) {
			return true;
		}
		return false;
	});

	//	페이지 로딩 완료 후 focus 이동 - 처음에 label zoom 효과 안되는 오류 수정(임시방편)
	$(document).ready(function(){
		$("input[type='text']:first, input[type='password']:first").focus();
		$("[data-toggle='tooltip']:first").focus();
		// 'tooltip'에 탭사용 안되게 수정
		$("[data-toggle='tooltip']").attr("tabindex", "-1");		
	});

	//	Label Zoom 효과 - input/select 선택했을 때
	$("input, select").focus(function() {
		// 'textbox' class가 적용된 태그 안에서 input[type="text"], input[type="password"] 검색
		var $input = $('.textbox').find('input[type="text"], input[type="password"]');
		$input.on({
			'focus': function () { // input 태그가 focus를 가지면 'focus' class 추가
				$(this).parent().addClass('focus');
				// 선택한 input의 툴팁 보여주기
				$(this).siblings("[data-toggle='tooltip']").tooltip('show');
			},
			'blur': function () { // input 태그가 focus를 잃으면
				if ($(this).val() == '') { // input 태그에  값이 없으면 'focus' class 삭제
					$(this).parent().removeClass('focus');                
				} 
				// 선택한 input에서 다른곳으로 focus가 이동하면 툴팁 숨기기
				$(this).siblings("[data-toggle='tooltip']").tooltip('hide');           
			}
		});
		// 'textbox' class가 적용된 태그 안에서 select 검색
		var $select = $('.textbox').find('select');
		$select.on({
			'change': function () { // select 태그 값이 change가 발생하면 'focus' class 추가
				$(this).parent().addClass('focus');
			}
		});
	});

	//	회원가입 중에 오류가 날 때 zoom 관련 css 초기화 되어 다시 설정
	$('input[type=text], input[type=password], select').each(function () {
		if ($(this).val() !== '') { // input 태그가 value값을 가지면 'focus' class 추가
			// label focus
			$(this).closest('.textbox').addClass('focus');
		} else { // input 태그에  value값이 없으면 'focus' class 삭제
			$(this).closest('.textbox').removeClass('focus');
		}
	});

	//	해당 id값을 가졌을 때 입력값 검사(숫자만 입력)
	$("#member_birth, #member_phone").keyup(function(){
		this.value=this.value.replace(/[^0-9]/g,'');
	});
	
	// 'input'에서 enter 키 눌렀을 때 가입 버튼 실행
	$("input[type=text]").keyup(function(e){
		if (e.keyCode == 13){
			$("#form_join").submit();
		}
	});	
});

//다음 도로명 주소 API
function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if(data.userSelectedType === 'R'){
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraAddr !== ''){
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("sample6_extraAddress").value = extraAddr;

			} else {
				document.getElementById("sample6_extraAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample6_postcode').value = data.zonecode;
			document.getElementById("sample6_address").value = addr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("sample6_detailAddress").focus();

			// 우편변호와 도로명주소에 'focus' class 추가
			document.getElementById("sample6_postcode").parentNode.classList.add('focus');
			document.getElementById("sample6_address").parentNode.classList.add('focus');
		}    
	}).open();
}
