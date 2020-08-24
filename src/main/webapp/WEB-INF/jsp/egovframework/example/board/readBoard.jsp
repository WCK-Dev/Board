<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Board</title>

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
function boardList() {
	location.href = "<c:url value='/boardList.do'/>"
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
			    <label class="control-label col-sm-2 font-weight-bold">게시글 제목 : </label>
게시글제목 123
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2 font-weight-bold">작성자 : </label>
작성자123
			  </div>
			  <div class="form-group">
				  <label class= "font-weight-bold ml-3" for="b_content">게시글 내용</label>
				<div class="col-sm-10">
작성자123
			    </div>
			 </div>
			</form>
		</div>
		<div class="panel-footer float-right">
			<c:if test="${sessionScope.user_id != '' && sessionScope.user_id == board.bWriter }">
				<button type="button" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-primary">삭제</button>
			</c:if>
			<c:if test="${sessionScope.user.id == '' }">
				<button type="button" class="btn btn-primary" onclick="">답글 작성</button>
			</c:if>
			<button type="button" class="btn btn-primary" onclick="boardList()">닫기</button>
		</div>
	</div>
		
</body>
</html>