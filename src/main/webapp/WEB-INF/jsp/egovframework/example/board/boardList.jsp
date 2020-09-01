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
<title>Board Main</title>
<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- bpopup -->
<script type="text/javascript"src="${pageContext.request.contextPath }/js/jquery.bpopup.min.js"></script>
<!-- cookie -->
<script type="text/javascript"src="${pageContext.request.contextPath }/js/cookie.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">
<style>
	.Pstyle {
	   opacity : 0;
	   display : none;
	   position : relative;
	   width : 800px;
	   border : 5px solid #fff;
	   padding : 20px;
	   background-color : #fff;
	}
	.b-close {
	   position : absolute;
	   right : 10px;
	   top : 10px;
	   padding : 0px; /* padding : 5px; */
	   display : inline-block;
	   cursor : pointer;
	}
</style>
<script>
$(document).ready(function(){
	/* 로그인 실패 시 에러메시지 출력 */
	if('${loginErrorMsg}' != ''){
		alert('${loginErrorMsg}');
	}
	
	/* 회원가입 정상수행 시 */
	if('${joinSuccessMsg}' != ''){
		alert('${joinSuccessMsg}');
	}
	
	/* 회원가입 오류발생시 */
	if('${joinErrorMsg}' != ''){
		alert('${joinErrorMsg}');
	}
	
	/* 공지사항 제목을 누를시 슬라이드 */
	$('.toggleButton').each(function(index, item) {
		$(item).click(function() {
			$('.toggleContent' + index).slideToggle();
		});
	});
	
	/* 오늘하루 보지않기 */
	$('.today').click(function() {

	  var cookieName = $(this).attr('data-code');
	  setCookie( "todayCookie", "done" , 1);
  		$("#popup_notice").bPopup().close();
	});
	
	/* 오늘 보지않기 여부체크를 위한 Cookie체크 */
	getCookie();
	
});

function setCookie ( name, value, expiredays ) {
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + expiredays );
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function getCookie() {
    var cookiedata = document.cookie;
    /* 쿠키여부 체크시, 쿠키가 등록되어있지않으면 팝업창을 오픈 */
    if ( cookiedata.indexOf("todayCookie=done") < 0 ){
    	$("#popup_notice").bPopup();
   	 	$("#popup_notice").bPopup().reposition(30);
    }
}

function adminMain(){
	location.href = "<c:url value='/adminMain.do' />"
}

function writeBoard(){
	var newwin = window.open("<c:url value='/writeBoard.do' />", "popUpBoard", "width=500, height=900, left=500, top=50, scrollbars=1");
	newwin.focus();
}

function readBoard(b_no){
	var newwin = window.open("<c:url value='/readBoard.do' />?b_no="+b_no , "popUpBoard", "width=500, height=900, left=500, top=50, scrollbars=1");
	newwin.focus();
}

function updateNotice(b_no) {
	var newwin = window.open("<c:url value='/updateBoard.do'/>?b_no=" + b_no , "popUpBoard", "width=500, height=900, left=500, top=50, scrollbars=1");
	newwin.focus();
}

function loginCheck(){
	if($('#user_id').val() == '' || $('#user_id').val().trim() == ''){
		alert("아이디를 입력해주세요.");
		return false;
	}
	if($('#user_pwd').val() == '' || $('#user_pwd').val().trim() == ''){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	
	return true;
}

function logout(){
	location.href = "<c:url value='/logout.do' />"
}

/* pagination 페이지 링크 function */
function fn_link_page(pageNo){
	document.boardListForm.pageIndex.value = pageNo;
	document.boardListForm.action = "<c:url value='/boardList.do'/>";
   	document.boardListForm.submit();
}

/* 팝업 레이어 오픈 */
 function view_notice(){
	 $("#today").prop('checked', false);
	 $("#popup_notice").bPopup();
	 $("#popup_notice").bPopup().reposition(30); 
}
</script>
</head>
<body class="container">
	<a href="boardList.do"><h1>eGov Board 메인</h1></a>
	<hr>
	<div class="panel panel-default">
		<!-- 로그인관련 화면 (head) -->
		<div class="panel-heading">
			<c:if test="${sessionScope.user.user_id == null || sessionScope.user.user_id == '' }">
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
			
			<c:if test= "${sessionScope.user.user_id != null && sessionScope.user.user_id != '' }">
				${sessionScope.user.user_name }(${sessionScope.user.user_id })님 환영합니다.
				<button type="button" class="btn btn-primary" onclick="logout();">로그아웃</button>
			</c:if>
		</div>
		
		<!-- 팝업 레이어 영역 -->
		 <div id="popup_notice" class="Pstyle">
		     <span class="b-close">X</span>
			<div class="content2" style="height:auto; width:100%;"> 
				<div>
					<h3>공지사항</h3>
					<table class="table table-hover mb-3" width="">
						<!--Table head-->
						<thead>
							<tr>
								<th class="text-left h6">Title</th>
								<th width="20%" class="h6 text-center">Writer</th>
								<th width="20%" class="h6 text-center">RegDate</th>
							</tr>
						</thead>
						<!--Table body-->
						<tbody>
			    			<c:forEach var="notice" items="${noticeList }" varStatus="i">
								<tr>
									<td width="60%" class="h6 toggleButton" style="cursor: pointer;"><p>${notice.bTitle }</p></td>
									<td width="20%" class="h6 text-center">${notice.bWriter }</td>
									<td width="20%" class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" timeZone="UTC" value="${notice.bRegdate }"/></td>
								</tr>
								<tr class="toggleContent${i.index }" style="display: none;">
									<td class="toggleContent${i.index }" colspan="6" style="display: none;">
										<div class="toggleContent${i.index }" style="display: none;"><p><c:out value="${fn:replace(notice.bContent, crcn, br)}" escapeXml="false"/></p>
											<c:if test= "${sessionScope.user.user_id != null && sessionScope.user.user_id == 'admin' }"><br>
												<button type="button" class="btn btn-primary mt-5 float-right" onclick="updateNotice(${notice.bNo})">공지글 수정하기</button>
											</c:if>
										</div>
									</td>
			          			</tr>
							</c:forEach>
						</tbody>
						<!--Table body-->
					</table>
				</div>
				<input type="checkbox" class="today" id= "today" data-code="today1"> <label for="today"> 오늘 하루동안 동안 이창 열지 않기</label>
								
			</div>
		 </div>
		
		<!-- 검색 영역 -->
		<form class="form-inline ml-auto" commandName="board" id="boardListForm" name="boardListForm" action="boardList.do" method="post">
		<div>
			<nav class="navbar">
				<!-- Navbar brand -->
				<div>
					페이징 갯수
					<select id="pageUnit" name="pageUnit" class="browser-default custom-select mr-2 mb-2" onchange="document.boardListForm.submit();">
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
			        <th class="text-center" width="10%"><b>작성자</b></th>
			        <th class="text-center" width="20%"><b>작성일</b></th>
			        <th class="text-center" width="10%"><b>조회수</b></th>
			      </tr>
			    </thead>
			    <tbody>
			    <c:forEach var="board" items="${boardList }">
			      <tr>
			        <td><a href="javascript:readBoard(${board.bNo });">
				        	<c:forEach begin="2" end="${board.bDepth }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
				        	<c:if test="${board.bDepth > 1 }">RE: </c:if><c:out value="${board.bTitle }" />
				        </a>
			        </td>
			        <td class="text-center"><c:out value="${board.bWriter }" /></td>
			        <td class="text-center"><fmt:formatDate pattern='yyyy-MM-dd' timeZone="UTC" value='${board.bRegdate }'/></td>
			        <td class="text-center"><c:out value="${board.bReadcnt }" /></td>
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
			<button type="button" class="btn btn-danger"onclick="view_notice()">공지사항</button>
			<c:if test= "${sessionScope.user.user_id != null && sessionScope.user.user_id != '' && sessionScope.user.user_id != 'admin' }">
				<button type="button" class="btn btn-primary" onclick="writeBoard()">게시글 작성</button>
			</c:if>
			<c:if test= "${sessionScope.user.user_id != null && sessionScope.user.admin_YN == 'Y' }">
				<button type="button" class="btn btn-primary" onclick="writeBoard()">공지글 작성</button>
				<button type="button" class="btn btn-primary" onclick="adminMain()">게시판 관리</button>
			</c:if>
		</div>
	</div>
</body>
</html>