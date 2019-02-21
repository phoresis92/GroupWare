<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
	<c:forEach var="value" items="${list}" varStatus="status">
		<c:if test="${not status.first }">,</c:if>
		{'value' : ${value}}	
	</c:forEach>
]