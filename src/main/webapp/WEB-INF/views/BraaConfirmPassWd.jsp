<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
// https로 가기 
	var num = "${bordNum}";
		
	$(document).ready(function(){
		var guideMsg = "게시글 " +num+"번의 비밀번호를 입력하세요.";
		$("#guideMsg span").append(guideMsg);
		
		$("#confirmPw").click(function(){
			//비밀번호 암호화 추가해야함
			var data = {pw : $("#pw").val(), bordNum : num };
			ajaxComm("/braa/Braa1000_confirmPasswd.do", JSON.stringify(data), callback, "POST");
			// 그냥json으로 보냇을때 문제가 생겻음 ->json을 스트링으로 보내니 문제사라짐
		})
		
		$("#confirmClose").click(function(){
			window.close();
		})
	})
		
	function callback(result){
		if(result){
			window.opener.checkAfterAction(num);
			//window.opener.pageMove(num);
			window.close();
		}else{
			//alert("비밀번호가 맞지않습니다. 다시 확인해주세요.");
			$("#confirmMsg span").empty();
			
			var append = "비밀번호가 맞지않습니다. <p/>다시 입력해주세요."
			$("#confirmMsg span").append(append);
			//$("#pw").val("");
		}
	}
	
	//공통 js만들면 제거 
	function ajaxComm(url, data, callback, action){
		$.ajax({
			url:url,
			type:action,
			data:data,
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success:callback,
			error:function(xhr, status, error){
				console.log(xhr+"\n"+status+"\n"+error);
			}
		});
	}
</script>
	<form style="height:230px;">
		<div id="guideMsg">
			<span></span> 
		</div>
		<div>
			<input class="form-control-small"  type="password" id="pw">
		</div>
		<div>
			<button type="button" id ="confirmPw">확인</button>
			<button type="button" id ="confirmClose">닫기</button>
		</div>
		<div id="confirmMsg">
		 <span></span>
		</div>
	</form>
</body>
</html>