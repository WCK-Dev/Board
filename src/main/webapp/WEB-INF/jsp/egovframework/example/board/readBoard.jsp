<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"	   uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 	   uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
     //치환 변수 선언
      pageContext.setAttribute("crcn", "\n"); // Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Read Board</title>

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
$(document).ready(function(){
	window.resizeTo(540, 900);
});

function reply(b_no) {
	location.href = "<c:url value='/writeReply.do'/>?b_no=" + b_no;
	
}

function update(b_no) {
	location.href = "<c:url value='/updateBoard.do'/>?b_no=" + b_no;
}

function del(b_no, b_refno) {		
	
	if(confirm("해당글을 삭제하시겠습니까?\r\n원본 게시글인 경우, 답글까지 모두 삭제됩니다.")){
		
		$.ajax({
			type : 'POST',
			url : "<c:url value='/deleteBoard.do' />",
			data : { "b_no" : b_no,
					 "b_refno": b_refno},
			
			success : function(result) {
				alert("글 삭제가 정상적으로 수행되었습니다.");
				opener.location.reload();
				window.close();
			},
			error : function(error) {
		        alert("글 삭제에 오류가 발생했습니다.");
				opener.location.reload();
				window.close();
		    }
		});
	}
}

function writeComment(b_no) {
	var c_writer = $("#c_writer").val();
	var c_content = $("#c_content").val();
	
	if(!c_content){
		alert("댓글내용을 입력해야합니다.");
	} else {
		$.ajax({
			type : 'POST',
			url : "<c:url value='/insertComment.do'/>",
			dataType : "text",
			data : {"b_no" : b_no,
					"c_writer": c_writer,
					"c_content": c_content
					},
			
			success : function (result) {
				
				if(result == 1){
					alert("댓글을 등록했습니다.");
					location.reload(true);
				} else {
					alert("댓글등록에 오류가 발생했습니다.")
				}
			}
		});
	}
	
}

function deleteComment(c_no, c_writer, user_id) {
	
	if(c_writer != user_id) {
		alert("댓글 삭제는 등록자로 로그인 된 경우에만 가능합니다.");
		location.reload(true);
	}
	
	if(confirm("정말 댓글을 삭제하시겠습니까?")){
		$.ajax({
			type : 'POST',
			url : "<c:url value='/deleteComment.do'/>",
			dataType : "text",
			data : {"c_no" : c_no,
					"c_writer": c_writer
					},
			
			success : function (result) {
				
				if(result == 1){
					alert("댓글을 삭제했습니다.");
					location.reload(true);
				} else {
					alert("댓글삭제에 오류가 발생했습니다.")
				}
			}
		});
	}
}
</script>
</head>
<body class="container">
	<h2>게시글 상세보기</h2>
	<div class="panel panel-default">
		<div class="panel-body mt-5">
			<div class="form-group">
			   <label class="control-label col-sm-2 font-weight-bold h5">제목 : </label>
				<p class="pl-3"><c:out value="${boardVO.b_title }"/></p>
			 </div>
			 <div class="form-group">
			   <label class="control-label pl-3 pr-3 font-weight-bold h5">작성자 : </label>
				<c:out value="${boardVO.b_writer }"/>
			 </div>
			 <div class="form-group">
			   <label class="control-label pl-3 pr-3 font-weight-bold h5">작성일 : </label>
				<fmt:formatDate pattern='yyyy-MM-dd HH:mm' timeZone="UTC" value="${boardVO.b_regdate }"/>
			 </div>
			 <div class="form-group">
			   <label class="control-label pl-3 pr-3 font-weight-bold h5">조회수 : </label>
				<c:out value="${boardVO.b_readcnt }"/>
			 </div>
			 <div class="form-group">
				  <label class= "font-weight-bold ml-3 mb-2 h5" for="b_content">게시글 내용</label>
			 <div class="col-sm-10" style="min-height: 300px">
				<c:out value="${fn:replace(boardVO.b_content, crcn, br)}" escapeXml="false"/>
			 </div>
			</div>
		</div>
		
		<!-- 댓글란 -->
		
		<div class="text-center border border-light" >
		    <div class="text-left mb-3"><b>전체 댓글</b> <span id="commentCnt">0</span>개</div>
			<table class="table">
				<c:forEach var="comment" items="${commentList }" varStatus="i">
					<tr>
						<th width='*' scope='row'><b>${comment.cWriter }</b></th>
						<td width='23%'><fmt:formatDate pattern="yyyy-MM-dd" timeZone="UTC" value="${comment.cRegdate }"/></td>
					</tr>
					<tr>
						<td class='text-left'>${comment.cContent }</td>
						<td>
							<c:if test="${comment.cWriter == sessionScope.user.user_id }">
								<div class="badge badge-primary text-wrap" style="cursor: pointer;" onclick="deleteComment(${comment.cNo}, '${comment.cWriter}', '${sessionScope.user.user_id }')">댓글 삭제</div>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
			<table>
				<tr>
					<td colspan="2" style="text-align: center">
						<b class="h4">댓글 작성</b>
					</td>
				</tr>
			    <tr>
			   		<td width="20%"><input type="text" id="c_writer" class="form-control" value="${sessionScope.user.user_id }" readonly></td>
				   	<td width="80%"><input type="text" id="c_content" class="form-control" placeholder="댓글 내용을 작성하세요" maxlength="100"></td>
			    </tr>
			    <tr>
			    	<td colspan="2" style="text-align: right">
						<button class="btn btn-info" onclick="writeComment(${boardVO.b_no})">댓글 작성</button>
					</td>
			    </tr>
			</table>
		</div>
		
		<div class="panel-footer float-right mt-5">
			<c:if test="${sessionScope.user.user_id != '' && sessionScope.user.user_id == boardVO.b_writer }">
				<button type="button" class="btn btn-primary" onclick="update(${boardVO.b_no})">수정</button>
				<button type="button" class="btn btn-primary" onclick="del(${boardVO.b_no}, ${boardVO.b_refno})">삭제</button>
			</c:if>
			<c:if test="${sessionScope.user.user_id != '' && sessionScope.user.user_id != null && boardVO.b_notice != 1}">
				<button type="button" class="btn btn-primary" onclick="reply(${boardVO.b_no})">답글 작성</button>
			</c:if>
			<button type="button" class="btn btn-primary" onclick="window.close()">닫기</button>
		</div>
	</div>
		
</body>
</html>