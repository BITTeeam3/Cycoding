<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify JSP</title>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<h3>공지글 수정</h3>
<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${vo.id }"/>
	<input type="hidden" name="attach" />
	<table class="table table-hover" style="width:1300px">
		<tr>
			<th>제목</th>
			<td><input class="need" type="text" name="title" value="${vo.title }"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="need" name="content">${vo.content }</textarea></td>
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td class="left">
				<label>
					<input id="attach-file" type="file" name="file" />
					<img src="../assets/img/notice/file.png" class="file-img" style="width:auto; height: 30px;"/>
				</label>
				<span id="file-name">${vo.filename }</span>
				<span id="delete-file" style='display:${empty vo.filename ? "none" : "inline"}; color:red; margin-left:20px;'><i class="fas fa-times font-img"></i></span>
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="if( necessary() ) { $('[name=attach]').val($('#file-name').text()); $('form').submit(); }">저장</a>
	<a class="btn-empty" href="detail?id=${vo.id }">취소</a>
	<!-- <a class="btn-empty" href="javascript:history.go(-1)">취소</a> -->
</div>

<!-- 실시간 갱신을 위해 getTime을 붙여준다 -->
<script type="text/javascript" src="../assets/js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="../assets/js/file_attach.js"></script>
</body>
</html>