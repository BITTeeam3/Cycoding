<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- post 방식을 위한 시큐리티 토큰 설정 -->
	<meta name="_csrf" content="${_csrf.token}"/>

<!-- Primary Meta Tags -->
<title>사이좋게 코딩하자</title>
  
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 반응형 토글 -->
<script
	src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


<!-- Fontawesome -->
<link type="text/css"
	href="${pageContext.request.contextPath}/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">

<!-- Pixel CSS -->
<link type="text/css"
	href="${pageContext.request.contextPath}/css/pixel.css"
	rel="stylesheet">
<!-- main CSS -->
<link type="text/css"
	href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">

<!-- favicon -->
<link type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/img/favicon/cycoding-favicon.ico"
	rel="icon">

</head>
<!-- 반응형 토글 -->
<script
	src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- JQuesy -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



<link type="text/css"
	href="${pageContext.request.contextPath}/css/pixel.css"
	rel="stylesheet">
<!-- main CSS -->
<link type="text/css"
	href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 스프링 시큐리티 설정 -->
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<body>
	<header class="header-global">
		<div class="header_">
			<nav id="navbar-main" aria-label="Primary navigation"
				class="navbar navbar-main navbar-expand-lg navbar-theme-primary headroom navbar-dark">
				<div class="container position-relaive">
					<a class="navbar-brand me-lg-5"
						href="${pageContext.request.contextPath}/main.cy"> <img
						class="navbar-brand-dark"
						src="${pageContext.request.contextPath}/assets/img/brand/LOGO.svg"
						alt="Logo light">
					</a>
					<div class="navbar-collapse collapse me-auto" id="navbar_global">

						<div class="navbar-collapse-header">
							<div class="row">
								<div class="col-6 collapse-brand">
									<a href="main.cy"> <img
										src="${pageContext.request.contextPath}/assets/img/brand/LOGO.svg"
										alt="Themesberg logo">
									</a>
								</div>
								<div class="col-6 collapse-close">
									<a href="#navbar_global" class="fas fa-times"
										data-bs-toggle="collapse" data-bs-target="#navbar_global"
										aria-controls="navbar_global" aria-expanded="false"
										title="close" aria-label="Toggle navigation"></a>
								</div>
							</div>
						</div>


						<!-- Header Left -->
						<ul class="navbar-nav navbar-nav-hover align-items-lg-center">

							<li class="nav-item dropdown"><a
								href="${pageContext.request.contextPath}/#" class="nav-link"
								id="frontPagesDropdown" aria-expanded="false"
								data-bs-toggle="dropdown"> HOME </a></li>

							<li class="nav-item dropdown"><a
								href="${pageContext.request.contextPath}/#" class="nav-link"
								id="dashboardDropdown" aria-expanded="false"
								data-bs-toggle="dropdown"> PROJECT </a></li>


							<li class="nav-item dropdown"><a
								href="${pageContext.request.contextPath}/memberlist.cy"
								class="nav-link" id="componentsDropdown" aria-expanded="false"
								data-bs-toggle="dropdown"> MEMBER </a></li>

							<li class="nav-item dropdown"><a
								href="${pageContext.request.contextPath}/#" class="nav-link"
								data-bs-toggle="dropdown" id="supportDropdown"
								aria-expanded="false"> COMMUNITY </a></li>
						</ul>

						<!-- Header Right -->
						<div class="right_nav">
							<ul
								class="navbar-nav navbar-nav-hover align-items-lg-center plex_right">

								<!-- 로그인 안하면 -->
								<se:authorize
									access="!hasAnyRole('ROLE_PREMEMBER','ROLE_MEMBER','ROLE_ADMIN', 'ROLE_TEAMMANGER', 'ROLE_PENALTY')">
									<li class="nav-item dropdown"><a
										href="${pageContext.request.contextPath}/login.cy"
										class="nav-link"> 로그인 </a></li>
								</se:authorize>

								<!-- 어드민  -->
								<se:authorize access="hasRole('ROLE_ADMIN')">
									<!--알림 -->
									<li class="nav-item dropdown"><a href="register.cy"
										class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
										id="supportDropdown" aria-expanded="false"> <img
											src="${pageContext.request.contextPath}/assets/img/brand/ALARM.svg">
									</a>
										<div class="dropdown-menu dropdown-menu-lg"
											aria-labelledby="supportDropdown">
											<div class="col-auto px-0"></div>
										</div></li>

									<!-- 로그인 -->
									<li class="nav-item dropdown"><a
										href="${pageContext.request.contextPath}/admin.cy"
										class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
										id="supportDropdown" aria-expanded="false"> 관리자 페이지 <span
											class="fas fa-angle-down nav-link-arrow ms-1"></span>
									</a>
										<div class="dropdown-menu dropdown-menu-lg"
											aria-labelledby="supportDropdown">
											<div class="col-auto px-0"></div>
										</div></li>

								</se:authorize>

								<!-- 기본 회원들 헤더 -->
								<se:authentication property="name" var="LoginUser" />
								<se:authorize
									access="hasAnyRole('ROLE_MEMBER','ROLE_PREMEMBER','ROLE_TEAMMANGER')">
									<!--알림 -->
									<li class="nav-item dropdown"><a href="#"
										class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
										id="supportDropdown" aria-expanded="false"> <img
											src="${pageContext.request.contextPath}/assets/img/brand/ALARM.svg">
									</a>
										<div class="dropdown-menu dropdown-menu-lg"
											aria-labelledby="supportDropdown">
											<div class="col-auto px-0"></div>
										</div></li>

									<!-- 로그인 -->
									<li class="nav-item dropdown"><a href="#"
										class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
										id="supportDropdown" aria-expanded="false"> ${LoginUser}님
											<span class="fas fa-angle-down nav-link-arrow ms-1"></span>
									</a>
										<div class="dropdown-menu dropdown-menu-lg"
											aria-labelledby="supportDropdown">
											<div class="col-auto px-0">
												<div class="list-group list-group-flush">

													<form action="logout.cy" method="post">
														<input type="hidden" name="${_csrf.parameterName}"
															value="${_csrf.token}" />
														<button type="submit">로그아웃</button>
													</form>
													<a href="mypage.cy?useremail=${LoginUser}">마이페이지</a>
												</div>
											</div>
										</div></li>
								</se:authorize>

							</ul>
						</div>
					</div>
					<button class="navbar-toggler ms-2" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbar_global"
						aria-controls="navbar_global" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>
			</nav>
		</div>
	</header>

	<main>

		<!-- LOADER -->
		<div id="preloader">
			<div class="loader-container">
				<div class="progress-br float shadow">
					<div class="progress__item"></div>
				</div>
			</div>
		</div>
		<!-- END LOADER -->

	</main>

	<!-- 반응형 토글 -->
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/headroom.js/dist/headroom.min.js"></script>

	<!-- Pixel JS -->
	<script src="${pageContext.request.contextPath}/assets/js/pixel.js"></script>

	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

	<script type="text/javascript">



/* ==============================================
Loader -->
=============================================== */

$(function() {
    $("#preloader").on(500).fadeOut();
    $(".preloader").on(600).fadeOut("slow");
	$('.loader-container').addClass('done');
	$('.progress-br').addClass('done');	 
});


/* ==============================================
Loader -->
=============================================== */


</script>

</body>
</html>