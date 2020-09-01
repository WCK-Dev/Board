<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"	   uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 	   uri="http://java.sun.com/jsp/jstl/functions" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<title>Insert title here</title>

<script type="text/javascript">
	function updateUser(user_id){
		var newwin = window.open("<c:url value='/updateUser.do?user_id=" + user_id + "' />", "popUpBoard", "width=500, height=900, left=500, top=50, scrollbars=1");
		newwin.focus();
	}
</script>

</head>
<body>
	<div class="container wrapper">
		<p class="h2 mb-4 text-center"><a href="adminMain.do">Admin Main</a></p>
	    <p class="h4 mb-4 font-weight-bold text-center">유저 조회</p>
		
		<table class="table border border-dark text-center">
			<thead>
				<tr>
					<th class="w-auto"><i class="fas fa-check ml-1"  aria-hidden="true"></i></th>
					<th class="w-50 h4 font-weight-bold">아이디</th>
					<th class="w-25 h4 font-weight-bold">이름</th>
					<th class="w-25 h4 font-weight-bold">유저 권한</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userList }" var="user">
					<tr>
						<td class="h5"></td>
						<td class="h5">${user.userId}</td>
						<td class="h5">${user.userName }</td>
						<td class="h5"><button type="button" class="btn btn-primary" onclick="updateUser('${user.userId}')">권한 수정</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>