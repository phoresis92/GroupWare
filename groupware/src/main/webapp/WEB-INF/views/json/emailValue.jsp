<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
[
	<c:forEach var="value" items="${list}" varStatus="status">
		<c:if test="${not status.first }">,</c:if>
		{
		'email_id' : '${value.email_id}',
		'title' : '${value.title}',
		'sender' : '${value.sender}',
		'send_date' : '<fmt:formatDate value="${value.send_date}" pattern="yyyy-MM-dd HH:mm:ss"/>',
		'email_status' : ${value.email_status},
		'type' : ${type}
		}	
	</c:forEach>
]