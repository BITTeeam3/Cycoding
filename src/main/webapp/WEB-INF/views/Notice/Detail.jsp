<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

.section-header{
	background-image: url("../assets/img/notice/gongji.jpg");
	background-repeat: no-repeat;
    background-size: cover;
    background-size: 100%;
    background-position: center;
    margin-bottom: 50px;
}

img {
	vertical-align: middle;	/* 세로축 가운데 정렬 */
}

input[type=radio] {
	width: 18px;
	margin: 0 5px 3px;
	vertical-align: middle;
}

input[name=title] { width:calc(100% - 14px) }
textarea[name=content] { width:calc(100% - 6px); height: 150px; resize: none;}

.font-img { cursor: pointer; }

.form-control {
	border: none !important;
    background-color: white !important;
}

.boardBtn {
	font-weight: 300 !important;
    font-size: 14px !important;
    border-radius: 3px !important;
    padding: 7px !important;
    margin-top: 20px !important;
    margin-bottom: 20px !important;
}

#replyHr{
    margin: 1rem 0;
    color: #C0A9BD;
    background-color: currentColor;
    border: 0.5px solid !important;
    opacity: 1;
}

</style>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<div class="container">
	<div class="section-header"></div>
	<br/>
	<br/>
	<header>
		<div>
			<h2>
				<span><core:out value="${vo.title }"/><br/></span>
			</h2>
			<div>
				<span><core:out value="${vo.name}"/><img src ="../assets/img/notice/crown.png" style="width:auto; height:30px; padding-bottom:5px;"/></span>&nbsp; | &nbsp;<span><fmt:formatDate value="${vo.writedate}" pattern="yyyy.MM.dd hh:mm:ss" /></span>
			</div>
			<div class="text-right">
				<span>조회&nbsp;<core:out value="${vo.views }"/></span><br/>
			</div>
		</div>
	</header>	
	<hr/>
	<div class="form-group">
		<textarea class="form-control boardContent" cols="120" rows="15" readonly="readonly" disabled><core:out value="${fn:replace(vo.content, crlf, '<br>') }" escapeXml="false"/></textarea>
	</div>	
	<br/>
	<div class="form-group" style="margin-bottom:10px">
		<core:if test="${sessionScope.nickname ne null}">
			<core:if test="${!empty vo.filename }">	
				<label for="fileno">첨부 파일 : </label>
				<core:out value="${vo.filename }"/><a href="download?id=${vo.id }" style='margin-left: 15px'><i class="fas fa-download font-img"></i></a>
			</core:if>
		</core:if>
	</div>
	<hr id="replyHr">
</div>
<div class="container text-right" style="margin-bottom:30px">
	<a class="btn btn-outline-primary boardBtn" href="list?curPage=${page.curPage }&search=${page.search }&keyword=${page.keyword }">목록</a>
	<!-- 관리자인 경우 수정/삭제/답글 가능 -->
	<core:if test="${sessionScope.nickname eq '관리자'}">
		<a class="btn btn-outline-primary boardBtn" href='modify?id=${vo.id }'>수정</a>
		<a class="btn btn-outline-black boardBtn" onclick="if(confirm('정말 삭제하시겠습니까?')) {href='delete?id=${vo.id }' }">삭제</a>
		<a class="btn btn-outline-black boardBtn" href="reply?id=${vo.id }">답글 쓰기</a>
	</core:if>	
</div>
</body>
</html>