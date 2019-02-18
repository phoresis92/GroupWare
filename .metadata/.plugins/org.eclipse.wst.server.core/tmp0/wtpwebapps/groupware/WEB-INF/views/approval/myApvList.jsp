<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script>

function detail(j){
	
	console.log(j)
	
	$('<form></form>').attr('action',"${pageContext.request.contextPath}/approval/myApvDetail").attr('method', 'POST').attr('id','detail').appendTo('#body');
	$('<input></input>').attr('type','hidden').attr('value',j).attr('name','approval_id').appendTo('#detail');
	$('#detail').submit();
}

</script>

</head>
<body id="body">

	<%-- ${ apvList } --%>
	
	<table>
	
	<tr>
	<th>문서번호</th>
	<th>제목</th>
	<th>문서분류</th>
	<th>상태</th>
	<th>기안일</th>
	</tr>
	
	<c:forEach var="item" items="${ apvList }" begin="${ pageInfo.startNum }" end="${ pageInfo.endNum }">
	
		<tr onclick="detail(${item.approval_id})" style="cursor: pointer;">
			<td>${ item.approval_id }</td>
			<td><a >${ item.approval_title }</a></td>
			<td>${ item.apv_cate_name }</td>
			
			<c:choose>
			
				<c:when test="${ empty item.approval_auth3 }">
					<c:choose>
					
						<c:when test="${ empty item.approval_auth2 }">
						
							<c:forEach var="i" items="${ apvAuthList }">
					
								<c:if test="${ item.approval_auth1 == i.apv_auth_id }"><td>${ i.apv_auth_name }</td></c:if>
					
							</c:forEach>
						
						</c:when>
					
						<c:otherwise>
						
							<c:forEach var="i" items="${ apvAuthList }">
					
								<c:if test="${ item.approval_auth2 == i.apv_auth_id }"><td>${ i.apv_auth_name }</td></c:if>
					
							</c:forEach>
						
						</c:otherwise>
					
					</c:choose>
				
				</c:when>
				
				<c:otherwise>
				
					<c:forEach var="i" items="${ apvAuthList }">
					
						<c:if test="${ item.approval_auth3 == i.apv_auth_id }"><td>${ i.apv_auth_name }</td></c:if>
					
					</c:forEach>
					
				</c:otherwise>
			
			</c:choose>
			
			<td><fmt:formatDate value="${ item.approval_indate }"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	
	</c:forEach>
	
	
	</table>
	
	<div>
			
			<ul class="pagination justify-content-center">
			
				<c:choose>
					<c:when test="${ pageInfo.page eq 1 }">
					
					<li class="page-item disabled"><a class="page-link" href="#">1</a></li>
					
					</c:when>
					
					<c:when test="${ pageInfo.page eq 0 }">
					
					<li class="page-item disabled"><a class="page-link" href="#">1</a></li>
					
					</c:when>
				
					<c:otherwise>
					
					<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=1">1</a></li>
					
					</c:otherwise>
				</c:choose>
			
			
				<c:choose>
					<c:when test="${ pageInfo.page <= 1 }">
										
					<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
					
					</c:when>
					
					<c:otherwise>
					
					<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=${ pageInfo.page -1 }">이전</a></li>
					
					</c:otherwise>
					
				</c:choose>
			
			
				<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
				
					<c:choose>
					<c:when test="${i eq pageInfo.page }">
					
					<li class="page-item active"><a class="page-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=${ i }">${ i }</a></li>
					
					</c:when>
					
					<c:otherwise>
					
					<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=${ i }">${ i }</a></li>
					
					</c:otherwise>
					
					</c:choose>
				</c:forEach>
			
			
			
			
				<c:choose>
				
					<c:when test="${ pageInfo.page >= pageInfo.totalPage }">
					
					<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
					
					</c:when>
					
					<c:otherwise>
					
					<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=${ pageInfo.page +1 }">다음</a></li>
	
					</c:otherwise>
				
				</c:choose>
				
			


				
				<c:choose>
				
					<c:when test="${ pageInfo.page eq pageInfo.totalPage }">
					
					<li class="page-item disabled"><a class="page-link" href="#">${ pageInfo.totalPage }</a></li>
					
					</c:when>
					
					<c:otherwise>
					
					<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/approval/myApvList?page=${ pageInfo.totalPage }">${ pageInfo.totalPage }</a></li>
					
					</c:otherwise>
					
				</c:choose>
				
			</ul> <!-- Paging end -->


			</div>

${ pageInfo }

	
<!-- 	approval_id number auto_increment primary key,
approval_cate number(3) not null,
approval_member_id number(20) not null,
approval_mem1 number(20),
approval_mem2 number(20),
approval_mem3 number(20),
approval_auth1 number(1),
approval_auth2 number(1),
approval_auth3 number(1),
approval_title varchar2(500) not null,
approval_content varchar2(5000) not null,
approval_filepath varchar2(1000),
approval_filename varchar2(1000),
approval_return varchar2(1000),
approval_indate date default sysdate,
approval_enddate date,
approval_cc varchar2(1000),
 -->


</body>
</html>