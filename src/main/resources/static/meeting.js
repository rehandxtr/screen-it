window.onload = () => {
    let videoShareDiv = document.getElementById('video-share');
    // videoShareDiv.style.display = 'none';

    let screenShareDiv = document.getElementById('screen-share');
    screenShareDiv.style.display = 'none';

/*
    let participantsDiv = document.getElementById("participants-div");
    participantsDiv.style.display = 'none';
*/

/*
    let screenDiv = document.getElementById("screen-div");
    screenDiv.style.display = 'none';
*/

    let videoShareButton = document.getElementById('show-video-share');
    let screenShareButton = document.getElementById('show-screen-share');

/*    videoShareButton.onclick = () => {
        // screenDiv.style.display = 'flex';
        loadVideoShareScripts();
        getRoomIdAndInitiateVideoCall();
        videoShareDiv.style.display = 'flex';
        screenShareDiv.style.display = 'none';

    };
    */

/*    screenShareButton.onclick = () => {
        screenShareDiv.style.display = 'flex';
        videoShareDiv.style.display = 'none';
    }*/

};
let isButtonClicked = false;
function setupVideoSharing(roomId) {
    let mainVideoDiv = document.querySelector('.main-video');
    if(mainVideoDiv.childNodes.length < 2) {
        if(!isButtonClicked) {
            console.log(`button clicked loading scripts`);
            isButtonClicked = true;
            loadVideoShareScripts();
            setTimeout(() => {
                getRoomIdAndInitiateVideoCall(roomId);
                console.log("in set timout");
            }, 2000);
        }
    }
    if(!isButtonClicked) {
        if (mainVideoDiv.childNodes.length === 2) {
            getRoomIdAndInitiateVideoCall(roomId);
        }
    }

    let videoShareDiv = document.getElementById('video-share');
    let screenShareDiv = document.getElementById('screen-share');
    videoShareDiv.style.display = 'flex';
    screenShareDiv.style.display = 'none';

}

function setupScreenSharing() {

/*    let screenSharingInfo = document.getElementById('extra-screen-share-stuff');
    screenSharingInfo.style.display = 'none';*/

/* COMMENTED TO TEST NEW SCREEN-SHARE
   let screenShareVideosDiv = document.getElementById('videos-container');
    if(screenShareVideosDiv.childNodes.length < 2 ) {
        loadScripts();
    }*/

    let screenShareDiv = document.getElementById('screen-share');
    let videoShareDiv = document.getElementById('video-share');

    screenShareDiv.style.display = 'flex';
    videoShareDiv.style.display = 'none';

}


function loadVideoShareScripts(){
/*    alert('loading videoShareScripts');*/
   let scripts =  ["https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js",
                    "https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js",
                    "/video-sharing.js"];

    scripts.map((script)=>{
        let currentScript = document.createElement('script');
        currentScript.src = script;
        document.body.appendChild(currentScript);
    });

}

function loadScripts(){
    var scripts = [/*"https://webrtc.github.io/adapter/adapter-latest.js",*/
        "https://www.webrtc-experiment.com/getScreenId.js",
                    "/adapter.js",
                        "https://www.webrtc-experiment.com/socket.io.js",
                    "/iceServer-screen-sharing.js",
                    "https://www.webrtc-experiment.com/CodecsHandler.js",
                    "https://www.webrtc-experiment.com/BandwidthHandler.js",
                    "/screen.js"
                    /*"https://www.webrtc-experiment.com/screen.js"*/];

    scripts.map((script)=>{
        let currentScript = document.createElement('script');
        currentScript.src = script;
        /*setTimeout(()=>{*/
            document.head.appendChild(currentScript);
        /*});*/
    });

    loadScreenShareScript();
/*    setTimeout(()=>{
        loadScreenShareScript();
    },2000);*/
/*    setTimeout(()=>{
        initiateScreenSharing();
    },2200);*/
}


function loadScreenShareScript(){
    setTimeout(() => {
        let script = document.createElement('script');
        script.src = "/screen-sharing.js";
        document.body.appendChild(script);
    },1000);
}

let isFirstTimeConnection = false;
function myFunction() {
    var chatDiv = document.getElementById("disp");
    let screenDiv = document.getElementById("screen-div");
    // let chatContainer = document.getElementById('chat-container');

    /*if (chatDiv.style.display === "none") {
        if(screenDiv.classList.contains("col-12")){
            screenDiv.classList.remove("col-12");
            screenDiv.classList.add("col-9");
        }
        else {
            screenDiv.classList.remove("col-9");
            screenDiv.classList.add("col-6");
        }
        chatDiv.style.display = "block";

    } else {
        chatDiv.style.display = "none";
        if(screenDiv.classList.contains("col-9")){
            screenDiv.classList.remove("col-9");
            screenDiv.classList.add("col-12");
        }
        else {
            screenDiv.classList.remove("col-6");
            screenDiv.classList.add("col-9");
        }
    }
*/
    // if(document.getElementById('messageArea').childNodes.length === 2) {
    // chatContainer.style.height = innerHeight - 50+'px';

    console.log("CONNECTING CHAT");
        connect();
    // }
    isFirstTimeConnection = true;
}

function showHideParticipants(){
    let participantsDiv = document.getElementById("participants-div");
    let screenDiv = document.getElementById("screen-div");
    if(participantsDiv.style.display === "none") {
        if(screenDiv.classList.contains("col-12")){
            screenDiv.classList.remove("col-12");
            screenDiv.classList.add("col-9");
        }
        else {
            screenDiv.classList.remove("col-9");
            screenDiv.classList.add("col-6");
        }
        participantsDiv.style.display = "block";
    }
    else{
        participantsDiv.style.display = "none";
        if(screenDiv.classList.contains("col-9")){
            screenDiv.classList.remove("col-9");
            screenDiv.classList.add("col-12");
        }
        else {
            screenDiv.classList.remove("col-6");
            screenDiv.classList.add("col-9");
        }
    }
}


function pauseScreenShare() {
    let screenElement = document.getElementById('self');
    screenElement.srcObject.getTracks().forEach(t => t.enabled = !t.enabled);
}
window.addEventListener('beforeunload', function() {
    leaveRoom();
}, false);

window.addEventListener('keyup', function(e) {
    if (e.keyCode == 116) {
        leaveRoom();
    }
}, false);
/*
function leaveRoom() {
    signaler.signal({
        leaving: true
    });

    // stop broadcasting room
    if (signaler.isbroadcaster) signaler.stopBroadcasting = true;

    // leave user media resources
    if (root.stream) {
        if('stop' in root.stream) {
            root.stream.stop();
        }
        else {
            root.stream.getTracks().forEach(function(track) {
                track.stop();
            });
        }
    }

    // if firebase; remove data from their servers
    if (window.Firebase) socket.remove();
}*/

/*
* SENDING MESSAGE : {"roomid":"httplocalhost8080meetingvv","broadcasting":true,"userid":"barjinder "}
* */


function stopScreenShare() {
    // leaveRoom();
    let participants = document.getElementById('number-of-participants');
    if(participants) {
        participants.parentNode.removeChild(participants);
    }

    /*username, share your screen and table list*/
    let extraStuffSection = document.getElementById('extra-screen-share-stuff');
    extraStuffSection.style.display = 'flex';

    let shareScreenButton = document.getElementById('share-screen');
    shareScreenButton.style.display = 'flex';
    shareScreenButton.removeAttribute('disabled');

    let roomList = document.getElementById('rooms-list');
    roomList.style.display = 'flex';

    document.title = "Screen share";
    screensharing.onuserleft("self");

}

function leaveMeeting() {
    try {
        leaveMeetingRoomVideoSharing();
    }
    catch (e) {
        try {
            leaveMeetingRoomScreenSharing();
        }
        catch (e) {
            location.replace("/left");
        }
    }

    connection.close();

}

function showInviteLink(meetingUUID,meetingName) {
    let chatDiv = document.getElementById("disp");
    let inviteLinkDiv = document.getElementById('invite-link-div');

    /*if(inviteLinkDiv.style.display === 'none') {
        inviteLinkDiv.style.display = 'block';
    }
    else {
        inviteLinkDiv.style.display = 'none';
    }*/

    console.log(`Meeting name : ${meetingName}, token/UUID: ${meetingUUID}`);
    let inviteUrl = `https://screen-it-git.herokuapp.com/meeting/${meetingName}/guest?token=${meetingUUID}`;
    let inviteLinkInput = document.getElementById('invite-link-input');
    inviteLinkInput.value = inviteUrl;
}

function copyInviteLink() {
    let inviteLinkInput = document.getElementById('invite-link-input');

    inviteLinkInput.select();
    inviteLinkInput.setSelectionRange(0, 99999); /*For mobile devices*/

    /* Copy the text inside the text field */
    document.execCommand("copy");
}