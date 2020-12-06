<%@ page import="com.screenit.app.repository.UserRepository" %>
<%@ page import="com.screenit.app.model.User" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="display" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="layout/header.jsp"/>
<%--<sec:authorize  access="!isAuthenticated()">

    <%
        response.sendRedirect("/login");
    %>
</sec:authorize>--%>

<%
    UserRepository userRepository= (UserRepository) request.getAttribute("userRepository");
   String user =request.getUserPrincipal().getName();

/*    String user = null;
    if(request.getUserPrincipal().getName() != null) {
        user =request.getUserPrincipal().getName();
    }
    out.print(user);*/

    User mail=userRepository.findByUsername(user);
%>

<h1 class="hero-title-small text-center mt-5 mb-5">Welcome</h1>
<sec:authorize access="hasRole('GUEST')">
<div class="mt-5">
    <h2 class="hero-title-small text-center mt-5 mb-5">Redirecting to Meeting, Please wait.</h2>
<div class="container mt-5 mx-auto w-50 " style="display: none" >
    <h1>Join Room</h1>
    <label for="roomIdd" class="mb-1">screen-it.com/</label>
    <input type="text" class="form-control" id="roomIdd" name="roomId" placeholder="Company Project or other name" value="<%=mail.getMeetingName()%>">
    <button  class="btn" style="width: 100%" <%--onclick="gotoRoom()"--%> id="goTOButton">Go to Room</button>
</div>
    <script>

        window.onload = ()=> {
            location.href = "https://screen-it-git.herokuapp.com/meeting/"+document.getElementById("roomIdd").value;/*roomIdd*/
        }
/*
        function gotoRoom() {
           /!* setInterval(function(){$("#goTOButton").click();}, 1000);*!/
            document.getElementById("goTOButton").onclick = (function () {
                location.href = "http://localhost:8080/meeting/"+document.getElementById("roomIdd").value;/!*roomIdd*!/
            })();
        }
        function automaticClick() {
                /!*(function(){$("#goTOButton").click();}, 1000);*!/
            alert('in automaticClick()');
            document.getElementById("goTOButton").click();

        }*/
    </script>
</div>
</sec:authorize>

<sec:authorize access="hasRole('USER')">
    <div class="mt-5">
    <div class="container mt-5 mx-auto w-50 pb-4" style="background-color: white" >
        <h1>Join Room</h1>
        <label for="roomId" class="mb-1">screen-it.com/</label>
        <input type="text" class="form-control" id="room" name="roomId" placeholder="Company Project or other name">
        <br>
        <button  class="btn" style="width: 100%" onclick="gotoRoom()" id="goButton">Go to Room</button>
    </div>
    <script>
        function gotoRoom() {
            document.getElementById("goButton").onclick = (function () {
                location.href = "https://screen-it-git.herokuapp.com/meeting/"+document.getElementById("room").value;
            })();
        }
    </script>


<div class="mt-5">
    <div class="container mt-5 mx-auto w-50 " style="background-color: white" >
        <div style="padding: 20px 20px 20px 20px;background-color: white;">
            <div id="generateRoom">

<%--                <c:if test="${message == 'Room already exists'}">
                    <div class="text-warning h2" id="">
                       screen-it/1 is already taken
                    </div>
                </c:if>--%>
     <%--           <c:if test="${message != 'Success'}">--%>
                    <form action="/user" method="POST">
                        <input type="hidden" value="<%=request.getUserPrincipal().getName()%> " name="username" readonly>
                        <h2 for="roomID" class="mb-1">Create your Personal Room</h2>
                        <p>This is your personal link for meetings so make sure you like it</p>
                        <div class="form-group">
                            <label for="roomID" class="mb-1">screen-it.com/</label>
                            <input type="text" class="form-control" id="roomID" name="roomId" placeholder="Company Project or other name">
                            <label for="password" class="mb-1">Set password to your meeting</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="meeting password">
                        </div>
                        <br>
                        <button class="btn" style="width: 100%" onclick="newForm()">Create My Room</button>
                    </form>

               <%-- </c:if>--%>
            </div>
<%--        <c:if test="${message == 'Success'}">
              <div>
                    <img src="https://d32wid4gq0d4kh.cloudfront.net/f7ad76d6b57ee68bc1c4e58a42939bd5.svg">
                    <a href="/meeting/${meetingName}" id="link" class="ml-3">${meetingName}</a>
                    <a href="/meeting/${meetingName}" id="linkButton"><button class="btn" style="position: relative; left: 55%">Go to Room</button></a>
              </div>
        </c:if>--%>

        </div>
    </div>
</div>
<img style="position: absolute; bottom: 0;right: 0; transform: scaleX(-1);" srcset="
                            https://d32wid4gq0d4kh.cloudfront.net/3ae33db061ea9ec98e3c2971090e38ad.png 200w,
                            https://d32wid4gq0d4kh.cloudfront.net/2111e487d8ada9da735a4d4e777f0d82.png 399w,
                            https://d32wid4gq0d4kh.cloudfront.net/d529353c79922f2f1586691c3b7b0421.png 600w,
                            https://d32wid4gq0d4kh.cloudfront.net/dc527443e31d23a6e4ae425d519dd017.png 798w,
                            https://d32wid4gq0d4kh.cloudfront.net/14512b76d20c6afbf6b7b25fc644bdfa.png 1197w
                        " sizes="(min-width: 768px) 450px, 200px" src="https://d32wid4gq0d4kh.cloudfront.net/2111e487d8ada9da735a4d4e777f0d82.png">
<%--//join a room--%>

<div class="">
    <jsp:include page="layout/footer.jsp"/>
</div>
</sec:authorize>
<script>

function newForm() {
        document.getElementById("generateRoom").style.display='none';
        document.getElementById("roomLink").style.display='block';
 /*       document.getElementById("link").href="/meeting/"+document.getElementById("roomID").value;
        document.getElementById("linkButton").href="/meeting/"+document.getElementById("roomID").value;
        document.getElementById("link").innerHTML=document.getElementById("roomID").value;*/
    }
</script>

