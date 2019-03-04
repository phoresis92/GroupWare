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
 <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
<div>

<div class="content">
		<tiles:insertAttribute name="header" />
	</div>
	
	<div class="row">
		<div class="side_layout bg-gradient-primary">
			<tiles:insertAttribute name="menu" />
		</div>
		<div class="col-sm col-md col-lg container-fluid">
		<!-- <div class="container-fluid"> -->
			<br>
			<tiles:insertAttribute name="body" />
			<br>
		</div>
	</div>
	

</div>
<div class="content">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>