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
<title>Board Main</title>

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
$(document).ready(function(){
	<c:if test="${!empty loginErrorMsg}">
		alert("${loginErrorMsg}");
	</c:if>
});

function writeBoard(){
	location.href = "<c:url value='/writeBoard.do' />";
}

function readBoard(b_no){
	location.href = "<c:url value='/readBoard.do' />?b_no=" + b_no;
}

function signUp(){
	location.href = "<c:url value='/signUp.do' />";
	
}

function loginCheck(){
	if($('#user_id').val() == ''){
		alert("아이디를 입력해주세요.");
		return false;
	}
	if($('#user_pwd').val() == ''){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	
	return true;
}

function logout(){
	location.href = "<c:url value='/logout.do' />"
}

function changePageUnit(){
	document.boardListForm.submit();
}

/* pagination 페이지 링크 function */
function fn_link_page(pageNo){
	document.boardListForm.pageIndex.value = pageNo;
	document.boardListForm.action = "<c:url value='/boardList.do'/>";
   	document.boardListForm.submit();
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
				    <input type="text" class="form-control" id="user_id" name="user_id" maxlength="20">
				  </div>
				  <div class="form-group pl-2">
				    <label class="pr-3" for="user_pwd">Password : </label>
				    <input type="password" class="form-control" id="user_pwd" name="user_pwd" maxlength="20">
				  </div>
				  <button type="submit" class="btn btn-primary ml-3" onclick="return loginCheck();">로그인</button>
				  <button type="button" class="btn btn-primary ml-1" onclick="signUp();">회원가입</button>
				</form>
			</c:if>
			
			<c:if test= "${sessionScope.user_id != null && sessionScope.user_id != '' }">
				${sessionScope.user_name }(${sessionScope.user_id })님 환영합니다.
				<button type="button" class="btn btn-primary" onclick="logout();">로그아웃</button>
			</c:if>
		</div>
		
		<!-- 검색 영역 -->
		<form class="form-inline ml-auto" commandName="board" id="boardListForm" name="boardListForm" action="boardList.do" method="post">
		<div>
			<nav class="navbar">
				<!-- Navbar brand -->
				<div>
					페이징 갯수
					<select id="pageUnit" name="pageUnit" class="browser-default custom-select mr-2 mb-2" onchange="changePageUnit()">
						<option value="10" <c:if test="${board.pageUnit == '10' || board.pageUnit=='' }">selected</c:if>>10개</option>
						<option value="30" <c:if test="${board.pageUnit == '30'}">selected</c:if>>30개</option>
					  	<option value="50" <c:if test="${board.pageUnit == '50'}">selected</c:if>>50개</option>
					</select>
				</div>
				
					<select name="searchCondition" class="browser-default custom-select mr-2 mb-2">
					  <option value="0" <c:if test="${board.searchCondition=='0' || board.searchCondition=='' }">selected</c:if>>작성자</option>
					  <option value="1" <c:if test="${board.searchCondition=='1'}">selected</c:if>>제목</option>
					  <option value="2" <c:if test="${board.searchCondition=='2'}">selected</c:if>>내용</option>
					  <option value="3" <c:if test="${board.searchCondition=='3'}">selected</c:if>>전체</option>
					</select>
					<div class="form-group">
					  	<input type="text" class="form-control" name="searchKeyword" value="${board.searchKeyword}">
					 </div>
					 <button type="submit" class="btn btn-primary">검색</button>
			</nav>
		</div>
		
		<!-- 테이블(게시글) 영역  -->
			<div class="table-responsive table-hover">
			  <table class="table">
			  	<thead class="thead-dark">
			      <tr>

			        <th width="*"><b>글 제목</b></th>
			        <th width="10%"><b>작성자</b></th>
			        <th width="20%"><b>작성일</b></th>
			        <th width="10%"><b>조회수</b></th>
			      </tr>
			    </thead>
			    <tbody>
			    <c:forEach var="board" items="${resultList }">
			      <tr>
			        <td><a href="javascript:readBoard(${board.bNo });"><c:out value="${board.bTitle }" /></a></td>
			        <td><c:out value="${board.bWriter }" /></td>
			        <td><fmt:formatDate pattern='yyyy-MM-dd' value='${board.bRegdate }'/></td>
			        <td><c:out value="${board.bReadcnt }" /></td>
			      </tr>
			    </c:forEach>
			    </tbody>
			  </table>
			</div>
		<ul class="pagination" style="width: 100%; text-align:center;">
       		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_link_page" />
       	</ul>
      		<input type="hidden" id="pageIndex" name="pageIndex" value="1">
      	</form>
      	
		
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