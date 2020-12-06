<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <div class="d-flex justify-content-center ">Created By: Team name</div>

<%--        <sec:authorize  access="isAuthenticated()">
        <div class="footer">
    <a href="/chat"><button class="btn btn-primary">Go to Chat</button> </a>
    <button class="btn btn-success" onclick="myFunction()">Chat</button>
    <a href="/screen-sharing-room" class ="btn btn-primary">Screen Sharing</a>
    <a href="/video-sharing"> <button class="btn btn-warning">Video Sharing</button> </a>
    <a href="/left"> <button class="btn btn-danger"> Leave</button> </a>
</div>
        </sec:authorize>--%>
<%-- bootstrap --%>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

   <%-- chat script--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.js"></script>
    <%--<script src="chat.js"></script>--%>

  <%--  video-sharing js --%>
    <script src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>

    <c:set var = "contextPath" scope = "request" value = '<%=request.getAttribute("javax.servlet.forward.request_uri")%>'/>
    <c:if test="${fn:contains(contextPath, 'video-sharing') || fn:contains(contextPath, 'meeting') }">
        <script src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
    </c:if>

    <script src="video-sharing.js"></script>
   <%-- <script src="/screen-sharing.js"></script>--%>
    <script src="/iceServer-screen-sharing.js"></script>


