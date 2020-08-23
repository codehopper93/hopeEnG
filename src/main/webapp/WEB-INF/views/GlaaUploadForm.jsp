<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File upload using Commons FileUpload</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>
</head>


<body>

<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>

<script>
$(document).ready(function(){        
    
});
    
/** 게시판 - 목록 페이지 이동 */
function goGlaaList(){                
    location.href = "/glaa/glaa.do";
}

/** 게시판 - 작성  */
function insertGlaa(){

	var formData = new FormData($('#gllyForm')[0])
	
	
    var gllySubject = $("#gllyNm").val();
    var gllyContent = $("#gllyCts").val();
        
    if (gllySubject == ""){            
        alert("제목을 입력해주세요.");
        $("#gllyNm").focus();
        return;
    }
    
    if (gllyContent == ""){            
        alert("내용을 입력해주세요.");
        $("#gllyCts").focus();
        return;
    }
        
    var yn = confirm("게시글을 등록하시겠습니까?");        
    if(yn){
    	
        var filesChk = $("input[name='files[0]']").val();
        if(filesChk == ""){
        	
            $("input[name='files[0]']").remove();
            
        }
       
        
        //$("#gllyForm").ajaxForm({
        $.ajax({
            url   : "/glaa/Glaa1000_insert.do",
            //data : $("#gllyForm").serialize(),
			//dataType : "JSON",
			data : formData,
			contentType : false,
			processData : false,
            enctype    : "multipart/form-data",
            cache   : false,
            async   : true,
            type    : "POST",                         
            success : function(obj) {
               // insertGlaaCallback(obj);                
            },           
            error     : function(xhr, status, error) {}
            
        });
        $("#gllyForm").submit();

    }
 
}

/** 게시판 - 작성 콜백 함수 */
function insertGlaaCallback(obj){

    if(obj != null){        
        
        var result = obj.result;
        
        if(result == "SUCCESS"){                
            alert("게시글 등록을 성공하였습니다.");                
            goGlaaList();                 
        } else {                
            alert("게시글 등록을 실패하였습니다.");    
            return;
        }
    }
}

/*  $(document).ready(function(){

	$("#glaaList").click(function(){
		window.location.href = "glaa.do";
	})
	

})  */


/* function submitVal(val){
	var action = "";
	//alert("hello");
	if(val == "insert"){
		var gllyWriteForm = document.gllyWriteForm;
		var alertFlag = true;
		var guideTxt = ""
		var obj = "";
		
		if($("#gllyNm").val() == undefined || $("#gllyNm").val() == ""){
			guideTxt = "제목을 입력해주세요.";
			obj = $("#gllyNm");
		}else if($("#gllyCts").val() == undefined || $("#gllyCts").val() == ""){
			guideTxt = "내용을 입력해주세요.";
			obj = $("#gllyCts");
		}else{
			alertFlag = false;
		}
		
		if(alertFlag){
			alert(guideTxt);
			obj.focus();
			return;
		}
		
		var yn = confirm("게시글을 등록하시겠습니까?");
		if(yn){
			$.ajax({
				url : "/glaa/Glaa1000_insert.do",
				data : $("#gllyWriteForm").serialize(),
				dataType : "JSON",
				cache : false,
				async : true,
				type : "POST",
				success : function(obj){
					//insertBoardCallback(obj);
				},
				error : function(xhr, status, error){}
			})
		}
		action = "/glaa/Glaa1000_insert.do";
	}else{ //update
		$("#gllyNo").val(num);
		action = "/glaa/Glaa1000_update.do"
	}
	$("gllyWriteForm").attr("action", action).submit();
} */
</script>

<%-- 
<form name="gllyWriteForm" id="gllyWriteForm" method="POST">
<input type="hidden" name="gllyNo" id="gllyNo" value=0>


<div>
	<label for="name">메인화면 표시 여부</label>
	<p/>
	<select id="gllyShowMain" name="gllyShowMain">
		<option value="Y">표시</option>
		<option value="N" selected>미표시</option>
	</select>
</div>
<div>
	<label for="title">제목</label>
	<p/>
	<input type="text" id="gllyNm" name="gllyNm" value="${glaa.gllyNm}">
</div>
<div>
	<label for="content">내용</label>
	<p/>
	<textarea id="gllyCts" name="gllyCts">${glaa.gllyCts}</textarea>
</div>

<button type="reset" id="reset">초기화</button>
<button type="button" id="write" onclick="submitVal('insert')">등록</button>
<button type="button" id="glaaUpdate" onclick="submitVal('glaaUpdate')">수정</button>
</form>
<button type="button" id="glaaList">목록</button>

<form method="post" action="/glaa/uploadFile" enctype="multipart/form-data">
<table style="padding-left: 200px;">
	<tr>
		<td colspan="2"><c:out value="${uploadMessage}"/></td>
	<tr>
	<tr>
		<td><b>Select the file to be uploaded : &nbsp;</b></td>
		<td><input type="file" name="myFileField" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button"
			value="Upload file" onclick="document.forms[0].submit();" /></td>
	</tr>
</table>
</form> --%>








<div id="wrap">
    <div id="container">
        <div class="inner">       
            <h2 class="" style="margin-bottom:30px;" > 게시글 작성</h2>
            <form id="gllyForm" name="gllyForm" action="/glaa/Glaa1000_insert" enctype="multipart/form-data" method="post" onsubmit="return false;">
                <table width="100%" class="table">
                <caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="*">
                    </colgroup>
                    <tbody id="tbody">
                   		<tr>
                            <th>메인화면 표시 여부<span class="t_red">*</span></th>
                            <td>
                            <select id="showMainYn" name="showMainYn" class="custom-select">
							<option value="Y">표시</option>
							<option value="N" selected>미표시</option>
							</select>
							</td>
                        </tr>
                        <tr>
                            <th>제목<span class="t_red">*</span></th>
                            <td><input id="gllyNm" name="gllyNm" value="" class="form-control"/></td>
                        </tr>
                        <tr>
                            <th>내용<span class="t_red">*</span></th>
                            <td><textarea id="gllyCts" name="gllyCts" cols="30" rows="10" class="form-control"></textarea></td>
                        </tr>
                        <tr>
                            <th scope="row">첨부파일</th>
                            <td><input multiple="multiple" type="file" id="files[0]" name="files[0]" value="" class=""></td>
                        </tr>
                       
					
                    </tbody>
                </table>
            </form>
            <div class="btn_right mt15">
                <button type="button" class="btn-group-toggle" onclick="javascript:goGlaaList();">목록으로</button>
                <button type="button" class="btn-group-toggle" onclick="javascript:insertGlaa();">등록하기</button>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</html>