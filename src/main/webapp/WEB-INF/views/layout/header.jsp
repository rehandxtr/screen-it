    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
    <link rel="stylesheet" href="/chat.css"/>
    <link rel="stylesheet" href="/video-sharing.css">
        <link rel="stylesheet" href="/main.css">

    <nav class="navbar navbar-expand-lg navbar-light mynav">
    <a class="navbar-brand font-weight-bold" href="/">Screen-it</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse navbar-right" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
    <li class="nav-item ">
    <a class="nav-link" href="/about-us"><button class="my-btn" style="margin: -4px;">About us </button></a>
    </li>
        <sec:authorize  access="!isAuthenticated()">
            <li class="nav-item ">
            <a class="nav-link" href="/login"><button class="my-btn" style="margin: -4px;">Login</button></a>
            </li>
    <li class="nav-item ">
    <a class="nav-link" href="/register"><button class="my-btn" style="margin: -4px;"> Get Started</button></a>
    </li>

    </sec:authorize>
   <%-- <sec:authorize  access="isAuthenticated()">--%>
        <sec:authorize access="hasRole('USER')">
        <li class="nav-item ">
        <a class="nav-link" href="/user"><button class="my-btn" style="margin: -4px;"> Dashboard</button></a>
        </li>

        <li class="nav-item ">
        <a class="nav-link text-danger" href="/logout"><button class="my-btn" style="margin: -4px;">Logout</button></a>
        </li>
        </sec:authorize>
<%--    </sec:authorize>--%>
    </ul>
    </div>
        </nav>
<%--
        rod45707@bcaoo.com--%>
