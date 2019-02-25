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

<style>
 .side_layout{float:left; max-width:device-width;}
@media (min-width:576px){
.side_layout{float:left; min-width:165px; max-width:165px !important;}
</style>
</head>
<body>
<div>
	<div class="content" style="font-family:Verdana,sans-serif;line-height:1.5;font-size:15px;">
		<tiles:insertAttribute name="header" />
	</div>
	
	<div class="row" style="font-family:Verdana,sans-serif;line-height:1.5;font-size:15px;">
		<div class="col-sm side_layout w3-lihgt-grey">
			<tiles:insertAttribute name="menu" />
		</div>
		<div class="col-sm-8 col-md-9 col-lg-10" style="float:left;">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	
	<div class="content">
		<tiles:insertAttribute name="footer" />
	</div>
</div>

</body>
</html>