$(function(){
	$(document).ready(function(){
		var arr1 = new Array("승인대기", "재직", "재직", "퇴직", "정지", "재직", "재직", "재직","재직", "재직");
		var arr2 = new Array("승인대기", "대기", "재직", "퇴직", "정지", "휴가", "", "","", "관리자");		
		var arr3 = new Array("","","우리은행", "농협은행", "신한은행");
		var status = $("#m_status").val();
		var deposit = $("#m_deposit").val();
		if ((deposit < 2 && deposit > 4) || deposit == ""){
			deposit = 2;
		}
		$("#hire").html(arr1[status]);
		$("#status").html(arr2[status]);
		$("#deposit").html(arr3[deposit]);
		$("#bank_id").val(deposit).prop('selected', true);		
	});
	// 기존 이메일을 업무메일로 사용 체크
	$("#checked_email").click(function(){
		if ($("#checked_email").is(':checked')){
			$("#email_account").val($("#member_email").val());
			$("#email_account").parent().addClass('focus');
		} else{
			$("#email_account").val("");
			$("#email_account").parent().removeClass('focus');
		}
	});	
	// 회원 정보 수정 전 비밀 번호 확인 버튼
	$("#editinfo").click(function(){
		if ($("#member_pw").val() != "") {
			var id = $("input[name='member_id']").val();
			var pw = $("#member_pw").val();
			var param = "member_id="+id+"&member_pw="+pw;
			$.ajax({
				type:"POST",
				url:"../member/checkLogin",
				data:param,
				success:function(data){
					var obj = eval('('+data+')');
					if(obj.value){
						if ($('#member_pw').attr('readonly') != 'readonly'){
							$('#edit').attr('style', 'display:');
							$('#member_pw').attr('readonly',true);
						} else{
							$('#edit').attr('style', 'display:none');
							$('#member_pw').attr('readonly',false);
						}						
					}
				}
			});
		}
	});
	// 회원 사진 초기화 버튼
	$("#clear_img").click(function(){
		$("input[name='img_file']").replaceWith( $("input[name='img_file']").clone(true) );
		$("input[name='img_file']").val("");
		if ($("#gender").html() == '남'){ // 초기화 했을 때, 나타낼 회원 사진(성별) 출력
			$("#file_img").attr('src', '../resources/img/m_img.png');			
		} else {
			$("#file_img").attr('src', '../resources/img/f_img.png');
		}
		// 등록한 파일이 있다면 초기화
		$("input[name='member_img']").val("");
	});
	// 회원 싸인 초기화 버튼
	$("#clear_sign").click(function(){
		$("input[name='sign_file']").replaceWith( $("input[name='sign_file']").clone(true) );
		$("input[name='sign_file']").val("");
		$("#file_sign").attr('src', '../resources/img/sign.jpg'); // 초기화 했을 때, 기본 사진 출력
		// 등록한 파일이 있다면 초기화
		$("input[name='member_sign']").val("");
	});
	// 매니저 권한 버튼
	$("#btn_manager_edit").click(function(){
		var dept = $("#m_dept").val();
		var rank = $("#m_rank").val();
		var status = $("#m_status").val();
		$("#member_department").val(dept).prop('selected', true);
		$("#member_rank").val(rank).prop('selected', true);		
		$("#member_status").val(status).prop('selected', true);
		if (status <= 1 || status >= 5) {
			$("#member_status option").not(":selected").attr("disabled", "disabled");
		} else {
			$("#member_status option").not("[value='2'], [value='3'], [value='4']").attr("disabled", "disabled");
		}
	});
	// 'input'에서 enter 키 눌렀을 때 수정 버튼 실행
	$("#member_pw").keyup(function(e){
		if (e.keyCode == 13){
			$("#editinfo").click();
		}
	});
	// modal 'input'에서 enter 키 눌렀을 때 수정 버튼 실행
	$("#modal_edit_member").click(function(){
		$("#form_edit_member").submit();
	});
	
//	페이지 로딩 완료 후 focus 이동 - 처음에 label zoom 효과 안되는 오류 수정(임시방편)
	$(document).ready(function(){
		$("input[type='text']:first, input[type='password']:first").focus();
		$("input[type='text']:first, input[type='password']:first").blur();
	});

	//	Label Zoom 효과 - input/select 선택했을 때
	$("input, select").focus(function() {
		// 'textbox' class가 적용된 태그 안에서 input[type="text"], input[type="password"] 검색
		var $input = $('.textbox').find('input[type="text"], input[type="password"]');
		$input.on({
			'focus': function () { // input 태그가 focus를 가지면 'focus' class 추가
				$(this).parent().addClass('focus');
			},
			'blur': function () { // input 태그가 focus를 잃으면
				if ($(this).val() == '') { // input 태그에  값이 없으면 'focus' class 삭제
					$(this).parent().removeClass('focus');                
				}        
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
})

var sel_file;
$(document).ready(function(){
	$("input[name='img_file']").on("change", handleImgFileSelect1);
	$("input[name='sign_file']").on("change", handleImgFileSelect2);
});

function handleImgFileSelect1(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("이미지 확장자만 가능합니다.");
			$("input[name='img_file']").replaceWith( $("input[name='img_file']").clone(true) );
			$("input[name='img_file']").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#file_img").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
}
function handleImgFileSelect2(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("이미지 확장자만 가능합니다.");
			$("input[name='sign_file']").replaceWith( $("input[name='sign_file']").clone(true) );
			$("input[name='sign_file']").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#file_sign").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

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