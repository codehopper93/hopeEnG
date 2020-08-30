<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 게시판</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>
</head>
<body>
<H1>여기 갤러리임</H1>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){ //메인에서 클릭해서 들어오면 서버에서 무조건 5개 가지고 옴
		
		ajaxComm("/glaa/Glaa1000_select.do","",glaaSelectCallback);
		
		$("#searchBtn").click(function(){
			var url = "/glaa/Glaa1000_select.do";
			var searchArr = new Object();
			searchArr[$("#select").val()] = $("#searchText").val();

			ajaxComm(url, searchArr, glaaSelectCallback);			
		})
		
		$("#write").click(function(){
			//window.location.href = "<c:url value='/glaa/Glaa1000_write.do'/>";
			window.location.href = "/glaa/uploadForm.do";
		})
	})

	function glaaSelectCallback(result){
		$("#glaaTable").empty();
		var glaaAppend = "<tr><th>번호</th><th>제목</th><th>날짜</th><th>공개여부</th><th>사진</th></tr>";
		var stus = "";
		var click = "";
		
		$.each(result.glaaList,function(index,item){
			
			
	   		glaaAppend += "<tr>"
	   					+"<td>"+ item.gllyNo +"</td>"
	   					+"<td>"+ item.gllyNm +"</td>"
	   					+"<td>"+ item.regiDate +"</td>"
	   					+"<td>"+ item.showMainYn +"</td>"
	   					
	   					+ "</tr>"
/* 		    glaaAppend += "<tr><td>"+item.bordNo+"</td><td><a href='javascript:bordWrite(\""+item.bordNo+"\",\""+item.bordRelease+"\");'>"+item.bordNm+"</a>"
		    		   +"</td><td>"+item.userNm+"</td><td>"+item.modyDate+"</td><td>"+item.bordCnt+"</td><td>"+stus
		    		   +"</td><td>"+item.bordRelease+"</td></tr>";
 */
		});
		
		$("#glaaTable").append(glaaAppend);
	}
	
	function bordWrite(bordNum, bordRelease){		
		//비밀번호 입력
		/* if(bordRelease == "N"){ //비공개
			window.open("${pageContext.request.contextPath}/confirm.jsp","","scrollbars=no,status=no,resizable=no,width=300,height=150");
		} */
		window.location.href = "Glaa1000_detailSelect.do?bordNum="+bordNum;
	}
	
	function ajaxComm(url, data, callback){
		$.ajax({
			url:url,
			type:"get",
			data:data,
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success:callback,
			error:function(xhr, status, error){
				console.log(xhr+"\n"+status+"\n"+error);
			}
		});
	}
	$(document).ajaxStart(function(){
		$('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
	})
	$(document).ajaxStop(function(){
		$('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
	});
</script>
<div class="inner">
<h2 class="" > 갤러리</h2>
	<div style="margin-bottom:15px;">
		<select id="select" class="form-control" style="width:100px;float:left;">
			<option value="bordNm">제목</option>
			<option value="userNm">이름</option>
		</select>
		<input class="form-control-mid" type="text" id="searchText" style="float:left;margin-left:5px;"/>
		<button id="searchBtn" style="margin-left:10px;">검색</button>
	</div>
	<div>
		<table class="table" id="glaaTable" width="500" cellpadding="7" cellspacing="0" border="1">
		</table>
	</div>
	<div>
		<button id="write" style="float:right;">작성하기</button>
	</div>
</div>
</body>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</html>