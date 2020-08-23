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
		$(".full-screen").mousemove(function(event) {
			  var eye = $(".eye");
			  var x = (eye.offset().left) + (eye.width() / 2);
			  var y = (eye.offset().top) + (eye.height() / 2);
			  var rad = Math.atan2(event.pageX - x, event.pageY - y);
			  var rot = (rad * (180 / Math.PI) * -1) + 180;
			  eye.css({
			    '-webkit-transform': 'rotate(' + rot + 'deg)',
			    '-moz-transform': 'rotate(' + rot + 'deg)',
			    '-ms-transform': 'rotate(' + rot + 'deg)',
			    'transform': 'rotate(' + rot + 'deg)'
			  });
			});

	})
</script>
<div class="full-screen">
      <div class='container-err'>
        <span class="error-num">5</span>
        <div class='eye'></div>
        <div class='eye'></div>
		
      	  <div class="err-div">
				  <div> <span class="text1-err" >죄송합니다.</span>
				  		<br/>
				  		<span class="text2-err">오류가 발생했습니다.</span>
				  </div>
				  <div class="text3-err">
					  <span>나중에 다시 시도해 주세요.
					  		<br/>
					  		추가로  제공해 드릴 수 있는 정보가 없습니다.
					  </span>
				  </div>
		  </div>
		        <a href="">Go back</a>
      </div>
    </div>


  
  <%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</body>
</html>