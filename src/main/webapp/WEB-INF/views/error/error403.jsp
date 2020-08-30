<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오류 페이지 - (주)희망이앤지</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>
<link href="${pageContext.request.contextPath}/css/error.css" rel="stylesheet" />
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
var temp = "";

	$(document).ready(function(){ //메인에서 클릭해서 들어오면 서버에서 무조건 5개 가지고 옴
		//var braaAppend = "";
		//$("#braaTable").append(braaAppend);
	})
</script>
<div class="main"> 
	<img class="" style="width:100%;" src="/image/img/error/403Error.gif" alt="" />
</div>	
	<div class="err-div">
	  <div>
	  	<span class="text1-err">현재 페이지의 접근 권한이 없습니다.</span>
	  </div>
	  <div class="text3-err">
		  <span>페이지 권한을 가지고 있지 않은 사용자의 접근입니다.
		  		<br/>
		  		관리자 로그인이 필요합니다.
		  </span>
	  </div>
  </div>

  
  <%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</body>
</html>