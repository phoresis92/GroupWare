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
		var flag = true;
		if ($("#member_pw").val() == "") {
			$("#member_pw").siblings("[data-toggle='tooltip']").tooltip('show');
			flag = false;
		}
		if (flag == true){
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
						$('#edit').collapse('toggle');
						if ($('#member_pw').attr('readonly') != 'readonly'){
							$('#member_pw').attr('readonly',true);
						} else{
							$('#member_pw').attr('readonly',false);
						}						
					}else{
						$("#member_pw").siblings("[data-toggle='tooltip']").tooltip('show');
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