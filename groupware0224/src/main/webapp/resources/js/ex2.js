/*check_phone: function () {
        $('#Corp_Phone_Etc').val('');
        var phone = $('.dev-phone').val();
        var isPhone = false;
        if (phone.length == 0) {
            join.common.toggle_msg('.dev-phone', join.msg.required);
        } else if (join.account.check_foreign()) {
            $('#Corp_Phone1').val('000');
            $('#Corp_Phone2').val('0000');
            $('#Corp_Phone3').val('0000');
            $('#Corp_Phone_Etc').val(phone);

            if ($.inArray('', phone.split(' ')) > -1) {
                join.common.toggle_msg('.dev-phone', '띄어쓰기를 연속으로 사용할 수 없습니다.');
            } else if (isNaN(phone.replace(/ /gi, ''))) {
                join.common.toggle_msg('.dev-phone', '올바르지 않은 전화번호 입니다.');
            } else {
                join.common.toggle_msg('.dev-phone', '', false, 'success');
            }
            return false;
        } else if (phone.length > 2) {
            var regExp = '', msg = '';
            if (join.account.type === 'gg') {
                regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
                msg = '올바르지 않은 휴대폰 번호입니다';
                isPhone = regExp.test(phone);
            } else {
                var firstPhone = '02|031|032|033|041|042|043|044|051|052|053|054|055|061|062|063|064|070|010|011|016|017|018|019'.split('|');
                for (var index in firstPhone) {
                    if (phone.substring(0, 3).indexOf(firstPhone[index]) > -1) {
                        isPhone = true;
                        break;
                    }
                }

                if (isPhone) {
                    regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
                    isPhone = regExp.test(phone);
                }
                msg = '올바르지 않은 전화번호입니다';
            }
            
            if (isPhone) {
                var arr = phone.split('-');
                if (arr.length > 2) {
                    var code = join.account.type === 'gg' ? 'M' : 'Corp';
                    $('#' + code + '_Phone1').val(arr[0]);
                    $('#' + code + '_Phone2').val(arr[1]);
                    $('#' + code + '_Phone3').val(arr[2]);
                }
                join.common.toggle_msg('.dev-phone', '', false, 'success');
            } else {
                join.common.toggle_msg('.dev-phone', msg);
            }            
        }
        return isPhone;
    },   
  
keyup_phone: function (e) {
        if ($(this).length > 0 && !join.account.check_foreign()) {
            var $phone = $(this);
            var phone = $phone.val();
            var origin = phone;
            var len = 0, n1 = 3, n2 = 1;
            phone = phone.replace(/-/gi, '');
            len = phone.length;
            
            if (len > 2 && phone.substring(0, 2) === '02') {
                n1 = 2;
                n2 = 2;
            }

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
    },

check_email: function () {
        // var Default_Text = ''; //<p class=\"info\">개인 맞춤 채용정보/정기 뉴스레터/이벤트 메일이 발송됩니다.</p>";

        var email = $('.dev-mail').val();

        if (email.length == 0) {
            join.common.toggle_msg('.dev-mail', join.msg.required);
            // $("#notice_msg_mail").html($("#notice_msg_mail").html() + Default_Text);
        } else {
            if (join.account.check_email_reg(email) == false) {
                join.common.toggle_msg('.dev-mail', join.msg.email.unselected);
            } else {
                var arr = email.split('@');
                if (arr.length > 1) {
                    $('#Email_ID').val(arr[0]);
                    $('#Email_Addr').val(arr[1]);
                }
                join.common.toggle_msg('.dev-mail', '', false, 'success');
            }
        }

        if (join.account.type === 'gg') {
            var $agree = $('input[name=M_Email_Agree]');
            if ($agree.length === 1) {
                $agree.val($agree.is(':checked') ? 1 : 0);
            }
        } else if (join.account.type === 'gi') {
            var $agree = $('input[name=Email_Agree]');
            if ($agree.length === 1) {
                $agree.val($agree.is(':checked'));
            }
        }
    },
    //이메일 올바른 형식 검사
    check_email_reg: function (email) {
        var email = escape(email);
        var regExp = /^[a-z A-Z 0-9\w-\.]+@[a-z A-Z 0-9\-]+(\.[a-z A-Z 0-9 \-]+)+$/;
        if (email.match(regExp) == null) {
            return false;
        }
        else {
            return true;
        }
    },*/