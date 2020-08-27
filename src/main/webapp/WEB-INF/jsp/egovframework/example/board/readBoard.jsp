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
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
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

function del(b_no, b_grpno) {		
	
	if(confirm("해당글을 삭제하시겠습니까?\r\n원본 게시글인 경우, 답글까지 모두 삭제됩니다.")){
		
		$.ajax({
			type : 'POST',
			url : "<c:url value='/deleteBoard.do' />",
			data : { "b_no" : b_no,
					 "b_grpno": b_grpno},
			
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
</script>
</head>
<body class="container">
	
	<div class="panel panel-default">
		<div class="panel-body mt-5">
			<div class="form-group">
			   <label class="control-label col-sm-2 font-weight-bold h5">게시글 제목 : </label>
				<c:out value="${boardVO.b_title }"/> 
			 </div>
			 <div class="form-group">
			   <label class="control-label col-sm-2 font-weight-bold h5">작성자 : </label>
				<c:out value="${boardVO.b_writer }"/> 
			 </div>
			 <div class="form-group">
			   <label class="control-label col-sm-2 font-weight-bold h5">작성일 : </label>
				<fmt:formatDate pattern='yyyy-MM-dd HH:mm' timeZone="UTC" value="${boardVO.b_regdate }"/>
			 </div>
			 <div class="form-group">
			   <label class="control-label col-sm-2 font-weight-bold h5">조회수 : </label>
				<c:out value="${boardVO.b_readcnt }"/> 
			 </div>
			 <div class="form-group">
				  <label class= "font-weight-bold ml-3 mb-5 h5" for="b_content">게시글 내용</label>
				<div class="col-sm-10" style="min-height: 300px">
				<c:out value="${fn:replace(boardVO.b_content, crcn, br)}" escapeXml="false"/> 
			   </div>
			</div>
		</div>
		<div class="panel-footer float-right">
			<c:if test="${sessionScope.user_id != '' && sessionScope.user_id == boardVO.b_writer }">
				<button type="button" class="btn btn-primary" onclick="update(${boardVO.b_no})">수정</button>
				<button type="button" class="btn btn-primary" onclick="del(${boardVO.b_no}, ${boardVO.b_grpno})">삭제</button>
			</c:if>
			<c:if test="${sessionScope.user_id != '' && sessionScope.user_id != null && boardVO.b_category != 1}">
				<button type="button" class="btn btn-primary" onclick="reply(${boardVO.b_no})">답글 작성</button>
			</c:if>
			<button type="button" class="btn btn-primary" onclick="window.close()">닫기</button>
		</div>
	</div>
		
</body>
</html>