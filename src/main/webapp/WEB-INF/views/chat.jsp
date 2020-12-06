<jsp:include page="layout/header.jsp"/>
<noscript>
    <h2>Sorry! Your browser doesn't support Javascript</h2>
</noscript>

<div class="row justify-content-center">
    <div class="col-md-5"></div>
    <div class="col-md-4"></div>
    <div id="disp" class="col-md-3" style="display: none">
        <div >
            <div id="username-page">
                <div class="username-page-container">
                    <h1 class="title">Enter a username and room ID</h1>
                    <form id="usernameForm" name="usernameForm">
                        <div class="form-group">
                            <input type="text" id="name" placeholder="Username" autocomplete="off"
                                   class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="text" id="room-id" value="lobby" placeholder="Room ID" autocomplete="off"
                                   class="form-control"/>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="accent username-submit">Start Chatting</button>
                        </div>
                    </form>
                </div>
            </div>

            <div id="chat-page" class="hidden">
                <div class="chat-container">
                    <div class="chat-header" style="background-color: grey">

                        <h2>Chatroom [<span id="room-id-display"></span>]</h2>
                        <button class="close-btn" onclick="myFunction()">&#215;</button>
                    </div>
                    <div class="connecting">
                        Connecting...
                    </div>
                    <ul id="messageArea">

                    </ul>
                    <form id="messageForm" name="messageForm" nameForm="messageForm">
                        <div class="form-group">
                            <div class="input-group clearfix">
                                <input type="text" id="message" placeholder="Type message"
                                       autocomplete="off" class="form-control"/>
                                <button type="submit" class="primary">Send</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function myFunction() {
        var x = document.getElementById("disp");
        if (x.style.display === "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }
</script>

<jsp:include page="layout/footer.jsp"/>



