<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<div class="container col-5" style="border: 1px solid gray; padding: 5px 10px 5px 20px; overflow-x:hidden; overflow-y:auto;">
    	
    	<div class="row">
    	<label>성명</label>
    	<input type="text" id="searchN"/>
    	<button id="searchNm" onclick="searchName()">검색</button>
    	</div>
    	
    	<div class="row">
    	
    	<table>
    	
    	<tr>
    	<th>부서</th>
    	<th>성명</th>
    	<th>직위</th>
    	<th>사번</th>
    	</tr>
    	
    	
    	</table>
    	
    	</div>
    
    </div>
</div>
</body>
</html>