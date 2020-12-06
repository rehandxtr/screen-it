    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
        <jsp:include page="layout/header.jsp"/>

    <%
        if(request.getAttribute("user")!=null)
        {
    %>
        <h1 class="text-danger text-center mt-5 ">change Password</h1 >
        <form method="post" action="success-password" >
            <div class="container">
            <label >enter new password</label>
            <input type="hidden" name="email" value="<%=request.getAttribute("user")%>">
            <input type="password" name="password" >
            <input type="submit">
            </div>
        </form>
    <%
        }
        else {
            request.setAttribute("msg", "Invalid Request");
            response.sendRedirect("error");
        }
    %>

        <jsp:include page="layout/footer.jsp"/>