<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작성하기</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
var flag = false;
var pwFlag = false;
var updMode = false; //수정모드
var num = "${braa.bordNo}";
var originUserNm = "";
var originUserEmail = "";
var originUserPhone = "";
var originBordNm = "";
var originBordCts = "";

if("${braa}" != ""){ // 상세보기 일 때 
	flag = true;
}

$(document).ready(function(){
	if(flag){ //상세보기
		$("#checkInfo").prop("checked",true);
		$("#bordRelease").val("${braa.bordRelease}");
		$("#bordRelease").attr("disabled",true); //수정기능에서 공개 비공개 수정할 지 아직 결정 X
		$("#pwdDiv").remove();
		$("#write").remove();
		$("#reset").remove();
		$("#infoCheck").remove();
		$("#pwdCheckDiv").remove();
		if($("#userPw").next().length > 0){
			$("#userPw").next().remove();	
		}
		
		originUserNm = $("#userNm").val();
		originUserEmail = $("#userEmail").val();
		originUserPhone = $("#userPhone").val();
		originBordNm = $("#bordNm").val();
		originBordCts = $("#bordCts").val();
		
		if($("#bordRelease").val() == "Y"){ // 공개모드
			$("input, textarea").prop("readonly", true);
			$("#braaDelete").css('display','none');
			//$("#tel").remove(); // 전화번호 제거
		}else{
			updMode = true;
		}
		
	}else{
		$("#bordRelease").val("N");
		$("#braaUpdate").remove();
		$("#braaDelete").remove();
	}

	$("#braaList").click(function(){
		var msg = ""
		if(!compareContxt()){
			msg = "수정사항이 있습니다. "
		}
		if(confirm(msg+"목록으로 돌아가시겠습니까?")){
			window.location.href = "braa.do";
		}else{
			return;
		}
	})
	
	$("#userPwCheck").focusout(function(){
		var val1 = $("#userPw").val();
		var val2 = $("#userPwCheck").val();
		
		$("#pwCheckMsg").empty();
		
		if(val1 != val2){
			pwFlag = true;
			$("#pwCheckMsg").append("비밀번호가 불일치합니다.");
		}else{
			pwFlag = false;
			$("#pwCheckMsg").append("비밀번호가 일치합니다.");
		}
		return;
	})
	
})

function compareContxt(){
	var contxtFlag = true;
	if(originUserNm != $("#userNm").val()){
		contxtFlag = false;
	}
	if(originUserEmail != $("#userEmail").val()){
		contxtFlag = false;
	}
	if(originUserPhone != $("#userPhone").val()){
		contxtFlag = false;
	}
	if(originBordNm != $("#bordNm").val()){
		contxtFlag = false;
	}
	if(originBordCts != $("#bordCts").val()){
		contxtFlag = false;
	}
	return contxtFlag;
}

function insertValidCheck(){
	var alertFlag = true;
	var guideTxt = ""
	var obj = "";
	
	if($("#checkInfo").is(":checked") == false){
		guideTxt = "개인정보 수집 및 이용 동의에 체크해주세요.";
		obj = $("#checkInfo");
	}else if($("#userNm").val() == undefined || $("#userNm").val() == ""){
		guideTxt = "이름을 입력해주세요.";
		obj = $("#userNm");
	}else if($("#userPw").attr("disabled") == undefined
			&& ($("#userPw").val() == undefined || $("#userPw").val() == "")){
			guideTxt = "비밀번호를 입력해주세요.";
			obj = $("#userPw");
	}else if($("#userEmail").val() == undefined || $("#userEmail").val() == ""){
		guideTxt = "이메일을 입력해주세요.";
		obj = $("#userEmail");
	}else if($("#userPhone").val() == undefined || $("#userPhone").val() == ""){
		guideTxt = "연락처를 입력해주세요.";
		obj = $("#userPhone");
	}else if($("#bordNm").val() == undefined || $("#bordNm").val() == ""){
		guideTxt = "제목을 입력해주세요.";
		obj = $("#bordNm");
	}else if($("#bordCts").val() == undefined || $("#bordCts").val() == ""){
		guideTxt = "내용을 입력해주세요.";
		obj = $("#bordCts");
	}else if(pwFlag){
		guideTxt = "비밀번호를 확인해주세요"
		obj = $("#userPwCheck");
	}else{
		alertFlag = false;
	}
	
	if(alertFlag){
		alert(guideTxt);
		obj.focus();
		return;
	}
}

function btnClickAction(val){
	var msg = "";
	if(val == "insert"){ // 입력모드
		insertValidCheck(); // 입력값 밸리드 체크
		msg = "등록";
		
	}else{ // 수정모드
		if(updMode){ //수정가능 모드
			if(val == "update"){
				if(compareContxt()){
					alert("수정된게 없습니다.");
					return;
				}
				$("#bordNo").val(num);
				msg = "수정";
			}else{ // delete 
				if(compareContxt()){
					msg = "삭제";
				}else{
					msg = "수정사항이 있습니다. 그래도 삭제";
				}
				$("#bordNo").val(num);
			}
		}else{ // 수정불가 모드  비번 입력해야함
			//수정모드로 들어가기 위한 비번 입력창
			window.open("Braa1000_confirmPasswdWindow.do?bordNum="+num,"","scrollbars=no,status=no,resizable=no,width=300,height=150");
			return;
		}
	}
	if(!confirm(msg+"하시겠습니까?")){
		return;
	}
	$("#bordWriteForm").attr("action", "/braa/Braa1000_"+val+".do").submit();
}

function checkAfterAction(num){
	console.log("열기");
	updMode = true;
	$("#braaDelete").css('display','block');
	$("input, textarea").prop("readonly", false);
}
</script>
<div class="inner">
<form name="bordWriteForm" id="bordWriteForm" method="POST">
<input type="hidden" name="bordNo" id="bordNo" value=0>
<div id="infoCheck">
	<div>
		<label for="agree">개인정보 수집 및 이용 동의</label>
		<div>
			블라블라_상민님이 내용 채울실 것
		</div>
	</div>
	<div>
	<input type="checkbox" id="checkInfo">
	<label for="">개인정보 수집 및 이용에 동의합니다.</label>
	</div>
	</div>
<div>
	<label for="name">공개여부</label>
	<p/>
	<select id="bordRelease" name="bordRelease">
		<option value="Y">공개</option>
		<option value="N">비공개</option>
	</select>
</div>
<div>
	<label for="name">이름</label>
	<p/>
	<input type="text" id="userNm" name="userNm" value="${braa.userNm}">
</div>
<div id="pwdDiv">
	<label for="pwd">비밀번호</label>
	<p/>
	<input type="password" id="userPw" name="userPw">
	<span>비밀번호 분실 시 찾을 수 없습니다.</span>
</div>
<div id="pwdCheckDiv">
	<label for="pwdCheck">비밀번호 확인</label>
	<p/>
	<input type="password" id="userPwCheck" name="userPwCheck">
	<span id="pwCheckMsg"></span>
</div>
<div id="email">
	<label for="email">이메일</label>
	<p/>
	<input type="text" id="userEmail" name="userEmail" value="${braa.userEmail}">
</div>
<div id="tel">
	<label for="tel">연락처</label>
	<p/>
	<input type="text" id="userPhone" name="userPhone" value="${braa.userPhone}">
</div>
<div>
	<label for="title">제목</label>
	<p/>
	<input type="text" id="bordNm" name="bordNm" value="${braa.bordNm}">
</div>
<div>
	<label for="content">내용</label>
	<p/>
	<textarea id="bordCts" name="bordCts" style="resize: none;" placeholder="2000자 이내로 작성해주세요.">${braa.bordCts}</textarea>
</div>
<button type="reset" id="reset">초기화</button>
<button type="button" id="write" onclick="btnClickAction('insert')">등록</button>
<button type="button" id="braaList">목록</button>
<button type="button" id="braaUpdate" onclick="btnClickAction('update')">수정</button>
<button type="button" id="braaDelete" onclick="btnClickAction('delete')">삭제</button>
</form>
</div>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</body>
</html>