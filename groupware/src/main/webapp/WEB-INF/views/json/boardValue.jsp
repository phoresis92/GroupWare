<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
	<c:forEach var="listview" items="${listview}" varStatus="status">
		<c:if test="${not status.first }">,</c:if>
		{
		'brdno' : ${listview.brdno},
		'brddate' : '${listview.brddate}',
		'brdhit' : '${listview.brdhit}',
		'title' : '${listview.brdtitle}',
		'brdwriter' : '${listview.brdwriter}',
		'replycnt' : '${listview.replycnt}',
		'filecnt' : '${listview.filecnt}'	
		}	
	</c:forEach>
]