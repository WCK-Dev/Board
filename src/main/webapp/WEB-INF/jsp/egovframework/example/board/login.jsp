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
<title>Insert title here</title>

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
$(document).ready(function(){
	window.resizeTo(480, 420)
	
	<c:if test="${!empty loginErrorMsg}">
		alert("${loginErrorMsg}");
	</c:if>
	<c:if test="${!empty loginSuccess}">
		self.close(); 
	</c:if>
});

</script>
</head>
<body>
<div class="container wrapper">
	<form class="text-center border border-light p-5" action="<c:url value='/login.do' />" method="post">
		<p class="h4 mb-4">로그인</p>
		<input type="hidden" name="isPopUp" value="true">
		
	    <input type="text" name="user_id" class="form-control mb-4" placeholder="아이디를 입력해주세요">
	
	    <input type="password" name="user_pwd" class="form-control mb-4" placeholder="비밀번호를 입력해주세요">
		
		<p class="text-danger" style="font-size: 13px">${alert }</p>
		
	    <button class="btn btn-primary btn-block my-4" type="submit">로그인</button>
	</form>
</div>
</body>
</html>