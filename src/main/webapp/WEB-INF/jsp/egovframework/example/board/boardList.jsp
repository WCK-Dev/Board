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
<title>Board Main</title>

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
$(document).ready(function() {
	<c:if test="${!empty loginErrorMsg}">
		alert("${loginErrorMsg}");
	</c:if>
});

function writeBoard() {
	location.href = "<c:url value='/writeBoard.do' />";
}

function readBoard() {
	location.href = "<c:url value='/readBoard.do' />"
}

function userJoin() {
	
}

function loginCheck() {
	if($('#user_id').val() == '') {
		alert("아이디를 입력해주세요.");
		return false;
	}
	if($('#user_pwd').val() == '') {
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	
	return true;
}

function logout() {
	location.href = "<c:url value='/logout.do' />"
}


</script>
</head>
<body class="container">
	<h1 class="text-center">eGov Board 메인</h1>
	
	<hr>
	<div class="panel panel-default">
		<!-- 로그인관련 화면 (head) -->
		<div class="panel-heading">
		<c:if test="${sessionScope.user_id == null || sessionScope.user_id == '' }">
			<form class="form-inline" method="post" action="<c:url value='/login.do' />">
			  <div class="form-group">
			    <label for="user_id">User ID : </label>
			    <input type="text" class="form-control" id="user_id" name="user_id">
			  </div>
			  <div class="form-group pl-2">
			    <label class="pr-3" for="user_pwd">Password : </label>
			    <input type="password" class="form-control" id="user_pwd" name="user_pwd">
			  </div>
			  <button type="submit" class="btn btn-primary ml-3" onclick="return loginCheck();">로그인</button>
			  <button type="button" class="btn btn-primary ml-1" onclick="userJoin();">회원가입</button>
			</form>
		</c:if>
		
		<c:if test= "${sessionScope.user_id != null && sessionScope.user_id != '' }">
			${sessionScope.user_name }(${sessionScope.user_id })님 환영합니다.
			<button type="button" class="btn btn-primary" onclick="logout();">로그아웃</button>
		</c:if>
		</div>
		<!-- 로그인 관련 영역 끝 -->
		
		
		<hr>
		<!-- 테이블(게시글) 영역  -->
		<div class="panel-body mt-5">
			<!-- 검색 영역 -->
			<form class="form-inline float-right" action="boardSearch.do">
			  <select name="searchCondition" class="browser-default custom-select mr-2 mb-2">
				  <option value="0">작성자</option>
				  <option value="1">제목</option>
				  <option value="2">내용</option>
				  <option value="3">전체</option>
				</select>
			  <div class="form-group">
			    <input type="text" class="form-control" id="searchKeyword" name="searchKeyWord">
			  </div>
			  <button type="submit" class="btn btn-primary">검색</button>
			</form>
			<!-- 검색영역 끝 -->
		
			<div class="table-responsive table-hover">
			  <table class="table">
			  	<thead>
			      <tr>
			        <th width="*">글 제목</th>
			        <th width="10%">작성자</th>
			        <th width="20%">작성일</th>
			        <th width="10%">조회수</th>
			      </tr>
			    </thead>
			    <tbody>
			    <c:forEach var="board" items="${resultList }">
			      <tr>
			        <td><a href="javascript:readBoard();"><c:out value="${board.bTitle }" /></a></td>
			        <td><c:out value="${board.bWriter }" /></td>
			        <td><c:out value="${board.bRegdate }" /></td>
			        <td><c:out value="${board.bReadcnt }" /></td>
			      </tr>
			    </c:forEach>
			    </tbody>
			  </table>
			</div>
		</div>
		<div class="panel-footer float-right">
			<c:if test= "${sessionScope.user_id != null && sessionScope.user_id != '' && sessionScope.user_id != 'admin' }">
				<button type="button" class="btn btn-primary" onclick="writeBoard()">게시글 작성</button>
			</c:if>
			<c:if test= "${sessionScope.user_id != null && sessionScope.user_id == 'admin' }">
				<button type="button" class="btn btn-primary" onclick="writeBoard()">공지글 작성</button>
			</c:if>
		</div>
	</div>
</body>
</html>