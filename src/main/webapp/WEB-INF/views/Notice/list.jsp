<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<h3>공지사항</h3>

<table>
	<tr>
		<th class="w-px60">번호</th>
		<th>제목</th>
		<th class="w-px100">작성자</th>
		<th class="w-px120">작성일자</th>
		<th class="w-px60">첨부파일</th>
		<th class="w-px60">조회수</th>
	</tr>
	<core:forEach items="${list }" var="vo">
		<tr>
			<td>${vo.id }</td>
			<td>${vo.title }</td>
			<td>${vo.MEMBER_ID }</td>
			<td><fmt:formatDate value="${vo.writedate }" pattern="MM.dd" /></td>
			<td></td>
			<td>${vo.views }</td>
			<td></td>
		</tr>
	</core:forEach>
</table>
</body>
</html>