<jsp:include page="layout/header.jsp"/>


<link rel="stylesheet" href="https://www.webrtc-experiment.com/style.css">
<script>
    document.createElement('article');
    document.createElement('footer');
</script>

<link rel="chrome-webstore-item" href="https://chrome.google.com/webstore/detail/ajhifddimkapgcifgcodmmfdlknahffk">

<!-- scripts used for screen-sharing -->
<script src="iceServer-screen-sharing.js"></script>
<script src="https://www.webrtc-experiment.com/socket.io.js"> </script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<!--    <script src="https://www.webrtc-experiment.com/IceServersHandler.js"></script>-->
<script src="https://www.webrtc-experiment.com/getScreenId.js"> </script>
<script src="https://www.webrtc-experiment.com/CodecsHandler.js"></script>
<script src="https://www.webrtc-experiment.com/BandwidthHandler.js"></script>
<script src="https://www.webrtc-experiment.com/screen.js"> </script>
</head>

<body>
<article>
    <header style="text-align: center;">
        <h1>
            Screen Sharing
        </h1>
    </header>


    <h2 id="number-of-participants" style="display: block;text-align: center;border:0;margin-bottom:0;"></h2>

    <!-- just copy this <section> and next script -->
    <section class="experiment">
        <section class="hide-after-join">
            <input type="text" id="user-name" placeholder="Your Name">
            <button id="share-screen" class="setup">Share Your Screen</button>
        </section>

        <!-- list of all available broadcasting rooms -->
        <table style="width: 100%;" id="rooms-list" class="hide-after-join"></table>

        <!-- local/remote videos container -->
        <div id="videos-container"></div>
    </section>
</article>


<jsp:include page="layout/footer.jsp"/>
