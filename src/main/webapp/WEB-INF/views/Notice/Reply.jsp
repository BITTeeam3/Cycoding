<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%
// 	양식 다시 제출 방지
	response.setHeader("Cache-Control","no-store"); 
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader("Expires",0);
	if (request.getProtocol().equals("HTTP/1.1")){ 
		response.setHeader("Cache-Control", "no-cache");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CYCO NOTICE</title>
<style type="text/css">
/* 파일 첨부 */
.file-img { 
	width: 18px; height:18px; cursor:pointer; 
}

#attach-file, #delete-file { 
	display:none; 
}

select { 
	height: 32px !important;
}

img {
	vertical-align: middle;	/* 세로축 가운데 정렬 */
}

a.btn-fill, a.btn-empty {
	text-align: center;
	padding: 3px 10px;
	border:1px solid #3367d6;
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	/* 오른쪽, 아래쪽, 번진 정도 */
}

a.btn-fill { 
	background-color: #3367d6;
	color: #fff;
}

a.btn-empty { 
	background-color: #fff;
	color: #3367d6
}

a.btn-fill-s, a.btn-empty-s {
	text-align: center;
	padding: 1px 10px;
	border:1px solid #c4dafc
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	color: #0000cd;
	font-size: 13px;
}

a.btn-fill-s { 
	background-color: #bacdfa;
}

a.btn-empty-s { 
	background-color: #fff;
}

.btnSet a:not(:first-child) {
	margin-left: 3px;
}

input[type=radio] {
	width: 18px;
	margin: 0 5px 3px;
	vertical-align: middle;
}

input[name=title] { width:calc(100% - 14px) }
textarea[name=content] { width:calc(100% - 6px); height: 150px; resize: none;}

.font-img { cursor: pointer; }

</style>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<h3>답글 쓰기</h3>

<form action="reply_insert" method="post" enctype="multipart/form-data">
	<input type="hidden" name="root" value="${vo.root }" />
	<input type="hidden" name="step" value="${vo.step }" />
	<input type="hidden" name="hidden" value="${vo.dept }" />
	
	<table class="table table-hover">
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" name="title" class="need"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${sessionScope.MEMBER_NICKNAME}</td>
			<td><input type="hidden" name="MEMBER_ID" value="${sessionScope.member_id }"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" class="need"></textarea></td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td class="left">
				<label>
					<input type="file" name="file" id="attach-file"/>
					<img src='../assets/img/notice/fileUpload.png' class="file-img" />
				</label>
				<span id="file-name"></span>
				<span id="delete-file" style="color: red; margin-left: 20px;" ><i class="fas fa-times font-img"></i></span>
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="if(necessary()) $('form').submit()">저장</a>
	<a class="btn-empty" href="list">취소</a>
</div>

<!-- 실시간 갱신을 위해 getTime을 붙여준다 -->
<script type="text/javascript" src="../assets/js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="../assets/js/file_attach.js"></script>
</body>
</html>