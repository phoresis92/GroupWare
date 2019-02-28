<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
[
	<c:forEach var="value" items="${list}" varStatus="status">
		<c:if test="${not status.first }">,</c:if>
		{
		'date' : '<fmt:formatDate value="${value.commuting_arrive}" pattern="yyyy-MM-dd"/>',
		'arrive' : '<fmt:formatDate value="${value.commuting_arrive}" pattern="hh:mm:ss"/>',
		'leave' : '<fmt:formatDate value="${value.commuting_leave}" pattern="hh:mm:ss"/>',
		'time' : '${value.commuting_leave}'
		}	
	</c:forEach>
]