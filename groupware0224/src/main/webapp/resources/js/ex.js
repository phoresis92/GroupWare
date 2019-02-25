check_phone = function () {
	var phone = $('.dev-phone').val();
	var isPhone = false;
	if (phone.length == 0) {
		join.common.toggle_msg('.dev-phone', join.msg.required);
	} 
	else if (phone.length > 2) {
		var regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		var msg = '올바르지 않은 휴대폰 번호입니다';
		isPhone = regExp.test(phone);      

		if (isPhone) {
			var arr = phone.split('-');
			if (arr.length > 2)	{
				$('#M_Phone1').val(arr[0]);
				$('#M_Phone2').val(arr[1]);
				$('#M_Phone3').val(arr[2]);
			}
			join.common.toggle_msg('.dev-phone', '', false, 'success');
		} else {
			join.common.toggle_msg('.dev-phone', msg);
		}            
	}
	return isPhone;
}

keyup_phone = function (e) {
	if ($(this).length > 0) {
		var $phone = $(this);
		var phone = $phone.val();
		var origin = phone;
		var len = 0, n1 = 3, n2 = 1;
		phone = phone.replace(/-/gi, '');
		len = phone.length;

		if (len > n1) {
			phone = phone.substring(0, n1) + '-' + phone.substring(n1, len);
			len++;
		}
		if (len > (n1 + 4)) {
			phone = phone.substring(0, len - (n1 + n2)) + '-' + phone.substring(len - (n1 + n2), len);
			len++;
		}
		if (len > (n1 + 10)) {
			phone = phone.substring(len - 10, len);
		}
		if (origin !== phone) $phone.val(phone);
	}
}

check_email = function () {
	var email = $('.dev-mail').val();

	if (email.length == 0) {
		join.common.toggle_msg('.dev-mail', join.msg.required);           
	} else {
		if (join.account.check_email_reg(email) == false) {
			join.common.toggle_msg('.dev-mail', join.msg.email.unselected);
		} else {
			var arr = email.split('@');
			if (arr.length > 1)	{
				$('#Email_ID').val(arr[0]);
				$('#Email_Addr').val(arr[1]);
			}
			join.common.toggle_msg('.dev-mail', '', false, 'success');
		}
	}
}
//이메일 올바른 형식 검사
check_email_reg = function (email) {
	var email = escape(email);
	var regExp = /^[a-z A-Z 0-9\w-\.]+@gmail.com+$/;
	if (email.match(regExp) == null) {
		return false;
	} else {
		return true;
	}
}