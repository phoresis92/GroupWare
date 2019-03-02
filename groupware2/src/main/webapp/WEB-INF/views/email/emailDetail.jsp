<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body>
<div class="container-fluid text-center">
		
		<div class="col-lg-10">
 			
             
              <div class="card" >
                <div class="card-header py-3">
                
                  <h4 class="m-0 font-weight-bold text-primary"><strong>${email.title}</strong></h4>
                  <div align="right">
	                  <strong>작성일</strong> 
	                  <fmt:formatDate value="${email.send_date}" pattern="yyyy-MM-dd HH:mm:dd"/>
                  </div>
                </div>
               
                <div class="card-body text-center">
                  <div align="left"><strong>보낸사람</strong> ${email.sender}&#32;&#60;${email.sender_id}&#62;</div>
                  <div align="left"><strong>받는사람</strong> ${email.receiver}&#32;&#60;${email.receiver_id}&#62;</div>
                  
                  <hr>
                  
                  <div style="height:450px; overflow:auto;" align=left>${email.content}</div>
                 
                  <hr>
                 
					<c:url var="reply" value="email/reply">
						<c:param name="email_id" value="${email.email_id}" />
						<c:param name="type" value="${type}" />
					</c:url>
					<c:url var="restore" value="email/restore">
						<c:param name="email_id" value="${email.email_id}" />
						<c:param name="type" value="${type}" />
					</c:url>
					<c:url var="list" value="email/list">
						<c:param name="email_id" value="${email.email_id}" />
						<c:param name="type" value="${type}" />
					</c:url>
					<c:url var="delete" value="email/delete">
						<c:param name="email_id" value="${email.email_id}" />
						<c:param name="type" value="${type}" />
					</c:url>
					
					<div class="container">
					
						<c:if test="${email.email_status eq '1' && email.type eq '0'}">
						<a class="mr-sm-2 btn btn-outline-secondary btn-sm"
							href="${pageContext.request.contextPath}/${reply}">다시 보내기</a>
						</c:if>
						<c:if test="${email.email_status eq '1' && email.type eq '1'}">
						<a class="mr-sm-2 btn btn-outline-secondary btn-sm"
							href="${pageContext.request.contextPath}/${reply}">답장</a>
						</c:if>
						<c:if test="${email.email_status eq '2'}">
						<a class="mr-sm-2 btn btn-outline-secondary btn-sm"
							href="${pageContext.request.contextPath}/${restore}">복구</a>
						</c:if>						
						<a class="mr-sm-2 btn btn-outline-secondary btn-sm"
							href="${pageContext.request.contextPath}/${list}">목록</a>
						<a class="mr-sm-2 btn btn-outline-secondary btn-sm"
							href="${pageContext.request.contextPath}/${delete}">삭제</a>
						<br>
					
                </div>
              </div>
			
            </div>
	
	</div>
	
</div>				
</body>
</html>