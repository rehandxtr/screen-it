<html>
    <head>
        <title>ChangingUrl</title>
    </head>
    <script>
        alert(<%=request.getParameter("roomId")%>);
    </script>
    <body>
        <p><a href="/meeting/${roomId}">Change it</a></p>
    </body>
</html>