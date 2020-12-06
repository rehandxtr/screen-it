<jsp:include page="layout/header.jsp"/>

<%
    String msg;
    if(request.getAttribute("msg")!=null) {
        msg = (String) request.getAttribute("msg");
    }
    else {
        msg="Lost in the Clouds";
    }

%>
<div class="error-image d-flex justify-content-center">
<h1 class="text-danger container align-cent hero-title-small " style="margin-top: 20%"><%=msg%></h1>
</div>
<jsp:include page="layout/footer.jsp"/>
