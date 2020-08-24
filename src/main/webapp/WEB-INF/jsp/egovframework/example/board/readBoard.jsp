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
function boardList() {
	location.href = "<c:url value='/boardList.do'/>";
}

function reply(b_no) {
	location.href = "<c:url value='/replyWrite.do'/>?b_no=" + b_no;
	
}
</script>
</head>
<body class="container">
	<h1 class="text-center">게시글 상세</h1>
	
	<hr>
	<div class="panel panel-default">
		<div class="panel-body mt-5">
			<form class="form-horizontal" method="post">
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
				<fmt:formatDate pattern='yyyy-MM-dd HH:mm' value="${boardVO.b_regdate }"/>
			  </div>
			  <div class="form-group">
				  <label class= "font-weight-bold ml-3 mb-5 h5" for="b_content">게시글 내용</label>
				<div class="col-sm-10">
				<c:out value="${fn:replace(boardVO.b_content, crcn, br)}" escapeXml="false"/> 
			    </div>
			 </div>
			</form>
		</div>
		<div class="panel-footer float-right">
			<c:if test="${sessionScope.user_id != '' && sessionScope.user_id == boardVO.b_writer }">
				<button type="button" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-primary">삭제</button>
			</c:if>
			<c:if test="${sessionScope.user.id != '' }">
				<button type="button" class="btn btn-primary" onclick="reply(${boardVO.b_no})">답글 작성</button>
			</c:if>
			<button type="button" class="btn btn-primary" onclick="boardList()">닫기</button>
		</div>
	</div>
		
</body>
</html>