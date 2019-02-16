<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="container-fluid text-center">
	<div class="row content">			
			<div class="col-sm-9 text-left">
				<br>
  <h2>메일 작성</h2><br>              
  <form action="${pageContext.request.contextPath}/board" method="post">
    <div class="form-group">
      <label for="title">제목:</label>
      <input type="text" class="form-control" id="email_title" name="email_title">
    </div>
    <div class="form-group">
      <label for="content">내용:</label>
      <textarea class="form-control" rows="10" id="email_content" name="email_content"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">게시</button>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/board?board_code=list&page=1">목록</a>
  </form>
<br>
</div>
</div>
</div>
</body>
</html>