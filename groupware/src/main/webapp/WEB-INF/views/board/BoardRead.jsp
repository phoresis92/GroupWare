<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/jquery-2.2.3.min.js"></script>
  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<script>

function chkInputValue(id, msg){
	if ( $.trim($(id).val()) == "") {
		alert(msg+" 입력해주세요.");
		$(id).focus();
		return false;
	}
	return true;
}
function fn_formSubmit(){
	if ( ! chkInputValue("#rewriter1", "작성자를")) return;
	if ( ! chkInputValue("#rememo1", "글 내용을")) return;
	
	var formData = $("#form1").serialize();
	$.ajax({
		url: "boardReplySave", 
		type:"post", 
		data : formData,
		success: function(result){
			if (result!=="") {
				$("#rewriter1").val("");
				$("#rememo1").val("");
				$("#replyList").append(result);
				alert("저장되었습니다.");
			} else{
				alert("서버에 오류가 있어서 저장되지 않았습니다.");
			}
		}
	})		
}

function fn_replyDelete(reno){
	if (!confirm("삭제하시겠습니까?")) {
		return;
	}
	$.ajax({
		url: "boardReplyDelete",
		type:"post", 
		data: {"reno": reno},
		success: function(result){
			if (result=="OK") {
				$("#replyItem"+reno).remove();
				alert("삭제되었습니다.");
			} else{
				alert("댓글이 있어서 삭제할 수 없습니다.");
			}
		}
	})
}

var updateReno = updateRememo = null;
function fn_replyUpdate(reno){
	hideDiv("replyDialog");
	
	$("#replyDiv").show();
	
	if (updateReno) {
		$("#replyDiv").appendTo(document.body);
		$("#reply"+updateReno).text(updateRememo);
	} 
	
	$("#reno2").val(reno);
	$("#rememo2").val($("#reply"+reno).text());
	$("#reply"+reno).text("");
	$("#replyDiv").appendTo($("#reply"+reno));
	$("#rememo2").focus();
	updateReno   = reno;
	updateRememo = $("#rememo2").val();
} 

function fn_replyUpdateSave(){
	if ( ! chkInputValue("#rememo2", "글 내용을")) return;
	
	var formData = $("#form2").serialize();
	$.ajax({
		url: "boardReplySave", 
		type:"post", 
		data : formData,
		success: function(result){
			if (result!=="") {
				$("#reply"+updateReno).text($("#rememo2").val());
				$("#replyDiv").hide();
				alert("저장되었습니다.");
			} else{
				alert("서버에 오류가 있어서 저장되지 않았습니다.");
			}
		}
	})
} 

function fn_replyUpdateCancel(){
	hideDiv("#replyDiv");
	
	$("#reply"+updateReno).text(updateRememo);
	updateReno = updateRememo = null;
} 

function hideDiv(id){
	$(id).hide();
	$(id).appendTo(document.body);
}

function fn_replyReply(reno){
	$("#replyDialog").show();
	
	if (updateReno) {
		fn_replyUpdateCancel();
	} 
	
	$("#reparent3").val(reno);
	$("#rememo3").val("");
	$("#replyDialog").appendTo($("#reply"+reno));
	$("#rewriter3").focus();
} 
function fn_replyReplyCancel(){
	hideDiv("#replyDialog");
} 

function fn_replyReplySave(){
	if ( ! chkInputValue("#rewriter3", "작성자를")) return;
	if ( ! chkInputValue("#rememo3", "글 내용을")) return;

	var formData = $("#form3").serialize();
	$.ajax({
		url: "boardReplySave",
		type:"post", 
		data : formData,
		success: function(result){
			if (result!=="") {
				var parent = $("#reparent3").val();
				$("#replyItem"+parent).after(result);
				$("#replyDialog").hide();
				alert("저장되었습니다.");
				$("#rewriter3").val("");
				$("#rememo3").val("");
			} else{
				alert("서버에 오류가 있어서 저장되지 않았습니다.");
			}
		}
	})	
}
</script>

</head>
<body>
<div class="container">
	<div class="container-fluid text-center">

		<!-- 게시글 -->
 	<div class="col-lg-12">
 			<form action="${pageContext.request.contextPath}/board"	method="post" name="board">
              <div class="card" >
                <div class="card-header py-3">
                  <h4 class="m-0 font-weight-bold text-primary"><strong>${boardInfo.brdtitle}</strong></h4><div align="right"><strong>작성일</strong> ${ brddate }</div>
                </div>
                <div class="card-body text-center">
                  <div align="left">작성자 <strong>${boardInfo.brdwriter}</strong>	 조회수 <strong>${ brdhit }</strong></div>
                  <hr>
                  <div style="height:300px; overflow:auto;" align=left>${boardInfo.brdmemo}</div>
                  <hr>
                  <div><strong>첨부파일</strong><c:forEach var="listview" items="${listview}" varStatus="status">	
            			<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> 							 
						<c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/>
						</c:forEach></div><br>
				<div class="container">
				<a class="btn btn-outline-primary" href="boardList?bgno=<c:out value="${boardInfo.bgno}"/>">돌아가기</a>
				<a class="btn btn-outline-primary" href="boardDelete?bgno=<c:out value="${boardInfo.bgno}"/>&brdno=<c:out value="${boardInfo.brdno}"/>">삭제</a>
				<a class="btn btn-outline-primary" href="boardForm?brdno=<c:out value="${boardInfo.brdno}"/>">수정</a>
				</div>
                </div>
              </div>
			</form>
            </div>
				<br>
				
				
				<!-- 여기부터 댓글 -->
							
	<div class="col-lg-12">		
		<div id="replyList" class="card"> 
			<c:forEach var="replylist" items="${replylist}" varStatus="status">
				<div id="replyItem<c:out value="${replylist.reno}"/>"
							style="border: 1px light gray; margin-left: <c:out value="${20*replylist.redepth}"/>px; display: inline-block">	
				
					<div class="card-header py-3" style="height:50px !important">
					<strong class="m-0 font-weight-bold text-primary"><c:out value="${replylist.rewriter}"/></strong> <c:out value="${replylist.redate}"/>
					
					<a href="#"  onclick="fn_replyDelete('<c:out value="${replylist.reno}"/>')">삭제</a>
					<a href="#"  onclick="fn_replyUpdate('<c:out value="${replylist.reno}"/>')">수정</a>
					<a href="#" onclick="fn_replyReply('<c:out value="${replylist.reno}"/>')">댓글</a>
					</div>
					
					<div align=left id="reply<c:out value="${replylist.reno}"/>"><c:out value="${replylist.rememo}"/></div>
				</div><br/>
			</c:forEach>
		</div>
		
		
		
		<div id="replyDiv" class="card mb-4 py-3 border-bottom-warning" style="display:none; padding-top:2px !important;margin-bottom:2px !important;">
			<form id="form2" name="form2" action="boardReplySave" method="post">
				<div align="center">
				<input type="hidden" id="brdno2" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
				<input type="hidden" id="reno2" name="reno"> 
				<textarea style="width:80% !important;" class="form-control bg-light border-0 small" id="rememo2" name="rememo" rows="3" cols="60" maxlength="500"></textarea>
				</div>
				<hr>
				<div align="center">
								<a href="#" class="btn btn-outline-secondary" onclick="fn_replyUpdateSave()">저장</a>
				<a href="#" class="btn btn-outline-secondary" onclick="fn_replyUpdateCancel()">취소</a>
				</div>
			</form>
		</div>
		
		<div id="replyDialog" class="card mb-4 py-3 border-bottom-warning" style="display:none; padding-top:2px !important; margin-bottom:2px !important;">
			<form id="form3" name="form3" action="boardReplySave" method="post">
				<div align="center">
				<input type="hidden" id="brdno3" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
				<input type="hidden" id="reno3" name="reno"> 
				<input type="hidden" id="reparent3" name="reparent"> 
				<input type="hidden" id="rewriter3" name="rewriter" value="<c:out value="${sessionScope.member.member_name}"/>">
				
				<textarea style="width:80% !important;" class="form-control bg-light border-0 small" id="rememo3" name="rememo" rows="3" cols="60" maxlength="500"></textarea>
				</div>
				<hr>
				<div align="center">
				
				<a href="#" class="btn btn-outline-secondary" onclick="fn_replyReplySave()">저장</a>
				<a href="#" class="btn btn-outline-secondary" onclick="fn_replyReplyCancel()">취소</a>
				</div>
			</form>
		</div>	
		
		
		<!-- 댓글작성창 -->
		<div class="card mb-4 py-3 border-bottom-warning"">
			<form id="form1" name="form1">
			<div align="center">
				<input type="hidden" id="brdno1" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
				<%-- <input style="width:20%" class="form-control bg-light border-0 small" type="text" id="rewriter1" name="rewriter" size="20" maxlength="20" value="<c:out value="${sessionScope.member.member_name}"/>" readonly> <br/> --%>
				<input type="hidden" id="rewriter1" name="rewriter" value="<c:out value="${sessionScope.member.member_name}"/>">
				<textarea style="width:80% !important;" class="form-control bg-light border-0 small" id="rememo1" name="rememo"  rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
				</div>
				<hr>
				<a class="btn btn-outline-primary" href="#" onclick="fn_formSubmit()">저장</a>
			</form>
		</div>
		</div>	
		</div>
		</div>		
</body>
</html>