<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored = "false" %>
<jsp:include page="layout/header.jsp"/>
<sec:authorize  access="isAuthenticated()">
<%
    response.sendRedirect("/user");
%>
</sec:authorize>
<div class="container mt-5 mx-auto w-50 ">
    <%
        if(request.getAttribute("guest")!=null)
        {
          %>
    <form action="/authenticate" method="POST" id="myForm">

        <h1 class="hero-title-small text-center mt-5 mb-5">wait</h1>
<%--        <c:if test="${param.error != null}">
            <div class="text-danger msg" style="font-size: 40px">
                    ${SPRING_SECURITY_LAST_EXCEPTION.message}
            </div>
        </c:if>
        <c:if test="${param.logout != null}">
            <h1 class="text-success">Logout success</h1>
        </c:if>--%>
        <div class="form-group">
<%--
            <label for="email">Email:</label>
--%>
            <%--   <%
                   if(request.getAttribute("guest")!=null)
                   {
               %>--%>
            <input type="hidden" class="form-control" id="email" placeholder="name@email.com" name="username" value="<%=request.getAttribute("mail")%>"/>
        </div>
        <div class="form-group">
<%--
            <label for="password">Password</label>
--%>
            <input type="hidden" class="form-control" placeholder="password" id="password1" autocomplete="off" name="password" value="<%=request.getAttribute("password")%>"/>
        </div>
<%--        <p class="cen">Enter the email you signed up with to receive your login code
        </p>--%>
 <%--       <div class="d-flex justify-content-center">
            <button type="submit" class="btn btn-round-lg">Login</button>
        </div>--%>
<%--
        <a href="/forgot-password" class="text-primary d-flex justify-content-center mt-2">forgot password</a>
--%>
    </form>
    <%--///////////////////////////////////////////--%>
    <%
        }
        else
        {
    %>
<form action="/authenticate" method="POST">

    <h1 class="hero-title-small text-center mt-5 mb-5">Log in</h1>

    <c:if test="${param.error != null}">
        <div class="text-danger msg" style="font-size: 40px">
           ${SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </c:if>
    <c:if test="${param.logout != null}">
            <h1 class="text-success">Logout success</h1>
    </c:if>
    <div class="form-group">
        <label for="email">Email:</label>
     <%--   <%
            if(request.getAttribute("guest")!=null)
            {
        %>--%>
        <input type="email" class="form-control" id="email" placeholder="name@email.com" name="username"/>
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" placeholder="password" id="password" autocomplete="off" name="password"/>
    </div>
    <p class="cen">Enter the email you signed up with to receive your login code
    </p>
    <div class="d-flex justify-content-center">
        <button type="submit" class="btn btn-round-lg">Login</button>
    </div>
    <a href="/forgot-password" class="text-primary d-flex justify-content-center mt-2">forgot password</a>
</form>
    <p class="cen">New to Screen-it <a href="/register" style="color: blue">Sign-up</a></p>
</div>
<img style="position: absolute; bottom: 0" srcset="
                            https://d32wid4gq0d4kh.cloudfront.net/3ae33db061ea9ec98e3c2971090e38ad.png 200w,
                            https://d32wid4gq0d4kh.cloudfront.net/2111e487d8ada9da735a4d4e777f0d82.png 399w,
                            https://d32wid4gq0d4kh.cloudfront.net/d529353c79922f2f1586691c3b7b0421.png 600w,
                            https://d32wid4gq0d4kh.cloudfront.net/dc527443e31d23a6e4ae425d519dd017.png 798w,
                            https://d32wid4gq0d4kh.cloudfront.net/14512b76d20c6afbf6b7b25fc644bdfa.png 1197w
                        " sizes="(min-width: 768px) 450px, 200px" src="https://d32wid4gq0d4kh.cloudfront.net/2111e487d8ada9da735a4d4e777f0d82.png">
<jsp:include page="layout/footer.jsp"/>

<%
    }
%>
<script>
    var auto_refresh = setInterval(function() { submitForm(); }, 1000);

    function submitForm()
    {
        document.getElementById("myForm").submit();
    }
</script>








