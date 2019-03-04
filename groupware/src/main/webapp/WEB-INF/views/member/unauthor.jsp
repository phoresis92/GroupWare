<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">

<!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script>
function next()
{location = "${pageContext.request.contextPath}/member/login";}

setInterval('time()', 1000)

function time(){
	var time = $("#time").html();
	if (time > 1) {
		$("#time").html(time-1);
	}
}
</script>
</head>
<body onLoad="setTimeout('next()', 5000)">
<div class="container-fluid">

<!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9" style="height:100% !important">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
               <div class="col-lg-6 d" style="background-color:#eaf8ff !important"><img id="file_img" src="${pageContext.request.contextPath}/resources/img/ALPHA.png" alt="사진"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome KIT!</h1>
                  </div>
                <form>
           		<c:choose>
					<c:when test="${type eq '0'}">
						<h3>가입을 축하합니다.</h3>
						<h3>가입 축하 이메일을 보냈으니 확인하시기 바랍니다.</h3>
						<h3>감사합니다.</h3>
					</c:when>
					<c:when test="${type eq '1'}">
						<h3>관리자 승인 후 이용 가능합니다.</h3>
					</c:when>
					<c:when test="${type eq '2'}">
						<h3>퇴직 회원입니다.</h3>
						<h3>관리자에게 문의 해보시기 바랍니다.</h3>
					</c:when>
					<c:otherwise>
						<h3>정지 회원입니다.</h3>
						<h3>관리자에게 문의 해보시기 바랍니다.</h3>
					</c:otherwise>
				</c:choose>
				<br><h3><strong><span id="time">5</span>초 후 로그인 페이지로 이동합니다!</strong></h3>

                  <hr>
                  <div class="text-center">
                    <a class="small" href="">About Kitware!</a>
                  </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>	
</div>
</body>
</html>