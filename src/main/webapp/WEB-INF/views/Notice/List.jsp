<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<h3>공지사항</h3>
<form method="post" action="list" id="list">
	<input type="hidden" name="curPage" value="1"/>
	<div id="list-top">
		<div>
			<ul>
					<li><a class="btn-fill" href="new">글쓰기</a></li>
			</ul>
		</div>
	</div>
</form>

<table class="table table-hover" style="width:1300px">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일자</th>
		<th>첨부파일</th>
		<th>조회수</th>
	</tr>
	<core:forEach items="${page.list }" var="vo">
		<tr>
			<td>${vo.no }</td>
			<td class="left"><a href="detail?id=${vo.id }" >${vo.title }</a></td>
			<td>${vo.MEMBER_ID }</td>
			<td><fmt:formatDate value="${vo.writedate }" pattern="MM.dd" /></td>
			<td>
				<core:if test="${!empty vo.filename }">
					<a href="download?id=${vo.id }">
						<img title="${vo.filename}" class="file-img" src="../assets/img/notice/fileAttach.png" style="width:auto;height: 20px;"/>
					</a>
				</core:if>
			</td>
			<td>${vo.views }</td>
		</tr>
	</core:forEach>
</table>
<div class="btnSet">
	<jsp:include page="/WEB-INF/views/common/page.jsp"/>
</div>
</body>
</html>