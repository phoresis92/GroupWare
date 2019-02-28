<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board8</title>
<script>
function fn_formSubmit(){
	document.form1.submit();	
}
</script>
</head>
<body>
<div class="container-fluid">
    							<h2>자유게시판</h2>
    			
	<table class="table table-hover text-center">
		
		<colgroup>
			<col width='8%' />
			<col width='*%' />
			<col width='15%' />
			<col width='15%' />
			<col width='10%' />
			<col width='10%' />
		</colgroup>
		<thead>
			<tr class="text-center">
				<th>번호</th> 
				<th>제목</th>
				<th>등록자</th>
				<th>등록일</th>
				<th>조회수</th>
				<th>첨부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listview" items="${listview}" varStatus="status">	
				<c:url var="link" value="boardRead">
					<c:param name="brdno" value="${listview.brdno}" />
					<c:param name="brddate" value="${listview.brddate}" />
					<c:param name="brdhit" value="${listview.brdhit}" />
				</c:url>		
										  				
				<tr>
					<td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/></td>
					<td style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
						<a href="${pageContext.request.contextPath}/${link}"><c:out value="${listview.brdtitle}"/></a>
						<c:if test="${listview.replycnt>0}">
							(<c:out value="${listview.replycnt}"/>)
						</c:if>						
					</td>
					<td class="text-center"><c:out value="${listview.brdwriter}"/></td>
					<td><c:out value="${listview.brddate}"/></td>
					<td><c:out value="${listview.brdhit}"/></td>
					<td><c:out value="${listview.filecnt}"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="right"><a class="btn btn-primary" href="boardForm?bgno=<c:out value="${searchVO.bgno}"/>">글작성</a>
	</div>
	</div>
	

	<div align="center">
	<form id="form1" name="form1"  method="post">
	    <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
	    
		<div class="container-fluid" align="center">
			<input type="checkbox" checked="checked" name="searchType" value="brdtitle" <c:if test="${fn:indexOf(searchVO.searchType, 'brdtitle')!=-1}">checked="checked"</c:if>/>
			<label class="chkselect" for="searchType1">제목</label>
			<input type="checkbox" name="searchType" value="brdmemo" <c:if test="${fn:indexOf(searchVO.searchType, 'brdmemo')!=-1}">checked="checked"</c:if>/>
			<label class="chkselect" for="searchType2">내용</label>
			<input type="text" name="searchKeyword" style="width:150px;" maxlength="50" value='<c:out value="${searchVO.searchKeyword}"/>' onkeydown="if(event.keyCode == 13) { fn_formSubmit();}">
			<input name="btn_search" value="검색" class="btn btn-primary" type="button" onclick="fn_formSubmit()" />
		</div>
	</form>	
	</div>
</body>
</html>
