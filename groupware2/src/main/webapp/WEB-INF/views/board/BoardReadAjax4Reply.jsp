<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<div id="replyItem<c:out value="${replyInfo.reno}"/>" 
	  style="border: 1px light gray; margin-left: <c:out value="${20*replyInfo.redepth}"/>px; display: inline-block">	
	  
	  <div class="card-header py-3" style="height:50px !important">
	<strong class="m-0 font-weight-bold text-primary"><c:out value="${replyInfo.rewriter}"/></strong> <c:out value="${replyInfo.redate}"/>
	<c:if test="${sessionScope.member.member_status eq '9' || sessionScope.member.member_name eq replyInfo.rewriter}">
		<a href="#"  onclick="fn_replyDelete('<c:out value="${replyInfo.reno}"/>')">삭제</a>
		<<c:if test="${sessionScope.member.member_name eq replyInfo.rewriter}">
		<a href="#"  onclick="fn_replyUpdate('<c:out value="${replyInfo.reno}"/>')">수정</a>
		</c:if>
	</c:if>
	<a href="#"  onclick="fn_replyReply('<c:out value="${replyInfo.reno}"/>')">댓글</a>
	</div>
	<div id="reply<c:out value="${replyInfo.reno}"/>"><c:out value="${replyInfo.rememo}"/></div>
</div>

	
<%-- 
				<div id="replyItem<c:out value="${replylist.reno}"/>"
							style="border: 1px light gray; margin-left: <c:out value="${20*replylist.redepth}"/>px; display: inline-block">	
					
					<div class="card-header py-3" style="height:50px !important">
					<strong class="m-0 font-weight-bold text-primary"><c:out value="${replylist.rewriter}"/></strong> <c:out value="${replylist.redate}"/>
					
					<a href="#" class="btn btn-outline-secondary btn-sm" onclick="fn_replyDelete('<c:out value="${replylist.reno}"/>')">삭제</a>
					<a href="#" class="btn btn-outline-secondary btn-sm" onclick="fn_replyUpdate('<c:out value="${replylist.reno}"/>')">수정</a>
					<a href="#" class="btn btn-outline-secondary btn-sm" onclick="fn_replyReply('<c:out value="${replylist.reno}"/>')">댓글</a>
					</div>
					
					<div id="reply<c:out value="${replylist.reno}"/>"><c:out value="${replylist.rememo}"/></div>
				</div><br/>
			</c:forEach>
		</div> --%>