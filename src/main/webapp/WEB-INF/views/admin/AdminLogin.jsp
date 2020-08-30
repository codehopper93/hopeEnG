<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>
</head>

<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
	
function submitVal(val){
	
	var adminId = $("#adminId").val();
	var adminPw = $("#adminPw").val();
	
	if(adminId == ""){
		alert("아이디를 입력하세요");
		$("#adminId").focus();
		return;
	}
	
	if(adminPw == ""){
		alert("비밀번호를 입력하세요");
		$("#adminPw").focus();
		return;
	}
	
	var action = "/admin/loginCheck.do";
	$("#loginForm").attr("action", action).submit();
	
}
</script>

<div class="inner">
	<div id="loginBox" style="position: relative;width: 50%;min-width: 350px;height: 400px;margin-left: 25%;top: 50px;box-shadow: 0 2px 4px 0 rgba(0,0,0,.2);background-color: #fafafa;">
		<div style="margin-left:30%;margin-bottom:40px;">
			<h2>관리자 로그인</h2>
		</div>
		<div style="position:relative; width: 50%; height: 50%;margin-left:25%;">
			<form id="loginForm" name="loginForm" method="post" style="box-shadow:none;">
				
				
				<div style="width: 100%; float: left;">
					<p style="margin-bottom:5px;">아이디</p>
					<input type="text" id="adminId" name="adminId" placeholder="아이디입력" style="width: 100%;margin-bottom:15px;" class="form-control">
				</div>
				<div style="width: 100%; float: left;">
					<p style="margin-bottom:5px;">비밀번호</p>
					<input type="password" id="adminPw" name="adminPw" placeholder="비밀번호입력" style="width:100%;margin-bottom:15px;" class="form-control">
				</div>
				<div style="width: 100%; float: left;" >
					<button type="button" id="login" onclick="submitVal('login')">로그인</button>
				</div>
				
			</form>
		</div>
	</div>
</div>

</body>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</html>