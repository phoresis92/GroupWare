<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/jquery-2.2.3.min.js"></script>
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
<div class="container-fluid text-center">

	<div class="row content">
		
			<div class="col-sm text-left" style="border: 1px solid lightgray; margin: 20px;">
			
				<form action="${pageContext.request.contextPath}/board"	method="post" name="board">
					
					<div class="container">
					<br>
					
						<div class="row">
						
						<div class="col-sm-4" style="border-bottom: 1px solid lightgray"><h4><strong>${boardInfo.brdtitle}</strong></h4></div>
						<div class="col-sm-4"></div>
					</div>
					<div class="row">
						<div class="col-sm-9"><strong>작성자</strong> ${boardInfo.brdwriter}</div>			
						<div class="col-sm-3"></div>
					</div>
					
					<div><strong>작성일</strong> ${ brddate }</div>
					<div><strong>조회수</strong> ${ brdhit }</div>
					<br>
					<div class="row">
						<div class="col-sm-12">${boardInfo.brdmemo}</div>
					</div>
					<br>
					<div><strong>첨부파일</strong><c:forEach var="listview" items="${listview}" varStatus="status">	
            				<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> 							 
							<c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
						</c:forEach></div>	
				</div>
								
					<br>
					<br>
					<div class="container">
				<a class="btn btn-primary" href="boardList?bgno=<c:out value="${boardInfo.bgno}"/>">돌아가기</a>
		<a class="btn btn-primary" href="boardDelete?bgno=<c:out value="${boardInfo.bgno}"/>&brdno=<c:out value="${boardInfo.brdno}"/>">삭제</a>
		<a class="btn btn-primary" href="boardForm?brdno=<c:out value="${boardInfo.brdno}"/>">수정</a>
				</div>
				
			</form>
		</div>
	</div>
	</div>	
	
		<div class="form-group" style="border: 1px solid; width: 600px; padding: 5px">
			<form id="form1" name="form1">
				<input type="hidden" id="brdno1" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
				<label for="title">작성자:</label> <input type="text" id="rewriter1" name="rewriter" class="form-control" size="20" maxlength="20" value="<c:out value="${sessionScope.member.member_name}"/>" readonly> <br/>
				<textarea id="rememo1" name="rememo" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
				<a class="btn btn-primary" href="#" onclick="fn_formSubmit()">저장</a>
			</form>
		</div>
		
		<div id="replyList"> 
			<c:forEach var="replylist" items="${replylist}" varStatus="status">
				<div id="replyItem<c:out value="${replylist.reno}"/>"
							style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*replylist.redepth}"/>px; display: inline-block">	
					<c:out value="${replylist.rewriter}"/> <c:out value="${replylist.redate}"/>
					<a href="#" onclick="fn_replyDelete('<c:out value="${replylist.reno}"/>')">삭제</a>
					<a href="#" onclick="fn_replyUpdate('<c:out value="${replylist.reno}"/>')">수정</a>
					<a href="#" onclick="fn_replyReply('<c:out value="${replylist.reno}"/>')">댓글</a>
					<br/>
					<div id="reply<c:out value="${replylist.reno}"/>"><c:out value="${replylist.rememo}"/></div>
				</div><br/>
			</c:forEach>
		</div>

		<div id="replyDiv" style="width: 99%; display:none">
			<form id="form2" name="form2" action="boardReplySave" method="post">
				<input type="hidden" id="brdno2" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
				<input type="hidden" id="reno2" name="reno"> 
				<textarea id="rememo2" name="rememo" rows="3" cols="60" maxlength="500"></textarea>
				<a href="#" onclick="fn_replyUpdateSave()">저장</a>
				<a href="#" onclick="fn_replyUpdateCancel()">취소</a>
			</form>
		</div>
		
		<div id="replyDialog" style="width: 99%; display:none">
			<form id="form3" name="form3" action="boardReplySave" method="post">
				<input type="hidden" id="brdno3" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
				<input type="hidden" id="reno3" name="reno"> 
				<input type="hidden" id="reparent3" name="reparent"> 
				작성자: <input type="text" id="rewriter3" name="rewriter" size="20" maxlength="20"> <br/>
				<textarea id="rememo3" name="rememo" rows="3" cols="60" maxlength="500"></textarea>
				<a href="#" onclick="fn_replyReplySave()">저장</a>
				<a href="#" onclick="fn_replyReplyCancel()">취소</a>
			</form>
		</div>				
</body>
</html>