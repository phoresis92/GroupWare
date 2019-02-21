<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.aa {
width:100px;
}
.tt{
height: 60px;
}


</style>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- summernote -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/moment.min.js'></script>

<script>
/*
$( function() {
     $( "#datepicker1" ).datepicker({
    	
    		   beforeShow: function (textbox, instance) {
    		       var txtBoxOffset = $(this).offset();
    		       var top = txtBoxOffset.top;
    		       var left = txtBoxOffset.left;
    		       var textBoxWidth = $(this).outerWidth();
    		       console.log('top: ' + top + 'left: ' + left);
    		               setTimeout(function () {
    		                   instance.dpDiv.css({
    		                       top: top-190, //you can adjust this value accordingly
    		                       left: left + textBoxWidth//show at the end of textBox
    		               });
    		           }, 0);

    		   }
    	
    });
  } ); */
  

  $( function() {
	    $( "#halfPick" ).datepicker({
	    	beforeShow: function (textbox, instance) {
			       var txtBoxOffset = $(this).offset();
			       var top = txtBoxOffset.top;
			       var left = txtBoxOffset.left;
			       var textBoxWidth = $(this).outerWidth();
			               setTimeout(function () {
			                   instance.dpDiv.css({
			                       top: top-210, //you can adjust this value accordingly  
			                       left: left//show at the end of textBox
			               });
			           }, 0);

			   }
	    });
	  } );
  
$( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          beforeShow: function (textbox, instance) {
		       var txtBoxOffset = $(this).offset();
		       var top = txtBoxOffset.top;
		       var left = txtBoxOffset.left;
		       var textBoxWidth = $(this).outerWidth();
		               setTimeout(function () {
		                   instance.dpDiv.css({
		                       top: top-210, //you can adjust this value accordingly
		                       left: left//show at the end of textBox
		               });
		           }, 0);

		   }
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        beforeShow: function (textbox, instance) {
		       var txtBoxOffset = $(this).offset();
		       var top = txtBoxOffset.top;
		       var left = txtBoxOffset.left;
		       var textBoxWidth = $(this).outerWidth();
		               setTimeout(function () {
		                   instance.dpDiv.css({
		                       top: top-210, //you can adjust this value accordingly  
		                       left: left//show at the end of textBox
		               });
		           }, 0);

		   }
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );



$(document).ready(function(){
	
	
	  $('#summernote').summernote({
		  lang: 'ko-KR',
	      height: 200,
	      popover: {
	    	  image:[],
	    	  link:[],
	    	  air:[]
	      } ,
	      toolbar: [
	    	    // [groupName, [list of button]]
	    	    ['style', ['bold', 'italic', 'underline', 'clear']],
	    	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    	    ['fontsize', ['fontsize']],
	    	    ['color', ['color']],
	    	    ['para', ['ul', 'ol', 'paragraph']],
	    	    ['table', ['table']],
	    	    ['insert', ['link', 'picture', 'hr']],
	    	    ['height', ['height']]
	    	  ],
	    	  focus: true,
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}
	  });
	  
	  $.ajax({
          type: 'POST',
          url: "${pageContext.request.contextPath}/apv_Vacat/getVacation",
          success: function(data) {
				console.log(data);
              // Call the "updateEvent" method
              
              $('#leftVacat').text(data);
              
          }
        });
	  
}) // ready end


function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
  	data: form_data,
  	type: "POST",
  	url: '${ pageContext.request.contextPath}/approval/apv_textImg',
  	cache: false,
  	contentType: false,
  	enctype: 'multipart/form-data',
  	processData: false,
  	success: function(img_name) {
    		$(el).summernote('editor.insertImage', img_name);
  	}
	});
} // sendFile end


function selectMem(){
	window.open('${pageContext.request.contextPath}/approval/pikAuthMem','결제자선택','width=800 , height=500 ,resizable = no, scrollbars = no');
} // selectMem end 


function getLength(){
	
	var to = moment($('#to').val())
	var from = moment($('#from').val())

	if(!isNaN(to.diff(from, 'days'))){
		$('#length').text(to.diff(from, 'days')+1);
	}

}

function selectV(){
	var whatV = $('#whatV').val();
	
	if(whatV == '1_wholeVacat'){
		$('#wholeVacat').css('display','block');
		$('#halfVacat').css('display','none');
	}else if(whatV == '2_halfVacat'){
		$('#wholeVacat').css('display','none');
		$('#halfVacat').css('display','block');
	}
}



var doubleSubmitFlag = true;


function sendApv(){
	if(confirm('제출 이후에는 삭제하실 수 없습니다.\n정말 제출 하시겠습니까?')){
		if(doubleSubmitFlag){
			
			if(Number($('#length').text()) > Number($('#leftVacat').text())){
				alert('사용 가능한 연차 수를 확인하세요.');
				return;
			}
			console.log($('#length').text())
			$('#countVacat').val($('#length').text());
			
			$('#approval_cc').val($('#whatV').val());
			console.log("approval_cc "+$('#whatV').val())
			
			if($('#whatV').val() == '1_wholeVacat'){ // 연차휴가
					$('#approval_startdate').val(new Date(moment($('#from').val()).format('YYYY-MM-DD')+" "+$('#whole_start').val()));
					$('#approval_enddate').val(new Date(moment($('#to').val()).format('YYYY-MM-DD')+" "+$('#whole_end').val()));
			}else{ // 반차
				if($(':radio[name="AMPM"]:checked').val() == 'AM'){
					$('#approval_startdate').val(new Date(moment($('#halfPick').val()).format('YYYY-MM-DD')+" "+$('#AM_start').val()));
					$('#approval_enddate').val(new Date(moment($('#halfPick').val()).format('YYYY-MM-DD')+" "+$('#AM_end').val()));
				}else{
					$('#approval_startdate').val(new Date(moment($('#halfPick').val()).format('YYYY-MM-DD')+" "+$('#PM_start').val()));
					$('#approval_enddate').val(new Date(moment($('#halfPick').val()).format('YYYY-MM-DD')+" "+$('#PM_end').val()));
				}
			}

			console.log($('#approval_startdate').val());
			console.log($('#approval_enddate').val());
			
			
			for(var i = 1 ; i <=3 ; i++){
		
				$('#authId'+i+'').val($('#authId'+i+'').text())
				
			}
			
			if($('#authId1').val() == ''){
				alert('결재라인을 선택해주세요')
				return;
			}
			if(($('#approval_title').val()).trim() == ''){
				alert('제목을 입력해주세요')
				return;
			}
			if(($('#summernote').val()).trim() == ''){
				alert('내용을 입력해주세요')
				return;
			}
		
			
			$('#sendApv').submit();
			doubleSubmitFlag = false;
		
		}else{
			return;
		}
	}else{
		return;
	}
}// sendApv end

function timeChk(){
	console.log($('#timeChk').val());
	console.log(moment($('#halfPick').val()).format('YYYY-MM-DD')+" "+$('#timeChk').val());
}


</script>

</head>
<body>
	
	
	<div class="container">
	<h2>결재문서 작성</h2>
	
	<div class="text-right">
	<table border="1" style="display: inline-block">
	
	<tr>
	<td class="tt" rowspan='3'>결재</td>
	<td class="aa">작성자</td>
	
	<td id="authRank1" class="aa"></td>
	
	<td id="authRank2" class="aa"></td>
	
	<td id="authRank3" class="aa"></td>
	
	</tr>
	
	
	<tr>
	
	<td>${ sessionScope.member.member_name }</td>
	<td id="authName1"></td>
	<td id="authName2"></td>
	<td id="authName3"></td>
	
	</tr>
	
	<tr>
	
	<td>${ sessionScope.member.member_id }</td>
	<td id="apv_mem1"></td>
	<td id="apv_mem2"></td>
	<td id="apv_mem3"></td>
	
	</tr>
	
	</table>
	</div>
	
	<button onclick="selectMem()">결재라인 추가</button>



<div>
	<select id="whatV" onclick="selectV()" >
		<option value="1_wholeVacat" selected="selected">연차휴가</option>
		<option value="2_halfVacat">반차</option>
	</select>
</div>


<div id="wholeVacat">
요청기간
<label for="from">시작일</label>
<input type="text" id="from" name="from" onchange="getLength()">
<label for="to">종료일</label>
<input type="text" id="to" name="to" onchange="getLength()">
<span>(&nbsp;총&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="length"></span>&nbsp;일&nbsp;)</span>
</div>

<div style="display:none;">
<input type="time" id="AM_start" onchange="timeChk()" value="09:00">
<input type="time" id="AM_end" onchange="timeChk()" value="13:00">
<input type="time" id="PM_start" onchange="timeChk()" value="14:00">
<input type="time" id="PM_end" onchange="timeChk()" value="18:00">

<input type="time" id="whole_start" onchange="timeChk()" value="00:00">
<input type="time" id="whole_end" onchange="timeChk()" value="23:00">
</div>

<div id="halfVacat" style="display: none;">
요청기간
<input type="text" id="halfPick" name="halfPick">
<input type="radio" name="AMPM" value="AM" checked="checked">오전
<input type="radio" name="AMPM" value="PM">오후
</div>

<div>[잔여일 : <span id="leftVacat"></span>일]</div>


	<div>
	
	<input type="hidden" id="authDept1" name="authDept1" value="${ apvReWrite.department_name1 }">
	<input type="hidden" id="authDept2" name="authDept2" value="${ apvReWrite.department_name2 }">
	<input type="hidden" id="authDept3" name="authDept3" value="${ apvReWrite.department_name3 }">
	
	${ apvReWrite }
	
<form id="sendApv" action="${ pageContext.request.contextPath }/approval" method="POST" enctype="multipart/form-data"> <!-- ============================================================================================================================================================= -->

	<input type="hidden" id="authId1" name="approval_mem1" >
	<input type="hidden" id="authId2" name="approval_mem2" >
	<input type="hidden" id="authId3" name="approval_mem3" >
	
	<input type="hidden" id="apvCateGo" name="approval_cate" value="2" >
	
	<input type="hidden" id="approval_cc" name="approval_cc" >
	
	
	<input type="hidden" id="approval_startdate" name="approval_startdate">
	<input type="hidden" id="approval_enddate" name="approval_enddate" >

	<input type="hidden" id="countVacat" name="countVacat">		
	
	제목<input id= 	"approval_title" type="text" name="approval_title" > <br>
	
	<div>
		<textarea id="summernote" name="approval_content" ></textarea> <br>
	</div>
	
	<div class="row">
		<div class="float-left">
			<input type="file" name="file" />
		</div>
	</div>
	
	
	
</form> <!-- ============================================================================================================================================================= -->

		<div class="text-right">
			<button onclick="sendApv()">제출하기</button>
		</div>
		
	
	</div>
</div>

</body>
</html>