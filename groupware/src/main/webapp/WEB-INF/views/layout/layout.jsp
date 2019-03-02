<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>
<tiles:insertAttribute name="title" ignore="true" />
</title>

<script defer src="https://use.fontawesome.com/releases/v5.7.2/js/solid.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.7.2/js/fontawesome.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<!-- 횡스크롤 원인 -->
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
 .side_layout{float:left; max-width:device-width;}
@media (min-width:600px){
.side_layout{float:left; min-width:240px; max-width:240px !important;}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var id = $("#header_member_id").val();
	var param = "member_id="+id;
	$.ajax({
		type:"POST",
		url:"../email/count",
		data:param,
		success:function(data){
			var obj = eval('('+data+')');
			$("#email_count").html(obj.value);
			$("#menu_email_count").html(obj.value);
			$("#header_email_count").html(obj.value);
			$("#header_email_count2").html(obj.value);
			$("#main_email_count").html(obj.value);
		}
	});
});
setInterval('email()', 30000)

function email(){
	if($("#header_member_id").val() == "") {
		$(location).attr("href", "../member/logout");
	}
	var id = $("#header_member_id").val();
	var param = "member_id="+id;
	$.ajax({
		type:"POST",
		url:"../email/pop3",
		data:param,
		success:function(data){
			var obj = eval('('+data+')');
			$("#email_count").html(obj.value);
			$("#menu_email_count").html(obj.value);
			$("#header_email_count").html(obj.value);
			$("#header_email_count2").html(obj.value);
			$("#main_email_count").html(obj.value);
		}
	});
}
$(function() {
	if($("#header_member_id").val() == "") {
		$(location).attr("href", "../member/logout");
	}
});

</script>
</head>
<body>
<div>

<div class="content" style="font-family:Verdana,sans-serif;line-height:1.5;font-size:15px;">
		<tiles:insertAttribute name="header" />
	</div>
	
	<div class="row" style="font-family:Verdana,sans-serif;line-height:1.5;font-size:15px;">
<div class="col-sm side_layout" style="padding-right:0px !important;">
			<tiles:insertAttribute name="menu" />
		</div>
		<div class="col-sm-7 col-md-8 col-lg-9" style="float:left;">
		<!-- <div class="container-fluid"> -->
		<br>
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	

</div>
<div class="content">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>