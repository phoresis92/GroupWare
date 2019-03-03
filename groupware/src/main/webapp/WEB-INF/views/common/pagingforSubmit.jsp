<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${searchVO.totPage>1}">
	<ul class="pagination justify-content-center">							
						
		<c:if test="${searchVO.page!=1}">
			<li class="page-item"><a class="page-link" href="javascript:fnSubmitForm(1);"><i class="fas fa-angle-double-left"></i></a></li>
		</c:if>
		<c:if test="${searchVO.page>=11}">
			<li class="page-item"><a class="page-link" href="javascript:fnSubmitForm(${searchVO.pageStart-1});"><i class="fas fa-angle-left"></i></a></li>
		</c:if>				
		<c:forEach var="i" begin="${searchVO.pageStart}" end="${searchVO.pageEnd}" step="1">
            <c:choose>
                <c:when test="${i eq searchVO.page}">
                	<li class="page-item  active"><a class="page-link" href="#"><c:out value="${i}"/></a></li>
                </c:when>
                <c:otherwise>
                	<li class="page-item"><a class="page-link" href="javascript:fnSubmitForm(${i});"><c:out value="${i}"/></a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>        
		<c:if test="${searchVO.totPage != searchVO.pageEnd}">
			<li class="page-item"><a class="page-link" href="javascript:fnSubmitForm(${searchVO.pageEnd+1});"><i class="fas fa-angle-right"></i></a></li>
			<li class="page-item"><a class="page-link" href="javascript:fnSubmitForm(${searchVO.totPage});"><i class="fas fa-angle-double-right"></i></a></li>
		</c:if>
	</ul>
	<br/>
		
	<input type="hidden" name="page" id="page" value="" />
		
	<script type="text/javascript">
	function fnSubmitForm(page){ 
		document.form1.page.value=page;
		document.form1.submit();
	}
	</script>
</c:if>
