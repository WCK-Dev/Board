<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"	   uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<title>게시판 관리</title>

<script type="text/javascript">

	function newBoardKinds(){
		var newwin = window.open("<c:url value='/newBoardKinds.do' />", "popUpBoard", "width=500, height=900, left=500, top=50, scrollbars=1");
		newwin.focus();
	}
	
	function managementBoardKinds(bk_bseq){
		var newwin = window.open("<c:url value='/managementBoardKinds.do?bk_bseq=" + bk_bseq + "' />", "popUpBoard", "width=500, height=900, left=500, top=50, scrollbars=1");
		newwin.focus();
	}
		
</script>

</head>
<body>
	<div class="container wrapper">
		<p class="h2 mb-4 text-center"><a href="adminMain.do">Admin Main</a></p>
	    <p class="h4 mb-4 font-weight-bold text-center">게시판 관리</p>
		
		<table class="table border border-dark text-center">
			<thead>
				<tr>
					<th class="w-auto h6 font-weight-bold">게시판 이름</th>
					<th class="w-5 h6 font-weight-bold">게시판 타입</th>
					<th class="w-5 h6 font-weight-bold">노출순서</th>
					<th class="w-5 h6 font-weight-bold">답글 허용</th>
					<th class="w-5 h6 font-weight-bold">댓글 허용</th>
					<th class="w-5 h6 font-weight-bold">비밀글 허용</th>
					<th class="w-20 h6 font-weight-bold">수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardKindsList }" var="boardKinds">
					<tr>
						<td class="h6">${boardKinds.bkBname}</td>
						<td class="h6">
							<c:if test="${boardKinds.bkType == 0}">일반형</c:if>
							<c:if test="${boardKinds.bkType == 1}">알림형</c:if>
						</td>
						<td class="h6">${boardKinds.bkOrder }</td>
						<td class="h6">
							<c:if test="${boardKinds.bkBreplyYn == 'Y'}">허용</c:if>
							<c:if test="${boardKinds.bkBreplyYn == 'N'}">비허용</c:if>
						</td>
						<td class="h6">
							<c:if test="${boardKinds.bkBcommentYn == 'Y'}">허용</c:if>
							<c:if test="${boardKinds.bkBcommentYn == 'N'}">비허용</c:if>
						</td>
						<td class="h6">
							<c:if test="${boardKinds.bkBsecretYn == 'Y'}">허용</c:if>
							<c:if test="${boardKinds.bkBsecretYn == 'N'}">비허용</c:if>
						</td>
						<td><button type="button" class="btn btn-primary" onclick="managementBoardKinds(${boardKinds.bkBseq})">변경</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="panel-footer float-right">
			<button type="button" class="btn btn-primary" onclick="newBoardKinds()">게시판 추가</button>
		</div>
	</div>
</body>
</html>