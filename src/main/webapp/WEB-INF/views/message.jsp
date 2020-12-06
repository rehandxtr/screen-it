<jsp:include page="layout/header.jsp"/>

<%
    if(request.getAttribute("msg")!=null)
    {
%>
<div class="container">
<h2 class="text-success"><%=request.getAttribute("msg")%></h2>
</div>
<%
    }
%>

<jsp:include page="layout/footer.jsp"/>