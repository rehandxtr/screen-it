<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Meeting</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
    <link rel="stylesheet" href="/chat.css"/>
    <%--    <script src="/chat.js"> </script>--%>
    <link rel="stylesheet" href="/video-sharing.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="/meeting.js"></script>
<%--    <style>
        html,
        body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        #container {
            min-height: 100%;
            position: relative;
        }

        #header {
            padding: 10px;
            height: 72px;
        }

        #body {
            padding: 10px;
            padding-bottom: 150px; /* Height of the footer */
        }

        #footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 150px; /* Height of the footer */
        }
    </style>--%>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">


    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>
<body style="background-color: white">
<%
    boolean isVerified = false;
%>
<sec:authorize access="hasRole('GUEST')">

    <%
         isVerified=true;
    %>
</sec:authorize>
<div id="container" class="container-fluid" style="margin:0;padding:0;">
    <div id="header">
        <jsp:include page="layout/header.jsp"/>
    </div>
    <style>
        nav ul li.active {
            background-color: inherit;
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<%
        /*if(!request.getAttribute("meetingPassword").equals(""))*/
        if(isVerified||(request.getAttribute("meetingPassword").equals("")&&(request.getAttribute("meetingDetail").equals("Verified"))))
        {
            %>
    <div id="body">
        <div class="row">
            <div id="participants-div" class="sidenav">
                <h3 class="text-center">Participants</h3>
                <div id="videos" class="participant-videos">
                </div>
            </div>
            <div id="screen-div" class="col-12" style="height: 80vh;">
                <div class="row" id="video-share"
                     style="display: flex;flex-direction:column;align-items:center;align-content:center;height: inherit;width: inherit;">
                    <%-- <h3 class="text-center text-white" style="margin-bottom: 1rem;">Video sharing</h3>

                     <button class="text-white btn btn-outline-light" onclick="loadVideoShareScripts()"> Establish
                         connection
                     </button>
                     <label for="roomId">
                         <input type="text" id="roomId" value="${roomId}">
                     </label>
                     <button class="text-white btn btn-outline-light" onclick="getRoomIdAndInitiateVideoCall()">Join
                         room
                     </button>--%>

                    <div class="col-12 main-video" style="height:inherit;display:flex;align-content:center;align-items:center;justify-content:center;">

                    </div>

                </div>

                <div class="row" id="screen-share"
                     style="display: flex;flex-direction:column;align-items:center;align-content:center;margin-top:1rem;">

                    <%--                    <h3 class="text-center text-white">Screen sharing</h3>
                                        <button class="text-white btn btn-outline-light" onclick="loadScripts()"
                                                style="background-color:#006654;"> Establish connection
                                        </button>--%>


<%--                    <h3 class="text-center text-white">Screen sharing</h3>
                    <button class="text-white btn btn-outline-light" onclick="loadScripts()"
                            style="background-color:#006654;"> Establish connection
                    </button>--%>
                    <%-- ORIGINAL AFTER ZOOM BUTTON CLICK
                    <p id="number-of-participants"
                       style="display: block;text-align: center;border:0;margin-bottom:0;color: white;"></p>

                    <!-- just copy this <section> and next script -->
                    <section class="experiment">
                        <section class="hide-after-join" id="extra-screen-share-stuff">
                            <input type="text" id="user-name" placeholder="Your Name" value="<%=request.getUserPrincipal().getName()%> ">

                            <%--                            <button class="text-white btn btn-outline-light setup" style="background-color:#006654;"
                                                                id="share-screen" onclick="loadScripts()">Share Your Screen
                                                        </button>--%>

<%--//Commented from                            <button class="text-white btn btn-outline-light setup" style="background-color:#006654;"
                                    id="share-screen" onclick="loadScripts()">Share Your Screen
                            </button> till here//

                        </section>
                        <button class="text-white btn btn-outline-light setup hide-after-join" style="background-color:#006654;"
                                id="share-screen" onclick="initiateScreenSharing()">Share Your Screen
                        </button>
                        <table style="width: 100%;color: white" id="rooms-list" class="hide-after-join"></table>
                    </section>

                    <div id="videos-container" class="col-12 main-video" style="height:inherit;">

                    </div>
                    --%>
                        <style>
                            .customButton{
                                background-color: #F8DBD5;
                            }
                        </style>
                    <link rel="stylesheet" href="/screen-sharing/getHTMLMediaElement.css">
                    <script src="/screen-sharing/menu.js"></script>
                    <div>
                        <input type="hidden" id="logged-in-username" value="<%=request.getUserPrincipal().getName()%>">
                        <input type="hidden" id="room-id" value="<%=request.getAttribute("meetingName")%>"  disabled autocorrect=off autocapitalize=off size=20>
                        <button class="customButton" id="open-room">Start sharing</button>
                        <button class="customButton" id="join-room">Join shared window</button>
                        <button class="customButton" id="pause-sharing" style="display: none;">Pause sharing</button>
                        <button class="customButton" id="stop-sharing" style="display: none;">Stop sharing</button>
                    </div>
                    <div id="videos-container" style="margin: 20px 0;">

                    </div>


                    <script src="/screen-sharing/RTCMultiConnection.js"></script>
                    <script src="/screen-sharing/adapter.js"></script>
                    <script src="/screen-sharing/socketio.js"></script>
                    <link rel="stylesheet" href="/screen-sharing/getHTMLMediaElement.css">
                    <script src="/screen-sharing/getHTMLMediaElement.js"></script>
                    <script src="/screen-sharing/screen-sharing.js"></script>

                    <script src="https://www.webrtc-experiment.com/common.js"></script>
                </div>
            </div>

            <div id="chatting" class="sidenav">
                <div class="justify-content-center">
                    <div id="disp">
                        <div id="username-page">
                            <div class="username-page-container">
                                <h6 class="title">Enter a username and room ID</h6>
                                <form id="usernameForm" name="usernameForm">
                                    <div class="form-group">
                                        <input type="text" id="name" placeholder="Username" value="<%=request.getUserPrincipal().getName()%> " autocomplete="off"
                                               class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" id="chat-room-id" value="${meetingName}" placeholder="Room ID"
                                               autocomplete="off"
                                               class="form-control"/>${meetingName}
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" style="background-color: #006654;"
                                                class="accent username-submit">Start Chatting
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div id="chat-page">
                            <div class="chat-container">
                                <div class="chat-header" style="background-color:#F8DBD5;color: black">
                                    <h2>Chat</h2>
                                    <%--<button onclick="myFunction()" class="close-btn text-white"
                                            style="background-color:#002921;">&#215;
                                    </button>--%>
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
                                            <button type="submit" style="background-color:#F8DBD5;color: black" class="primary">
                                                Send
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--
    <sec:authorize  access="isAuthenticated()">
    --%>

    <style>
        .modalBtnBg {
            background-color: #ffcdd2;
            color: black;
        }
    </style>

    <div id="footer" style="display: flex;justify-content: center" >
        <%--        <div class="buttonCenterWrapper-3COV"><button class="button-20jP jstest-toggle-video"><figure class="buttonFigure-2JAN"><div class="jstest-button-icon-wrapper buttonIconWrapper-1-pZ"><svg width="100%" height="100%" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="BaseIcon-nykw BaseIcon--light-32mi BaseIcon--sized-2HpV"><path clip-rule="evenodd" d="m11.4422 4h-4.88435-.00002c-.94429-.00001-1.71353-.00002-2.33805.05101-.64548.05273-1.22392.16492-1.76274.43946-.84673.43143-1.535138 1.11984-1.966568 1.96657-.27454.53882-.386728 1.11726-.4394654 1.76274-.05102602.62452-.05101716 1.39376-.05100628 2.33802v.0001 2.8843c-.00001088.9443-.00001974 1.7135.05100628 2.338.0527374.6455.1649254 1.2239.4394654 1.7628.43143.8467 1.119838 1.5351 1.966568 1.9665.53882.2746 1.11726.3868 1.76274.4395.62451.051 1.39372.051 2.33798.051h.00012 4.88422.0001c.9443 0 1.7135 0 2.338-.051.6455-.0527 1.2239-.1649 1.7628-.4395.8467-.4314 1.5351-1.1198 1.9665-1.9665.2746-.5389.3868-1.1173.4395-1.7628.0026-.032.0051-.0643.0074-.0971l4.4624 3.1874c.6618.4728 1.5812-.0003 1.5812-.8137v-12.11363c0-.81337-.9194-1.2865-1.5812-.81373l-4.4624 3.18737c-.0023-.03272-.0048-.06507-.0074-.09703-.0527-.64548-.1649-1.22392-.4395-1.76274-.4314-.84673-1.1198-1.53514-1.9665-1.96657-.5389-.27454-1.1173-.38673-1.7628-.43946-.6245-.05103-1.3937-.05102-2.338-.05101zm-8.07718 2.27248c.20988-.10693.49583-.18548 1.01762-.22812.53347-.04358 1.22077-.04436 2.21736-.04436h4.8c.9966 0 1.6839.00078 2.2174.04436.5218.04264.8077.12119 1.0176.22812.4704.23969.8528.62214 1.0925 1.09254.107.20988.1855.49583.2281 1.01762.0436.53347.0444 1.22077.0444 2.21736v2.8c0 .9966-.0008 1.6839-.0444 2.2174-.0426.5218-.1211.8077-.2281 1.0176-.2397.4704-.6221.8528-1.0925 1.0925-.2099.107-.4958.1855-1.0176.2281-.5335.0436-1.2208.0444-2.2174.0444h-4.8c-.99659 0-1.68389-.0008-2.21736-.0444-.52179-.0426-.80774-.1211-1.01762-.2281-.4704-.2397-.85285-.6221-1.09254-1.0925-.10693-.2099-.18548-.4958-.22812-1.0176-.04358-.5335-.04436-1.2208-.04436-2.2174v-2.8c0-.99659.00078-1.68389.04436-2.21736.04264-.52179.12119-.80774.22812-1.01762.23969-.4704.62214-.85285 1.09254-1.09254z" fill-rule="evenodd"></path></svg></div><figcaption class="buttonLegend-D6Xt">Cam</figcaption></figure></button><button class="button-20jP jstest-mute-button"><figure class="buttonFigure-2JAN"><div class="buttonIconWrapper-1-pZ"><svg width="100%" height="100%" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="BaseIcon-nykw BaseIcon--light-32mi BaseIcon--sized-2HpV"><path clip-rule="evenodd" d="m8 13c0 1.1046.89543 2 2 2h4c1.1046 0 2-.8954 2-2v-8c0-2.20914-1.7909-4-4-4-2.20914 0-4 1.79086-4 4zm-3-3.5c.55228 0 1 .44771 1 1v3.5c0 1.6569 1.34315 3 3 3h3 3c1.6569 0 3-1.3431 3-3v-3.5c0-.55229.4477-1 1-1s1 .44771 1 1v3.5c0 2.7614-2.2386 5-5 5h-2v3c0 .5523-.4477 1-1 1s-1-.4477-1-1v-3h-2c-2.76142 0-5-2.2386-5-5v-3.5c0-.55229.44772-1 1-1z" fill-rule="evenodd"></path></svg></div><figcaption class="buttonLegend-D6Xt">Mic</figcaption></figure></button><button class="jstest-share-screen-button button-20jP" accesskey="s"><figure class="buttonFigure-2JAN"><div class="buttonIconWrapper-1-pZ"><svg width="100%" height="100%" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="BaseIcon-nykw BaseIcon--sized-2HpV BaseIcon--light-32mi"><path clip-rule="evenodd" d="m16.4422 2h-8.88435-.00002c-.94429-.00001-1.71352-.00002-2.33805.05101-.64548.05273-1.22392.16492-1.76274.43946-.84673.43143-1.53514 1.11984-1.96657 1.96657-.27454.53882-.38673 1.11726-.43946 1.76274-.051029.62452-.051021 1.39376-.05101 2.33805v.00002 2.88435c-.000011.9443-.000019 1.7135.05101 2.338.05273.6455.16492 1.2239.43946 1.7628.43143.8467 1.11984 1.5351 1.96657 1.9665.53882.2746 1.11726.3868 1.76274.4395.62451.051 1.39372.051 2.33798.051h.00012 1.64212l-2.29017 2.8627c-.36666.4583-.04034 1.1373.54661 1.1373h9.08716c.5869 0 .9132-.679.5466-1.1373l-2.2902-2.8627h1.6421.0001c.9443 0 1.7135 0 2.338-.051.6455-.0527 1.2239-.1649 1.7628-.4395.8467-.4314 1.5351-1.1198 1.9665-1.9665.2746-.5389.3868-1.1173.4395-1.7628.051-.6245.051-1.3937.051-2.338v-2.88437c0-.94429 0-1.71353-.051-2.33805-.0527-.64548-.1649-1.22392-.4395-1.76274-.4314-.84673-1.1198-1.53514-1.9665-1.96657-.5389-.27454-1.1173-.38673-1.7628-.43946-.6245-.05103-1.3937-.05102-2.338-.05101zm-12.07718 2.27248c.20988-.10693.49583-.18548 1.01762-.22812.53347-.04358 1.22077-.04436 2.21736-.04436h8.8c.9966 0 1.6839.00078 2.2174.04436.5218.04264.8077.12119 1.0176.22812.4704.23969.8528.62214 1.0925 1.09254.107.20988.1855.49583.2281 1.01762.0436.53347.0444 1.22077.0444 2.21736v2.8c0 .9966-.0008 1.6839-.0444 2.2174-.0426.5218-.1211.8077-.2281 1.0176-.2397.4704-.6221.8528-1.0925 1.0925-.2099.107-.4958.1855-1.0176.2281-.5335.0436-1.2208.0444-2.2174.0444h-8.8c-.99659 0-1.68389-.0008-2.21736-.0444-.52179-.0426-.80774-.1211-1.01762-.2281-.4704-.2397-.85285-.6221-1.09254-1.0925-.10693-.2099-.18548-.4958-.22812-1.0176-.04358-.5335-.04436-1.2208-.04436-2.2174v-2.8c0-.99659.00078-1.68389.04436-2.21736.04264-.52179.12119-.80774.22812-1.01762.23969-.4704.62214-.85285 1.09254-1.09254z" fill-rule="evenodd"></path></svg></div><figcaption class="buttonLegend-D6Xt">Share</figcaption></figure></button><button class="jstest-open-chat-button button-20jP"><figure class="buttonFigure-2JAN"><div class="buttonIconWrapper-1-pZ"><svg width="100%" height="100%" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="BaseIcon-nykw BaseIcon--sized-2HpV BaseIcon--light-32mi"><path clip-rule="evenodd" d="m14.6649 1.00001-.1649.00002h-4.99997l-.16486-.00002c-1.702-.000213-2.74433-.000346-3.63001.21795-2.7067.66715-4.820053 2.7805-5.487196 5.4872-.21829784.88568-.21816623 1.92802-.2179507 3.63004l.00001526.1648-.00001526.1649c-.00021553 1.702-.00034714 2.7443.2179507 3.63.667143 2.7067 2.780496 4.82 5.487196 5.4872.88568.2183 1.92802.2182 3.63002.2179h.16485 2.83337l4.6667 3.5c.824.618 2 .0301 2-1v-2.9288c2.3648-.8356 4.174-2.8095 4.782-5.2763.2183-.8857.2182-1.928.2179-3.63v-.1649-.1648c.0003-1.70203.0004-2.74436-.2179-3.63004-.6671-2.7067-2.7805-4.82005-5.4872-5.4872-.8857-.218296-1.928-.218163-3.63-.21795zm-.1649 2.00002c1.9188 0 2.6976.00732 3.3163.15982 1.9849.48924 3.5347 2.03903 4.0239 4.02394.1525.6187.1598 1.39746.1598 3.31621 0 1.9188-.0073 2.6976-.1598 3.3163-.4892 1.9849-2.039 3.5347-4.0239 4.0239-.6187.1525-1.3975.1598-3.3163.1598h-4.99997c-1.91878 0-2.69754-.0073-3.31624-.1598-1.98491-.4892-3.5347-2.039-4.02394-4.0239-.1525-.6187-.15982-1.3975-.15982-3.3163 0-1.91875.00732-2.69751.15982-3.31621.48924-1.98491 2.03903-3.5347 4.02394-4.02394.6187-.1525 1.39746-.15982 3.31624-.15982zm-5.10307 6.55746c-.24452-.49521-.84418-.69844-1.33939-.45392-.4952.24452-.69843.84418-.45391 1.33943.41247.8353 1.05013 1.5388 1.84107 2.0311.7909.4924 1.7037.7539 2.6353.7552.9317.0012 1.8452-.2578 2.6374-.7479.7923-.4902 1.4319-1.192 1.8467-2.0262.2458-.49452.0443-1.09474-.4503-1.34061-.4945-.24587-1.0947-.04429-1.3406.45025-.2489.50056-.6326.92156-1.108 1.21566-.4753.2941-1.0234.4495-1.5824.4488-.559-.0008-1.1067-.1577-1.5812-.4531-.4746-.2954-.85719-.7175-1.10467-1.21871z" fill-rule="evenodd"></path></svg></div><figcaption class="buttonLegend-D6Xt">Chat</figcaption></figure></button><button class="jstest-open-people-button button-20jP"><figure class="buttonFigure-2JAN"><div class="buttonIconWrapper-1-pZ"><svg width="100%" height="100%" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="BaseIcon-nykw BaseIcon--sized-2HpV BaseIcon--light-32mi"><path clip-rule="evenodd" d="m12 6c0 2.20914-1.7909 4-4 4-2.20914 0-4-1.79086-4-4s1.79086-4 4-4c2.2091 0 4 1.79086 4 4zm7.225 6.0256c-.5381-.1243-1.0751.2112-1.1994.7493s.2112 1.0751.7493 1.1994c.6772.1565 1.4162.7032 2.0375 1.7541.6168 1.0432 1.0713 2.5154 1.1897 4.3364.0358.5512.5116.9689 1.0627.9331.5512-.0358.9689-.5117.9331-1.0628-.1343-2.0667-.6559-3.858-1.4639-5.2246-.8035-1.3589-1.9382-2.3682-3.309-2.6849zm-17.24064 8.1502c.37181-2.0824 1.09454-3.6228 2.08008-4.6328.96418-.9881 2.2508-1.543 3.93549-1.543 2.93157 0 5.62997 2.2946 6.00477 6.0981.0542.5496.5437.9512 1.0933.8971.5496-.0542.9513-.5437.8971-1.0933-.4641-4.7095-3.921-7.9019-7.99517-7.9019-2.17339 0-3.99266.7379-5.36692 2.1462-1.35289 1.3865-2.201126 3.346-2.6175149 5.678-.0970775.5437.2649699 1.0632.8086559 1.1602.543689.0971 1.063129-.2649 1.160209-.8086zm15.01564-11.1758c1.6569 0 3-1.34315 3-3s-1.3431-3-3-3-3 1.34315-3 3 1.3431 3 3 3z" fill-rule="evenodd"></path></svg></div><figcaption class="buttonLegend-D6Xt">People</figcaption></figure></button><button class="jstest-leave-room-button button-20jP"><figure class="buttonFigure-2JAN"><div class="buttonIconWrapper-1-pZ"><svg width="100%" height="100%" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="BaseIcon-nykw BaseIcon--sized-2HpV BaseIcon--meetingRed-3dxB"><path clip-rule="evenodd" d="m17.9101 6.59611c-.0247-.33383-.0916-2.08992 1.2366-2.08992 1.4268 0 1.87 1.79068 1.8936 1.89027l.0021.00928c.0786.36578.1552.71979.2295 1.06277 1.5223 7.02979 2.0416 9.42819-2.1252 13.59499-4.3668 4.3668-11.17718 1.0918-17.08286-4.807-.01142-.0114-.02279-.0223-.03454-.0333-.17816-.1679-1.651682-1.61-.72652-2.5351.98353-.9836 2.63107.664 2.63107.664l1.76846 1.7684c.2721.2721.71326.2721.98535 0 .2721-.2721.2721-.7132 0-.9853l-4.49619-4.4963c-.0064-.0064-.01197-.0121-.01807-.0188-.10483-.1149-1.1329-1.28563-.30366-2.11491.87286-.87289 2.09098.3452 2.09102.34524l4.02075 4.02077c.27151.2715.71172.2715.98322 0 .27151-.2715.27151-.7117.00001-.9832l-5.72882-5.72898c-.02271-.02271-.0462-.04398-.07005-.0655-.21048-.18988-1.24151-1.20799-.29439-2.1551.9428-.94281 1.94711.08338 2.14183.30209.02326.02613.04613.0516.07087.07634l5.46322 5.46317c.2837.28368.7437.28368 1.0274 0 .2837-.28371.2837-.74369 0-1.02741l-4.29008-4.29007c-.02347-.02347-.04761-.04527-.07235-.0674-.20963-.18753-1.20576-1.16121-.34132-2.02562.96128-.96124 2.17921.25659 2.17943.25681l.00001.00001 7.09461 7.09461c.6196.61965 1.6797.19919 1.7054-.67679.03-1.02642.0594-2.06518.0638-2.34063.0006-.03652-.0015-.07099-.0042-.10742zm-1.7613 5.81959c.2202-.1667.2635-.4803.0968-.7004-.1667-.2202-.4803-.2635-.7005-.0968-1.7516 1.3265-3.116 4.2243-1.8491 7.7871.0925.2602.3784.3962.6386.3036.2602-.0925.3961-.3784.3036-.6386-1.1199-3.1495.1045-5.5901 1.5106-6.6549z" fill-rule="evenodd"></path></svg></div><figcaption class="buttonLegend-D6Xt">Leave</figcaption></figure></button></div>--%>
            <div id="invite-link-div" <%--style="display: none;"--%> class="modal">
                <div class="modal-content">
                    <input type="text" id="invite-link-input" readonly value>
                    <button class="modalBtnBg"  onclick="showInviteLink('${meetingUUID}','${meetingName}')" style="border-bottom: 1px solid white">Generate invite link</button>

                    <button  class="modalBtnBg" onclick="copyInviteLink()">Copy invite link </button>
                </div>
            </div>
            <!-- Modal Trigger -->
            <%--<a class="waves-effect waves-light btn" href="#modal1">Modal</a>--%>

            <button data-target="modal1" style="background-color: #fce4ec;color: black" class="show-on-small btn-large modal-trigger">Options</button>

            <!-- Modal Structure -->
            <div id="modal1" class="modal bottom-sheet ">
                <div class="modal-content ">
                    <h3 class="text-center"> Features </h3>

                    <button onclick="setupVideoSharing(`${meetingName}`)" id="show-video-share" class="btn modalBtnBg waves-effect">
                        Video call
                    </button>

                    <button id="show-screen-share" class="btn modalBtnBg" onclick="setupScreenSharing()">
                        Screen share
                    </button>

                    <button id="show-chat-sidenav" onclick="myFunction()" data-target="chatting" class="btn sidenav-trigger modalBtnBg show-on-medium-and-up">
                        Chat
                    </button>

                    <button class="btn modalBtnBg" id="pause-button" onclick="pauseVideo()">
                        Pause video sharing
                    </button>

                    <button class="btn modalBtnBg" id="stop-videosharing-button" onclick="stopVideoSharing()">
                        Stop video sharing
                    </button>

                    <button id="show-participants-sidenav" data-target="participants-div" class="btn modalBtnBg sidenav-trigger show-on-medium-and-up">
                        Show participants
                    </button>

                    <button class="btn modal-trigger modalBtnBg" data-target="invite-link-div" id="invite-link-button" <%--onclick="showInviteLink('${meetingUUID}','${meetingName}')"--%>>
                        Invite link
                    </button>

                    <button class="btn modalBtnBg" id="leave-meeting-button"  onclick="leaveMeeting()">
                        Leave meeting
                    </button>

                </div>
                <%--<div class="modal-footer">
&lt;%&ndash;                    <a href="" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>&ndash;%&gt;
                </div>--%>
            </div>

          <%--  <div class="row" class="action-buttons" style="justify-content: center;height: 10vh;">
            <div style="background-color: #002921;margin-right: 1rem;border-radius:15px;">
                <button class="btn" style="display: flex;flex-direction: column;" onclick="showHideParticipants()">
                    <img src="https://img.icons8.com/wired/64/000000/conference-call.png"
                         style="background-color:white;border:1px solid inherit;border-radius:20px;padding:0.6rem;">
                    <span class="text-white">Participants</span>
                </button>
            </div>
            <div style="background-color: #002921;margin-right: 1rem;border-radius:15px;">
                <button onclick="setupVideoSharing(`${roomId}`)" id="show-video-share" class="btn" style="display: flex;flex-direction: column;">
                    <img src="https://img.icons8.com/wired/64/000000/video-call.png"
                         style="background-color:white;border:1px solid inherit;border-radius:20px;padding:0.6rem;">
                    <span class="text-white">Cam</span>
                </button>
            </div>
            <div style="background-color: #002921;margin-right: 1rem;border-radius:15px;">
                <button id="show-screen-share" class="btn" style="display: flex;flex-direction: column;">
                    <img onclick="setupScreenSharing()" src="https://img.icons8.com/carbon-copy/64/000000/monitor.png"
                         style="background-color:white;border:1px solid inherit;border-radius:20px;padding:0.6rem;">
                    <span class="text-white">Screen</span>
                </button>
            </div>
            <div style="background-color: #002921;margin-right: 1rem;border-radius:15px;">
                <button class="btn" style="display: flex;flex-direction: column;" onclick="myFunction()">
                    <img src="https://img.icons8.com/carbon-copy/64/000000/chat.png"
                         style="background-color:white;border:1px solid inherit;border-radius:20px;padding:0.6rem;">
                    <span class="text-white">Chat</span>
                </button>
            </div>

            <div style="background-color: #002921;margin-right: 1rem;border-radius:15px;">
                <button class="btn" id="pause-button" style="display: flex;flex-direction: column;" onclick="pauseVideo()">
                    <img id="pause-button-img" src="https://img.icons8.com/wired/64/000000/no-video.png"
                         style="background-color:white;border:1px solid inherit;border-radius:20px;padding:0.6rem;">
                    <span id="pause-button-span" class="text-white">Pause Video</span>
                </button>
            </div>

            <div style="background-color: #002921;margin-right: 1rem;border-radius:15px;">
                <button class="btn" id="stop-videosharing-button" style="display: flex;flex-direction: column;" onclick="stopVideoSharing()">
                    <img src="https://img.icons8.com/wired/64/000000/exit.png"
                         style="background-color:white;border:1px solid inherit;border-radius:20px;padding:0.6rem;">
                    <span class="text-white">Stop Video sharing</span>
                </button>
            </div>

            &lt;%&ndash;<div style="background-color: #002921;margin-right: 1rem;border-radius:15px;">
                <button class="btn" id="pause-share-button" style="display: flex;flex-direction: column;" onclick="pauseScreenShare()">
                    <img src="https://img.icons8.com/wired/64/000000/no-video.png"
                         style="background-color:white;border:1px solid inherit;border-radius:20px;padding:0.6rem;">
                    <span class="text-white">Pause sharing</span>
                </button>
            </div>&ndash;%&gt;

       &lt;%&ndash;     <div style="background-color: #002921;margin-right: 1rem;border-radius:15px;">
                <button class="btn" id="stop-share-button" style="display: flex;flex-direction: column;" onclick="stopScreenShare()">
                    <img src="https://img.icons8.com/wired/64/000000/no-video.png"
                         style="background-color:white;border:1px solid inherit;border-radius:20px;padding:0.6rem;">
                    <span class="text-white">Stop sharing</span>
                </button>
            </div>&ndash;%&gt;
            <div style="background-color: #002921;margin-right: 1rem;border-radius:15px;">
                <button class="btn" id="leave-meeting-button" style="display: flex;flex-direction: column;" onclick="leaveMeeting()">
                    <img src="https://img.icons8.com/wired/64/000000/exit.png"
                         style="background-color:white;border:1px solid inherit;border-radius:20px;padding:0.6rem;">
                    <span class="text-white">Leave meeting</span>
                </button>
            </div>

            <div style="background-color: #002921;margin-right: 1rem;border-radius:15px;">
                <button class="btn" id="invite-link-button" style="display: flex;flex-direction: column;" onclick="showInviteLink('${meetingUUID}','${meetingName}')">
                    <img src="https://img.icons8.com/wired/64/000000/invite.png"
                    style="background-color:white;border:1px solid inherit;border-radius:20px;padding:0.6rem;">
                    <span class="text-white">Invite link</span>
                </button>
            </div>

        </div>--%>
    </div>
    <%--
        </sec:authorize>
    --%>
    <%--    <jsp:include page="layout/footer.jsp"/>--%>

    <script>
/*        window.onload = () => {
            document.getElementById('invite-link-button').onclick = () => {
                showInviteLink('${meetingUUID}','${meetingName}');
            }
        };*/
        $('.modal').modal({
                dismissible: true, // Modal can be dismissed by clicking outside of the modal
                opacity: .5, // Opacity of modal background
                inDuration: 300, // Transition in duration
                outDuration: 200, // Transition out duration
                startingTop: '4%', // Starting top style attribute
                endingTop: '10%', // Ending top style attribute
                ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
                    //  alert("Ready");
                    console.log(modal, trigger);
                },
                complete: function() { //alert('Closed');
                } // Callback for Modal close
            }
        );

        $(document).ready(function(){

            $('#participants-div').sidenav({ edge: 'left' });

            $('#chatting').sidenav({edge:'right'});

        /*    $('#invite-link-button').leanModal({
                dismissible: false
            });*/
            /*$('#invite-link-div').closeModal({ dismissible: true});*/
            /*$('#invite-link-div').modal('close');*/

            // $('#invite-link-div').Modal({ dismissible: false});
        });



    </script>

    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.3/js/materialize.min.js"></script>
    --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <%-- chat script--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.js"></script>
    <script src="/chat.js"></script>

    <%
        }
/*
        else if(isVerified||(request.getAttribute("meetingPassword").equals("")&&(request.getAttribute("meetingDetail").equals("Verified"))))
*/
else if(!request.getAttribute("meetingPassword").equals(""))
            {
        %>
   <%-- <h1>hello</h1>--%>
    <div class="d-flex justify-content-center container mt-5 mx-auto w-50 ">

    <form method="post" action="/meeting/<%=request.getAttribute("meetingName")%>">
        <label for="password">Password</label><input type="password" name="password" id="password">
        <button type="submit">submit</button>
    </form>
    </div>

<%--%>--%>
    <%--<script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">

    </script>--%>
    <script>
        setInterval(()=> {
            // alert(`In set interval`);
            (function () {
                var ids = {};
                var found = false;
                $('[id]').each(function() {
                    if (this.id && ids[this.id]) {
                        found = true;
                        <%--alert(`found duplicate ids with id = ${this.id}, ids[] = ${ids[this.id]}`);--%>
                        <%--console.log(`REMOVING ID : ${this.id}, ids[] : ${this.id}`);--%>
                        console.log('hello');
                        this.parentNode.removeChild(this);
                        console.warn('Duplicate ID #'+this.id);
                    }
                    ids[this.id] = 1;
                });
                if (!found) console.log('No duplicate IDs found');
            })();
        },2000);
    </script>
</body>
</html>
<%
    }
        else
    {
        response.sendRedirect("error");
    }
%>

