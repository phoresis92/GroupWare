<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
	<c:forEach var="value" items="${map.list}" varStatus="status">
		<c:if test="${not status.first }">,</c:if>
		{'rank_id' : ${value.rank_id},
		 'rank_name' : '${value.rank_name}'
		<c:forEach var="count" items="${map.count}" begin="${status.count-1}" end="${status.count-1}">			
			,'rank_count' : ${count}		
		</c:forEach>
		}	
	</c:forEach>
]