<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"	   uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 	   uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eGov 게시판 메인</title>
<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
function logout(){
	location.href = "<c:url value='/logout.do' />"
}

function adminMain(){
	location.href = "<c:url value='/adminMain.do' />"
}
</script>

</head>
<body class="container">
	<a href="boardMain.do"><h1>eGov Board 메인</h1></a>
	<div class="panel-heading text-right">
		${sessionScope.user.user_name }(${sessionScope.user.user_id })님 환영합니다.
		<button type="button" class="btn btn-danger" onclick="logout();">로그아웃</button>
		<c:if test= "${sessionScope.user.user_id != null && sessionScope.user.user_id != '' && sessionScope.user.admin_YN == 'Y' }">
			<button type="button" class="btn btn-primary" onclick="adminMain()">관리자 페이지</button>
		</c:if>
	</div>
	
	<div class="mt-3 mb-2">
		<c:forEach items="${boardKindsList }" var="boardKinds">
			<a href='boardList.do?b_bseq=${boardKinds.bkBseq }'><b>${boardKinds.bkBname }</b> &nbsp;&nbsp;&nbsp;</a>
		</c:forEach>
	</div>
	<hr>
	
	
	<div class="panel panel-default mt-5 pt-5">
		<h4>어서요세요! eGov 메인화면입니다.</h4>
		<br>
		<h4>상단의 게시판 탭을 통해 원하시는 게시판으로 이동할 수 있습니다.</h4>
	</div>
</body>
</html>