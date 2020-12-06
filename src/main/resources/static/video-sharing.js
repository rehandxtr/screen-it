let mainUserVideoId = 0;

function setupVideoCall(roomId){
    var connection = new RTCMultiConnection();
    connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
    connection.session = {
        audio: true,
        video: true
    };
    connection.sdpConstraints.mandatory = {
        OfferToReceiveAudio: true,
        OfferToReceiveVideo: true
    };
    let videosDiv = document.getElementById("videos");
    // alert(`fetching videos div`);
    let mainVideoDiv = document.querySelector(".main-video");
    connection.onstream = function(event) {
        // alert(`on stream event`);
        let media = event.mediaElement;
        // alert(`media.id = ${media.id}`);
        media.onclick = () => {
            renderThisVideoOnBigScreen(media);
        };
        media.style = "height:inherit;width:inherit";
        media.controls = false;

        videosDiv.childNodes.forEach((node)=>{
            console.log(node);
        });

        // alert(`Contains check : ${videosDiv.contains(media)} , media.id : ${media.id}`);
        if(videosDiv.contains(media)){
            // alert(`Contains check : ${videosDiv.contains(media)} , media.id : ${media.id}`);
            return;
        }

        let videoDivWithControls = document.createElement('div');
        videoDivWithControls.style = "height:inherit;width:inherit;";
        videoDivWithControls.appendChild(media);

        /* PAUSE VIDEO BUTTON //WORKING, SOLE PURPOSE AS OF NOW IS ONLY LIKE THE MAIN PAUSE BUTTON
        let toggleVideoImage = document.createElement('img');
        toggleVideoImage.src = "https://img.icons8.com/wired/64/000000/no-video.png";

        let spanText = document.createElement('span');
        spanText.textContent = "Pause Video";

        let toggleVideoButton = document.createElement('button');
        toggleVideoButton.classList.add("btn");
        toggleVideoButton.appendChild(toggleVideoImage);
        toggleVideoButton.appendChild(spanText);
        // toggleVideoButton.addEventListener(onclick,pauseVideo(media.id));
        toggleVideoButton.onclick = () => {
            pauseVideo(media.id);
        };
         */

        /* STOP VIDEO BUTTON //NEED TO TEST
        let stopVideoImg = document.createElement('img');
        stopVideoImg.src = "https://img.icons8.com/wired/64/000000/no-video.png";

        let spanTextStopVideo = document.createElement('span');
        spanTextStopVideo.textContent = "Stop Video";

        let stopVideoButton = document.createElement('button');
        stopVideoButton.classList.add("btn");
        stopVideoButton.appendChild(stopVideoImg);
        stopVideoButton.appendChild(spanTextStopVideo);
        // toggleVideoButton.addEventListener(onclick,pauseVideo(media.id));
        stopVideoButton.onclick = () => {
            stopVideo(media.id);
        };
        */

        /* ADDING BOTH BUTTONS TO VIDEO DIV
        videoDivWithControls.appendChild(toggleVideoButton);
        videoDivWithControls.appendChild(stopVideoButton);
        /*

        ORIGINAL
        alert(media);
        media.onclick = () => {
            alert('adding onclick');
         renderThisVideoOnBigScreen(media);
        };


        // media.addEventListener(onclick,renderThisVideoOnBigScreen(media)) ;
        videosDiv.appendChild( media );
/!*        alert("adding videos");
        alert(mainVideoDiv.childElementCount);*!/
        if (mainVideoDiv.childElementCount < 1) {
           /!* alert("in main video div");*!/
            mainVideoDiv.appendChild(media);
        }*/



        // media.addEventListener(onclick,renderThisVideoOnBigScreen(media)) ;
        videosDiv.appendChild( videoDivWithControls );
        // alert(`appended videoDivWithControls to the participants`);
        if (mainVideoDiv.childElementCount < 1) {
            mainUserVideoId = media.id;
            mainVideoDiv.appendChild(videoDivWithControls);
        }
    };
    connection.openOrJoin(roomId);
}

function renderThisVideoOnBigScreen(media){
    let currentVideoElement = media;

    let participantsDiv = document.querySelector('.participant-videos');
    let mainVideoDiv = document.querySelector(".main-video");
    let bigScreenVideoElement = mainVideoDiv.childNodes[1];

    if (media.id === mainVideoDiv.childNodes[1].id){
        return;
    }

    console.log(`Printing child nodes`);
    mainVideoDiv.childNodes.forEach(childNode => {
        console.log(childNode);
    });
    console.log(`Printing child nodes ended`);

    mainVideoDiv.removeChild(mainVideoDiv.childNodes[1]);
    // mainVideoDiv.removeChild(bigScreenVideoElement);
    mainVideoDiv.appendChild(currentVideoElement);

    participantsDiv.appendChild(bigScreenVideoElement);

}

function getRoomIdAndInitiateVideoCall(roomId){
    setupVideoCall(roomId);
}

/*function pauseVideo(videoId) {
    let videoElement = document.getElementById(videoId);
    videoElement.srcObject.getTracks().forEach(t => t.enabled = !t.enabled);
}*/

function pauseVideo() {
    // let pauseButtonImg = document.getElementById('pause-button-img');
    // let pauseButtonSpan = document.getElementById('pause-button-span');

    let pauseButton = document.getElementById('pause-button');
    let videoId = mainUserVideoId;
    let videoElement = document.getElementById(videoId);

    if(videoElement == null) {
        alert('Please start a video first');
        return;
    }

    console.log(`innhtml,value = ${pauseButton.innerHTML} , ${pauseButton.value}`);
    if(pauseButton.innerHTML.trim() === 'Pause video sharing') {
        // pauseButtonImg.src = "https://img.icons8.com/dotty/64/000000/video-call.png";
        pauseButton.innerHTML = "Resume video sharing";
    }
    else {
        // pauseButtonImg.src =  "https://img.icons8.com/wired/64/000000/no-video.png";
        pauseButton.innerHTML = "Pause video sharing";
    }

    videoElement.srcObject.getTracks().forEach(t => t.enabled = !t.enabled);
}

/*
function stopVideo(videoId) {
    alert("here");
    alert(videoId);
    let videoElement = document.getElementById(videoId);
    // alert(videoElement);
    // videoElement.srcObject.getTracks()[0].stop();
    videoElement.srcObject.getTracks().map((track)=>{
        track.stop();
    });

    videoElement.srcObject = null;
}
*/



function leaveMeetingRoomVideoSharing() {
    let videoId = mainUserVideoId;
    let videoElement = document.getElementById(videoId);

    if(videoElement) {
        videoElement.srcObject.getTracks().forEach(t => t.enabled = !t.enabled);
    }

    let screenElement = document.getElementById(document.getElementById('logged-in-username').value);
    if(screenElement) {
        screenElement.srcObject.getTracks().forEach(t => t.stop());
    }
    // location.replace("/meeting/end?="+document.getElementById('room-id').value);
    location.replace("/left");
}

function stopVideoSharing() {
    let videoId = mainUserVideoId;
    let videoElement = document.getElementById(videoId);

    isButtonClicked = false;

    videoElement.parentNode.parentNode.removeChild(videoElement.parentNode);

    if(videoElement) {
        videoElement.srcObject.getTracks().forEach(t => t.stop());
    }
    connection.close();

}