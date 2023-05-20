<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>

<!--bước 2.1.1 người dùng truy cập vào trang login-->
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Anime</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/plyr.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" type="text/css" href="css/ds/style.css" />
<script src="https://kit.fontawesome.com/9847adceef.js"></script>
<link rel="stylesheet" href="css/ds/font-awesome.min.css"
	type="text/css">
<script src="https://www.google.com/recaptcha/api.js?hl=vi"></script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<c:url var="urlAvatar"
		value="${request.rervletContext.realPath}/anime-main/storage/avatarUser/${sessionScope.user.avatar}" />
	<fmt:setLocale value="${sessionScope.LANG}" />
	<fmt:setBundle basename="app" />


	<!-- Header Section Begin -->

	<fmt:setBundle basename="app" />
	<div id="ah_wrapper">
		<header class="header">
			<fmt:setLocale value="${sessionScope.LANG}"/>
			<fmt:setBundle basename="app"/>
			<div class="container">
				<div class="row">
					<div class="col-lg-2">
						<div class="header__logo">
							<a href="index.jsp"> <img src="img/logo.png" alt="">
							</a>
						</div>
					</div>
					<div class="col-lg-7">
						<div class="header__right">

							<form class="searchTag" id="search-name">
								<div class="searchInput">
									<input id="search-input" placeholder="Search here....."
										   name="searchBox" type="text" oninput="searchByName(this)">

								</div>
							</form>
							<div id="search-results"></div>
							<div class="iconSearch">
								<i class="fas fa-search"></i>
								<table id="renderSearch"></table>


							</div>

						</div>

					</div>
					<div class="col-lg-3">

						<div class="header__right2">
							<c:choose>
								<c:when test="${not empty sessionScope.account}">
									<c:if test="${sessionScope.account.isManagement()==false}">
										<div>
											<img alt="" src="${urlAvatar}" id="avtUser1" onclick="vision1()">
											<ul class="profile" id="profile1">

												<li><a href="profile.jsp">
													<button class="">
														<fmt:message>header.account</fmt:message>
													</button>
												</a></li>
												<li><a href=""><fmt:message>header.follow</fmt:message></a>
												<li><a href="">Phim đã mua</a></li>
												<li><a href="logOut">
													<button
															class="fas fa-sign-out-alt"></button>
												</a></li>
											</ul>
										</div>
									</c:if>
									<c:if test="${sessionScope.account.isManagement()==true}">
										<div>
											<fmt:setLocale value="${sessionScope.LANG}"/>
											<fmt:setBundle basename="app"/>
											<img alt="" src="${urlAvatar}" id="avtUser" onclick="vision()">
											<ul class="profile" id="profile">

												<li><a href="profile.jsp">
													<button class="">
														<fmt:message>header.account</fmt:message>
													</button>
												</a></li>
												<li><a href=""><fmt:message>header.follow</fmt:message></a>
												<li><a href="">Phim đã mua</a></li>

												<li><a href="">
													<button class="fa fa-cog"></button>
												</a></li>
												<li><a href="logOut">
													<button
															class="fas fa-sign-out-alt"></button>
												</a></li>

											</ul>
										</div>
									</c:if>

								</c:when>
								<c:when test="${empty sessionScope.account}">
									<a href="login.jsp"><fmt:message>menu.login</fmt:message> </a>
									<font color="#e53637"> / </font>
									<a href="signup.jsp"><fmt:message>menu.signup</fmt:message></a>

								</c:when>
							</c:choose>
							<input type="text" id="idSession" value="${pageContext.session.id}"
								   style="display: none;">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<fmt:setLocale value="${sessionScope.LANG}"/>
						<fmt:setBundle basename="app"/>
						<div class="header__nav">
							<nav class="header__menu mobile-menu">
								<ul>
									<li class="active"><a href="index.jsp"><fmt:message>menu.hompage</fmt:message></a></li>
									<li><a href="#"><fmt:message>menu.categories</fmt:message><span
											class="arrow_carrot-down"></span></a>
										<div class="dropdown">
											<ul>

											</ul>
										</div>
									</li>

									<li><a href="/anime-main/gotoblog"><fmt:message>menu.ourblog</fmt:message></a></li>
									<li><a
											href="https://www.facebook.com/profile.php?id=100012214729084"><fmt:message>menu.contracts</fmt:message></a>
									</li>
									<li><a href="#"><fmt:message>content.langue</fmt:message></a>
										<div class="dropdown2">
											<c:set var="query" value="${pageContext.request.queryString}"/>

											<ul>
												<c:if test="${param.lang== null}">
													<li style="color: black;"><a
															href="?${query}&&lang=vi_VN"><fmt:message>content.vn</fmt:message></a>
													</li>
													<li style="color: black;"><a
															href="?${query}&&lang=en_US"><fmt:message>content.en</fmt:message></a>
													</li>
												</c:if>
												<c:if test="${param.lang!= null}">

													<li style="color: black;"><a
															href="?${fn:substring(query, 0, query.length()-12)}&&lang=vi_VN"><fmt:message>content.vn</fmt:message></a>
													</li>
													<li style="color: black;"><a
															href="?${fn:substring(query, 0, query.length()-12)}&&lang=en_US"><fmt:message>content.en</fmt:message></a>
													</li>
												</c:if>
											</ul>
										</div>
									</li>
									<li>
										<a href="">Wish list <i class="fas fa-film"></i></a>
									</li>
									<li>
										<a href="#">Recharge <i class="fas fa-credit-card" style="color: #fafafa;"></i></a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<div id="mobile-menu-wrap"></div>
			</div>
		</header>
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/player.js"></script>
		<script src="js/jquery.nice-select.min.js"></script>
		<script src="js/mixitup.min.js"></script>
		<script src="js/jquery.slicknav.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/main.js"></script>

		<script>
			function vision() {
				let isVisible = document.getElementById("profile").style.display;
				if (isVisible === "") {
					document.getElementById("profile").style.display = 'block';
				} else if (isVisible === "block") {
					document.getElementById("profile").style.display = 'none';
				} else {
					document.getElementById("profile").style.display = 'block';
				}
			}
		</script>
		<script>
			function vision1() {
				let isVisible = document.getElementById("profile1").style.display;
				if (isVisible === "") {
					document.getElementById("profile1").style.display = 'block';
				} else if (isVisible === "block") {
					document.getElementById("profile1").style.display = 'none';
				} else {
					document.getElementById("profile1").style.display = 'block';
				}
			}
		</script>
		<script>
			$(function () {
				$('#nav ul li a').each(function () {
					let path = window.location.href;
					let current = path.substring(path.lastIndexOf('/') + 1);
					let url = $(this).attr('href');
					if (url === current) {
						$(this).addClass('active');
					}

				});
			});
		</script>
	<!-- Header End -->

	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="img/normal-breadcrumb.jpg">

		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>
							<fmt:message>menu.login</fmt:message>
						</h2>
						<p>
							<fmt:message>content.welcome</fmt:message>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<!-- Login Section Begin -->
		<!--Bước 2 -->
	<section class="login spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login__form">
						<h3>
							<fmt:message>menu.login</fmt:message>
						</h3>
						<c:url var="login" value="/anime-main/login"/>
						<form action="${login}" method="post"><!--bước 2.1.2 show form login--> <!-- bước 2.1.3 người dùng nhập dữ liệu-->
							<div class="input__item">
								<input required="required" type="text" placeholder="User Name"
									name="loginName" value="${requestScope.usName}"> <span
									class="icon_mail"></span>
							</div>
							<div class="input__item">
								<input type="password" required="required"
									placeholder="Password" name="loginPassword" value="${requestScope.usPass}"> <span
									class="icon_lock"></span>
							</div>
							<div class="g-recaptcha"
								data-sitekey="6Lf2nYwkAAAAADknQvj1Os2Ht92MMORFX3RhbQDo"></div>
							<button type="submit" class="site-btn" value="login"
								name="accountBtn">
								<fmt:message>button.login</fmt:message>
							</button> <!-- 2.1.4 submit form -->
						</form>

						<br>
						<div style="color: red">${requestScope.error}</div> <!-- hiển thị lỗi -->

					</div>

				</div>
				<div class="col-lg-6">
					<div class="login__register">
						<h3>Dont’t Have An Account?</h3>
						<a href="#" class="primary-btn">Register Now</a>
						<div class="login__social">
							<div class="row d-flex justify-content-center">
								<div class="col-lg-6">
									<div class="login__social__links">
										<span>or</span>
										<ul>
											<li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With
												Facebook</a></li>
											<li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
											<li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>

	</section>
	</div>
	<!-- Login Section End -->

	<!-- Footer Section Begin -->



</body>

</html>