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
    var dateFormat = "yy/mm/dd",
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
	      height: 400,
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
요청기간
<label for="from">시작일</label>
<input type="text" id="from" name="from">
<label for="to">종료일</label>
<input type="text" id="to" name="to">
[잔여일 : 15일 0시간] 설정해야함!
<!-- ================================================================================================ -->
</div>



	<div>
	
	<input type="hidden" id="authDept1" name="authDept1" value="${ apvReWrite.department_name1 }">
	<input type="hidden" id="authDept2" name="authDept2" value="${ apvReWrite.department_name2 }">
	<input type="hidden" id="authDept3" name="authDept3" value="${ apvReWrite.department_name3 }">
	
	${ apvReWrite }
	
<form id="sendApv" action="${ pageContext.request.contextPath }/approval" method="POST" enctype="multipart/form-data"> <!-- ============================================================================================================================================================= -->
	

	<input type="hidden" id="authId1" name="approval_mem1" value="${ apvReWrite.approval_mem1 }">
	<input type="hidden" id="authId2" name="approval_mem2" value="${ apvReWrite.approval_mem2 }">
	<input type="hidden" id="authId3" name="approval_mem3" value="${ apvReWrite.approval_mem3 }">
	
	<input type="hidden" id="apvCateGo" name="approval_cate" value="${ apvReWrite.approval_cate }">
	
	<input type="hidden" id="approval_cc" name="approval_cc" value="${ apvReWrite.approval_cc }">
	
	제목<input id="approval_title" type="text" name="approval_title" value="${ apvReWrite.approval_title }"> <br>
	
	<div>
		<textarea id="summernote" name="approval_content" >${ apvReWrite.approval_content }</textarea> <br>
	</div>
	
	<div class="row">
		<div class="float-left">
			<input type="file" name="file" value="${ apvReWrite.approval_filepath }"/>
		</div>
	</div>
	
	
	
</form> <!-- ============================================================================================================================================================= -->

		<div class="text-right">
			<button onclick="sendApv()">제출하기</button>
			<button data-toggle="modal" data-target="#comment" >저장하기</button>
		</div>
		
	
	</div>
</div>

</body>
</html>