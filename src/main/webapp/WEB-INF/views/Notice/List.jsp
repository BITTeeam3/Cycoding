<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
select { 
	height: 32px !important;
}

img {
	vertical-align: middle;	/* 세로축 가운데 정렬 */
}

input[type=select] {
	width: 18px;
	margin: 0 5px 3px;
	vertical-align: middle;
}

textarea[name=content] { width:calc(100% - 6px); height: 150px; resize: none;}

.font-img { cursor: pointer; }

table {
	font-size: 14px;
	border-top: 0.5px solid #d9d9d9;
    border-bottom: 0.5px solid #d9d9d9;
}
.section-header{
	background-image: url("../assets/img/notice/gongji.jpg");
	background-repeat: no-repeat;
    background-size: cover;
    background-size: 100%;
    background-position: center;
    margin-bottom: 50px;
}

input {
	padding: 0 5px;
}

input::placeholder {
	font-size: 14px
}

.boardBtn {
	font-weight: 300 !important;
    font-size: 14px !important;
    border-radius: 3px !important;
    padding: 7px !important;
    margin-top: 20px !important;
    margin-bottom: 20px !important;
}

th {
	border-bottom: 0.5px solid #d9d9d9 !important;
}

td {
	vertical-align: middle !important;
}
</style>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<div class="container">
<div class="section-header"></div>
<form method="post" action="list" id="list">
	<input type="hidden" name="curPage" value="1"/>
	<div class="form-group" style="margin-bottom:30px;">
		<ul style="display:flex;">
		<li style="margin-right:10px">
					<select name="search" style="font-size: 14px; font-weight: 300;">
						<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
						<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
						<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
						<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
					</select></li>
		<li>
				<input value="${page.keyword }" type="text" name="keyword" style="width:200px;" maxlength="50" placeholder="검색" />
<!-- 				<a class="btn-fill" onclick="$('form').submit()">검색</a> -->
		
				<button  name="btn_search" style="position:relative; left:-7px; border:none; color:white; background:#CA8FAB; height:32.5px;" class="btn_sch input-group-addon" type="button" onclick="$('form').submit()"><span class="fas fa-search"></span></button></li>
		</ul>
	</div>
</form>
<div class="table-responsive-sm" style="overflow-x:auto;">
<table class="table table-hover" style="width:1300px">
	<thead>
	<tr>
		<th scope="col"  class="text-center" style="width: 10%">번호</th>
		<th scope="col"  class="text-center"  style="width: 50%">제목</th>
		<th scope="col"  class="text-center"  style="width: 12%">글쓴이</th>
		<th scope="col"  class="text-center"  style="width:  12%">작성일</th>
		<th scope="col"  class="text-center"  style="width:  8%">첨부파일</th>
		<th scope="col"  class="text-center"  style="width:  8%">조회</th>
	</tr>
	</thead>
	<core:forEach items="${page.list }" var="vo">
		<tr>
			<td scope="row" align="center">${vo.no }</td>
			<td class="left" style="background:transparent; clear:both; display:block;
					padding-left: <c:out value="${20*vo.dept}"/>px; padding:20px;">
					<c:choose>
					<c:when test="${vo.dept eq '0'}">
					<a href="detail.no?id=${vo.id }&curPage=${page.curPage}" >${vo.getShortTitle(50) }</a>
					</c:when>
					<c:otherwise>
					<img src ="../assets/img/board/re.png" style="width:auto; height:20px;"/><a href="detail.no?id=${vo.id }&curPage=${page.curPage}" >${vo.getShortTitle(50) }</a>
					</c:otherwise>
					</c:choose>										
			</td>
			<c:choose>
				<c:when test="${vo.name eq '관리자'}"> 
					<td scope="row" align="center">${vo.name }&nbsp;<img src ="../assets/img/notice/crown.png" style="width:auto; height:30px; padding-bottom:5px;"/></td>
				</c:when>
				<c:otherwise>
					<td scope="row" align="center">${vo.name }</td>
				</c:otherwise>
			</c:choose>
			<td scope="row" align="center"><fmt:formatDate value="${vo.writedate }" pattern="MM.dd" /></td>
			<td scope="row" align="center">
				<core:if test="${!empty vo.filename }">
					<a href="download?id=${vo.id }">
						<img title="${vo.filename}" class="file-img" src="../assets/img/notice/fileAttach.png" style="width:auto;height: 20px;"/>
					</a>
				</core:if>
			</td>
			<td scope="row" align="center">${vo.views }</td>
		</tr>
	</core:forEach>
</table>
</div>
<div class="text-right" style="margin-right:25px">
	<!-- 관리자인 경우 글쓰기 가능 -->
	<core:if test="${sessionScope.nickname eq '관리자'}">
		<a class="btn btn-outline-primary boardBtn" href="new">글쓰기</a>
	</core:if>	
</div>
<div class="text-center" style="margin-bottom:30px">
	<jsp:include page="/WEB-INF/views/common/page.jsp"/>
</div>
</div>
</body>
</html>