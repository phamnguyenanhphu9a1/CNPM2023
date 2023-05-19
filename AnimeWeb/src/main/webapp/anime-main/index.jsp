<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime">
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
<%--    <link rel="stylesheet" href="css/nice-select.css" type="text/css">--%>
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/ds/style.css" />
    <script src="https://kit.fontawesome.com/9847adceef.js"></script>
    <fmt:setLocale value="${sessionScope.LANG}" />
    <fmt:setBundle basename="app" />
</head>

<body>

<fmt:setLocale value="${sessionScope.LANG}" />

<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>
<div id="ah_wrapper">
<!-- Header Section Begin -->
    <c:url var="urlAvatar" value="${sessionScope.account.avatar}"/>

    <fmt:setBundle basename="app"/>
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

<!-- Hero Section Begin -->
<section class="hero">
    <div class="container">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="img/hero/thangtu.jpg">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="hero__text">
                            <div class="label">Romance</div>
                            <h2>Shigatsu wa Kimi no Uso</h2>
                            <p>Nội dung Câu chuyện kể về Arima Kousei, một thần đồng
                                piano. Nhưng kể từ sau chấn động tâm lí do cái sự qua đời của
                                mẹ cậu, Kosei đã không thể nghe thấy bất kì âm thanh nào....</p>

                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="img/hero/overlord.jpg">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="hero__text">
                            <div class="label">Adventure</div>
                            <h2>Overlord</h2>
                            <p>Cốt truyện anime sẽ đưa khán giả đến năm 2138 trong tương
                                lai, khi khoa học công nghệ phát triển vượt bậc và ngành game
                                thực tế ảo đang nở rộ hơn bao giờ hết...</p>

                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="img/hero/dptk.jpg">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="hero__text">
                            <div class="label">Adventure</div>
                            <h2>Fights Break Sphere Season 5</h2>
                            <p>Đấu Phá Thương Khung kể về một thế giới thuộc về Đấu Khí,
                                không hề có ma pháp hoa tiếu diễm lệ, chỉ có đấu khí cương mãnh
                                phồn thịnh! ....</p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">

        <div class="row">
            <div class="col-lg-8">
                <div class="trending__product">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <div class="section-title">

                                <h4>

                                    <fmt:message>content.listnewanime</fmt:message>
                                </h4>
                                <form action="${Index}" method="post">


                                    <label for="filter">Lọc</label><select name="filter" onchange="this.form.submit()" id="filter">
                                        <option value="isAtoZ">A-Z</option>
                                        <option value="notAtoZ">Z-A</option>
                                        <option value="isDescPrice">Giá giảm dần</option>
                                        <option value="notDescPrice">Giá tăng dần</option>
                                        <option value="isDescDate">Cũ nhất</option>
                                        <option value="notDescDate">Mới thêm</option>
                                    </select>
                                </form>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <c:if test="${empty requestScope.index}">
                            <c:set var="offset" scope="page" value="0" />
                        </c:if>
                        <c:forEach var="movie"
                                   items="${requestScope.renderMovies}">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <a href="">
                                    <div class="product__item">
                                        <c:url var="urlAvatarMovie"
                                               value="${movie.getFirstAvatar()}" />
                                        <div class="product__item__pic set-bg"
                                             data-setbg="${urlAvatarMovie}">
                                            <div class="ep">${movie.currentEpisode}/${movie.totalEpisode}</div>

                                                <%--                                        <div class="rate">--%>
                                                <%--                                                ${movie.getAvgScore()} <i class='fa fa-star'--%>
                                                <%--                                                                          style='color: #f3da35'></i>--%>
                                                <%--                                        </div>--%>
                                                <%--                                        <div class="comment">--%>
                                                <%--                                            <i class="fa fa-comments"></i> ${movie.listComment.size()}--%>
                                                <%--                                        </div>--%>
                                            <div class="view">
                                                <i class="fa fa-eye"></i> ${movie.views}
                                            </div>
                                            <c:if test="${!movie.isFree()}">
                                                <a href="${MovieDetail}?idMovie=${movie.id}">
                                                    <div class="price_film">
                                                            ${movie.price}đ
                                                    </div>
                                                </a>
                                            </c:if>
                                        </div>
                                        <div class="product__item__text">
                                            <ul>
                                                <c:forEach var="genre" items="${movie.genres}">
                                                    <li><fmt:message>${genre.description}</fmt:message></li>
                                                </c:forEach>

                                            </ul>

                                        <h5>
                                            <a href="${MovieDetail}?idMovie=${movie.id}">${movie.name}</a>
                                        </h5>
                                        <h5>${movie.price} đ</h5>
                                    </div>
                                </div>
                                </a>
                            </div>
                        </c:forEach>

                    </div>
                </div>

<%--                <div>--%>
<%--                    <c:url var="changePage" value=""></c:url>--%>
<%--                    <c:forEach var="i" begin="1"--%>
<%--                               end="${listMovie.totalPage(listMovie.listMovie)}">--%>
<%--                        <form action="${changePage}?type=index&&number=${i}"--%>
<%--                              method="post" style="display: inline-block;">--%>




<%--                            <c:if test="${i==offset}">--%>
<%--                                <button name="pageNumber" type="submit" value="${i}"--%>
<%--                                        style="background-color: red;">${i}</button>--%>
<%--                            </c:if>--%>

<%--                            <c:if test="${i!=offset}">--%>
<%--                                <button name="pageNumber" type="submit" value="${i}">${i}</button>--%>
<%--                            </c:if>--%>
<%--                        </form>--%>

<%--                    </c:forEach>--%>
<%--                </div>--%>

            </div>



            <div class="col-md-6">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end mb-0">
                        <li class="page-item disabled"><a class="page-link"
                                                          href="" tabindex="-1"
                                                          aria-disabled="true">Previous</a></li>
                        <c:forEach var="i" begin="1" end="${requestScope.totalMovie}">
                            <c:if test="${i==requestScope.index+1}">
                                <li class="page-item active">
                            </c:if>
                            <c:if test="${i!=requestScope.index+1}">
                                <li class="page-item">
                            </c:if>
                            <a class="page-link" href="${Index}?&&index=${i-1}&&filter=${requestScope.param}">${i}</a>
                            </li>
                        </c:forEach>

                        <li class="page-item"><a class="page-link"
                                                 href="">Next</a></li>
                    </ul>
                </nav>

            </div>
    </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Footer Section Begin -->

</div>

<!-- Footer Section End -->

<!-- Search model Begin -->

<!-- Search model end -->

<!-- Js Plugins -->

<script>
    $(document).ready(function(){
        let selectElement = $('#filter');
        let optionElements = selectElement.find('option');
        optionElements.each(function() {
            let optionValue = $(this).val();

           if(optionValue=="${requestScope.param}"){
               $(this).prop("selected", true);
           }
        });
    })
</script>

</body>

</html>