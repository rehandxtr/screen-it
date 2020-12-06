
<jsp:include page="layout/header.jsp"/>

<form action="screen-sharing" method="GET">
    <label for="roomId">
        <input type="text" id="roomId" name="roomId" required>Room Id
    </label>
    <input type="submit" value="Screen share">
</form>
<jsp:include page="layout/footer.jsp"/>
