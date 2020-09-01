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
<title>UpdateBoard</title>

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
$(document).ready(function(){
	var b_writer = $("#b_writer").val();
	if('${session_user_id}' != b_writer){
		alert("글쓴이 본인만 게시글을 수정할 수 있습니다.\r\n현재 로그인 정보를 확인해주십시오.");
		history.back();
	}
});
	function update() {
		if( $("#b_title").val() == '' || $("#b_title").val().trim() == '' ){
			alert("제목을 입력해야 합니다.");
			$("#b_title").focus();
			return false;
		}
		
		if( $("#b_content").val() == '' || $("#b_content").val().trim() == '' ){
			alert("내용은 공백일 수 없습니다.");
			$("#b_content").focus();
			return false;
		}
		
		return true;
	}

</script>
</head>
<body class="container">
	<h1 class="text-center">게시글 등록</h1>
	
	<hr>
	<div class="panel panel-default">
		<div class="panel-body mt-5">
			<form class="form-horizontal" method="post" action="<c:url value='/updateBoard.do' />" id="updateForm">
			<input type="hidden" name="b_no" value="${boardVO.b_no }">
			
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="b_title">게시글 제목 : </label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="b_title" name="b_title" placeholder="제목을 입력해주세요." value="${boardVO.b_title }" maxlength="100">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="b_writer">작성자 : </label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="b_writer" name="b_writer" value="${boardVO.b_writer }" placeholder="작성자명을 입력해주세요." maxlength="20" readonly>
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="form-group">
				  <label for="b_content">게시글 내용</label>
				  <textarea class="form-control" rows="20" id="b_content" name="b_content" maxlength="1000">${boardVO.b_content }</textarea>
				</div>
			  </div>
			<div class="panel-footer float-right">
				<button type="submit" class="btn btn-primary" onclick="return update()">수정</button>
				<button type="button" class="btn btn-primary" onclick="history.back()">취소</button>
			</div>
			</form>
		</div>
	</div>
		
</body>
</html>