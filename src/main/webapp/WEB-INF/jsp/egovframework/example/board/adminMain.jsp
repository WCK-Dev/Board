<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	* { box-shadow: 0 0!important;}
	.container { width: 100%; margin: 250px auto;}
</style>
<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
function writeBoard(){
	var newwin = window.open("<c:url value='/writeBoard.do' />", "popUpBoard", "width=500, height=900, left=500, top=50, scrollbars=1");
	newwin.focus();
}
</script>

<title>관리자 메인</title>
</head>
<body>
	<div class="container row wrapper text-center">
    
		<div class="col-lg-6 p-3 display-inlineblock rounded mb-3">
			<div class="border border-light">
				<p class="h4 m-0 py-3 bg-primary text-white"><i class="fas fa-bullhorn mr-3"></i>공지</p>
				<div class="row-sm">
					<button type="button" class="h4 btn border-bottom border-linght waves-effect mx-0 my-0 w-100"
						onclick="writeBoard()">
					공지글 작성</button>
				</div>
			</div>
		</div>
		
		<div class="col-lg-6 p-3 display-inlineblock rounded mb-3">
			<div class="border border-light">
				<p class="h4 m-0 py-3 bg-primary text-white"><i class="fas fa-user prefix mr-3"></i>회원관리 & 게시판관리</p>
				<div class="row-sm">
					<button type="button" class="h4 btn border-bottom border-linght waves-effect mx-0 my-0 w-100"
						onclick="location='managementUser.do'">
					회원 관리</button>
				</div>
				<div class="row-sm">
					<button type="button" class="btn waves-effect mx-0 my-0 w-100"
						onclick="location='managementBoard.do'">
	  				게시판 관리</button>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>