<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="layout/header.jsp"/>
<body>
<sec:authorize  access="isAuthenticated()">
    <%
        response.sendRedirect("/user");
    %>

</sec:authorize>

<div class="container" >
    <h1 class="hero-title text-center mt-5 mb-5">All in one solution for video-call, Screen share and chat</h1>
    <h2 class="text-center ml-3 mr-3 mb-5 mt-5">Enjoy the freedom to live and work where you thrive with easy video meetings from Screen-it</h2>
    <div class="d-flex justify-content-center mb-5 mt-5">
        <a href="/register"><button type="button" class="btn btn-primary btn-round-lg btn-lg">Get Started</button></a>
    </div>
    <h3 class="sub-heading text-center mb-5 mt-5">Screen-it is a flexible tool providing you with video meetings in the browser - no downloads
        <br><br>Ranked #1 easiest to use by Mountblue.io</h3>
</div>
    <div class="mb-5 mt-5 d-flex justify-content-center"><div class="change-image"></div></div>


<h2 class="sub-heading text-center mb-5 mt-5">Video meetings with your team and clients from wherever you do your work</h2>
<div class="d-flex justify-content-center mb-5 mt-5">
    <a href="/register"><button type="button" class="btn btn-primary btn-round-lg btn-lg">Sign-up</button></a>
</div>
<div class="mb-5 mt-5 d-flex justify-content-center">
    <img srcset="
                    https://d2qulvgqu65efe.cloudfront.net/static/building-plans-410-a9d44567369e047290317a08f73aa5d4.png 410w,
                    https://d2qulvgqu65efe.cloudfront.net/static/building-plans-704-ee7ba20c4d234cf9b0badb34972da07f.png 704w,
                    https://d2qulvgqu65efe.cloudfront.net/static/building-plans-1408-f7e942e0bfa8b3fd35652bd2c760a30b.png 1408w,
                    https://d2qulvgqu65efe.cloudfront.net/static/building-plans-2112-40b83945607599858cd8959c5f4d6933.png 2122w,
                " sizes="(min-width: 1100px) 1099px, 100vw" loading="lazy" src="https://d2qulvgqu65efe.cloudfront.net/static/building-plans-704-ee7ba20c4d234cf9b0badb34972da07f.png">
</div>
</body>

<jsp:include page="layout/footer.jsp"/>



