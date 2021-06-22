<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail JSP</title>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<h3>공지글 안내</h3>
<table class="table table-hover" style="width:1300px">
	<tr>
		<th>제목</th>
		<td colspan="5" class="left">${vo.title }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${vo.name}</td>
		<th>작성일자</th>
		<td><fmt:formatDate value="${vo.writedate }" pattern="MM.dd" /></td>
		<th>조회수</th>
		<td>${vo.views }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="5" class="left">${fn:replace(vo.content, crlf, '<br>') }</td>
	</tr>
	<tr>
		<th>첨부 파일</th>
		<td colspan="5" class="left">
			${vo.filename }
			<core:if test="${!empty vo.filename }">
				<a href="download?id=${vo.id }" style='margin-left: 15px'><i class="fas fa-download font-img"></i></a>
			</core:if>
		</td>
	</tr>
</table>

<div class="btnSet">
	<a class="btn-fill" href="list.no">목록으로</a>
	<!-- 관리자 -->
		<a class="btn-fill" href='modify?id=${vo.id }'>수정</a>
		<a class="btn-fill" onclick="if(confirm('정말 삭제하시겠습니까?')) {href='delete.no?id=${vo.id }' }">삭제</a>
	<!-- 로그인 -->	
		<a class="btn-fill" href="reply?id=${vo.id }">답글 쓰기</a>
</div>
</body>
</html>