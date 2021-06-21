<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 유효성 체크
 function necessary() {
 	$('.need').each(function(){
 		if($(this).val() == "") {
 			alert("입력하세요!");
 			$(this).focus();
 			need = false;
 			return need;
 		}
 	});
 	return need;
 }

</script>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<h3>신규 공지 글쓰기</h3>
<form action="insert" method="post">
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" name="title" class="need"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${sessionScope.MEMBER_ID }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" class="need"></textarea></td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="if(necessary()) $('form').submit()">저장</a>
	<a class="btn-empty" href="list">취소</a>
</div>

<script type="text/javascript" src="js/need_check.js"></script>
</body>
</html>