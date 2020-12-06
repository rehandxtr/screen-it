<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="layout/header.jsp"/>
<h1 class="hero-title-small text-center mt-3 mb-5">Register</h1>

<form action="/register" method="post" class="container mt-5 mx-auto w-50 ">
   <%
       if(request.getAttribute("msg")!=null)
       {
   %>
    <h1 class="text-danger"><%=request.getAttribute("msg")%></h1>
    <%
        }
    %>
    <div class="form-group">
        <label for="name">Name:</label>
        <input type="name" class="form-control" id="name" placeholder="How your name will be displayed" name="name" autocomplete="off"/>
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" placeholder="Enter your password" autocomplete="off" name="password"/>
    </div>
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" class="form-control" id="email" placeholder="work@example.com" name="email"/>
    </div>
    <p class="cen">By signing up you accept our terms and condition
    </p>
    <div class="d-flex justify-content-center">
    <button type="submit" class="btn btn-round-lg">Sign up</button>
    </div>
</form>
<p class="cen">Have an account <a href="/login" style="color: blue">login</a></p>
<img style="position: absolute;right:0; bottom: 0; /*z-index: -1*/" srcset="
                    https://d32wid4gq0d4kh.cloudfront.net/13c3a08ae84a0d733141ac5f0320f460.png 257w,
                    https://d32wid4gq0d4kh.cloudfront.net/b14e8477449861eb2cf7499f00a81ece.png 493w,
                    https://d32wid4gq0d4kh.cloudfront.net/9e94d49f0957c616fee0ff7a86dd4913.png 514w,
                    https://d32wid4gq0d4kh.cloudfront.net/ba386678cb235685f07b71f61943d778.png 986w,
                    https://d32wid4gq0d4kh.cloudfront.net/8c84ab803f5b38ba55089875f4bd2660.png 1479w,
                " sizes="(min-width: 768px) 493px, 257px" src="https://d32wid4gq0d4kh.cloudfront.net/13c3a08ae84a0d733141ac5f0320f460.png" alt="" class="greenPlantImg--1CFUn">
<jsp:include page="layout/footer.jsp"/>

