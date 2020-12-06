<jsp:include page="layout/header.jsp"/>



<%
    if(request.getAttribute("msg")!=null)
    {
%>
<h1 class="text-warning" style="text-align: center"><%=request.getAttribute("msg")%></h1>
<%
    }
%>

<div class="d-flex justify-content-center container mt-5 mx-auto w-50 ">
<form action="/generate" method="post" >
    <label for="name">Enter your name</label><input type="text" id="name" name="name">
    <input type="hidden" name="meetingName" id="meetingName" value="<%=request.getAttribute("roomId")%>">
    <button type="submit">Submit</button>
</form>
</div>
<jsp:include page="layout/footer.jsp"/>
