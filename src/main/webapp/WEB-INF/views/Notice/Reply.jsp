<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply JSP</title>
<style type="text/css">
/* 파일 첨부 */
.file-img { 
	width: 18px; height:18px; cursor:pointer; 
}

#attach-file, #delete-file { 
	display:none; 
}

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