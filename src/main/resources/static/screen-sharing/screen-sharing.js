document.getElementById('open-room').onclick = function() {
    /*connection.open(document.getElementById('room-id').value, function() {
        showRoomURL(connection.sessionid);
    });*/
    connection.open(location.href.replace(/\/|:|\?|-|=|#|%|\.|\[|\]/g, ''),function(){
        console.log('room id : ' + location.href.replace(/\/|:|\?|-|=|#|%|\.|\[|\]/g, ''));
    });
    document.getElementById('open-room').style.display = 'none';
    document.getElementById('join-room').style.display = 'none';
    document.getElementById('pause-sharing').style.display = 'inline-block';
    document.getElementById('stop-sharing').style.display = 'inline-block';
};

document.getElementById('join-room').onclick = function () {
    disableInputButtons();

    connection.sdpConstraints.mandatory = {
        OfferToReceiveAudio: false,
        OfferToReceiveVideo: true
    };
    // connection.join(document.getElementById('room-id').value);
    connection.join(location.href.replace(/\/|:|\?|-|=|#|%|\.|\[|\]/g, ''));
};

/*
document.getElementById('open-or-join-room').onclick = function() {
    disableInputButtons();
    connection.openOrJoin(document.getElementById('room-id').value, function(isRoomExist, roomid) {
        if (isRoomExist === false && connection.isInitiator === true) {
            // if room doesn't exist, it means that current user will create the room
            // showRoomURL(roomid);
        }

        if(isRoomExist) {
            connection.sdpConstraints.mandatory = {
                OfferToReceiveAudio: false,
                OfferToReceiveVideo: true
            };
        }
    });
};
*/

document.getElementById('pause-sharing').onclick = () => {
    // alert(`Room id = ${roomid}`);
    // let screenElement = document.getElementById(document.getElementById('room-id').value);

    let screenElement = document.getElementById(document.getElementById('logged-in-username').value);
    screenElement.srcObject.getTracks().forEach(t => t.enabled = !t.enabled);

    // alert(`${screenElement.id} left: screenElement.id`);
    let pauseButton = document.getElementById('pause-sharing');

    if (pauseButton.innerHTML === 'Pause sharing') {
        pauseButton.innerHTML = 'Resume sharing';
    } else {
        pauseButton.innerHTML = 'Pause sharing';
    }

};

document.getElementById('stop-sharing').onclick = () => {
    // let screenElement = document.getElementById(document.getElementById('room-id').value);
    let screenElement = document.getElementById(document.getElementById('logged-in-username').value);
    // alert(`${screenElement.id} left: screenElement.id`);
    screenElement.srcObject.getTracks().forEach(t => t.stop());

    document.getElementById('open-room').style.display = 'inline-block';
    document.getElementById('join-room').style.display = 'inline-block';
    document.getElementById('pause-sharing').style.display = 'none';
    document.getElementById('stop-sharing').style.display = 'none';
};

// ......................................................
// ..................RTCMultiConnection Code.............
// ......................................................

var connection = new RTCMultiConnection();

// by default, socket.io server is assumed to be deployed on your own URL
// connection.socketURL = '/';

// comment-out below line if you do not have your own socket.io server
connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

connection.socketMessageEvent = 'screen-sharing-demo';

connection.session = {
    screen: true,
    oneway: true
};

connection.sdpConstraints.mandatory = {
    OfferToReceiveAudio: false,
    OfferToReceiveVideo: false
};

// https://www.rtcmulticonnection.org/docs/iceServers/
// use your own TURN-server here!
connection.iceServers = [{
    urls: [ "stun:bturn2.xirsys.com" ]
}, {
    username: "UvTPk-94--OucqBrHhcAPLqJnOWqHrSPq-aVPBX6TFR_X68MGXSHkZyZgtaHIKwGAAAAAF4ftOhzYW1wbGV1c2VyaGVyZQ==",
    credential: "21a6ee2a-37fb-11ea-a0a0-9646de0e6ccd",
    urls: [
        "turn:bturn2.xirsys.com:80?transport=udp",
        "turn:bturn2.xirsys.com:3478?transport=udp",
        "turn:bturn2.xirsys.com:80?transport=tcp",
        "turn:bturn2.xirsys.com:3478?transport=tcp",
        "turns:bturn2.xirsys.com:443?transport=tcp",
        "turns:bturn2.xirsys.com:5349?transport=tcp"
    ]
}];

let originalUserWhoSharedScreenStream = null;

connection.videosContainer = document.getElementById('videos-container');
connection.onstream = function(event) {
    var existing = document.getElementById(event.streamid);
    if(existing && existing.parentNode) {
        existing.parentNode.removeChild(existing);
    }

    event.mediaElement.removeAttribute('src');
    event.mediaElement.removeAttribute('srcObject');
    event.mediaElement.muted = true;
    event.mediaElement.volume = 0;

    var video = document.createElement('video');

    try {
        video.setAttributeNode(document.createAttribute('autoplay'));
        video.setAttributeNode(document.createAttribute('playsinline'));
    } catch (e) {
        video.setAttribute('autoplay', true);
        video.setAttribute('playsinline', true);
    }

    if(event.type === 'local') {
        video.volume = 0;
        try {
            video.setAttributeNode(document.createAttribute('muted'));
        } catch (e) {
            video.setAttribute('muted', true);
        }
    }

    if(!originalUserWhoSharedScreenStream){
        // alert(`Setting original user with value ${document.getElementById('logged-in-username').value}`);
        originalUserWhoSharedScreenStream = document.getElementById('logged-in-username').value;
    }

    video.srcObject = event.stream;
    // video.id = document.getElementById('room-id').value;
    video.id = document.getElementById('logged-in-username').value;

    var width = innerWidth - 80;
    console.log(`innerWidth : ${innerWidth} , width: ${width}`);
    // alert(`EVENT userid : ${event.userid}`);

    var height = innerHeight - 80;

    var mediaElement = getHTMLMediaElement(video, {
        // title: event.userid,
        // title: document.getElementById('logged-in-username').value,
        // title: originalUserWhoSharedScreenStream,
        title:'',
        buttons: [],
        width: width,
        showOnMouseEnter: false
    });

    connection.videosContainer.appendChild(mediaElement);

    setTimeout(function() {
        mediaElement.media.play();
    }, 5000);

    mediaElement.id = event.streamid;
    // mediaElement.id = document.getElementById('room-id').value
};

connection.onstreamended = function(event) {
    // alert('on streamended');
    // alert(`User id : ${event.userid} , id :${event.id} , streamid : ${event.streamid}`);
    var mediaElement = document.getElementById(event.streamid);
    // alert(`mediaElement.id = ${mediaElement.id}`);
    if (mediaElement) {
        mediaElement.parentNode.removeChild(mediaElement);
        if(event.userid === connection.sessionid && !connection.isInitiator) {
            alert('Broadcast is ended. We will reload this page to clear the cache.');
            location.reload();
        }
    }
};

connection.onMediaError = function(e) {
    if (e.message === 'Concurrent mic process limit.') {
        if (DetectRTC.audioInputDevices.length <= 1) {
            alert('Please select external microphone. Check github issue number 483.');
            return;
        }

        var secondaryMic = DetectRTC.audioInputDevices[1].deviceId;
        connection.mediaConstraints.audio = {
            deviceId: secondaryMic
        };

        connection.join(connection.sessionid);
    }
};

// ..................................
// ALL below scripts are redundant!!!
// ..................................

function disableInputButtons() {
    /*document.getElementById('room-id').onkeyup();

    document.getElementById('open-or-join-room').disabled = true;
    document.getElementById('open-room').disabled = true;
    document.getElementById('join-room').disabled = true;
    document.getElementById('room-id').disabled = true;*/
}

// ......................................................
// ......................Handling Room-ID................
// ......................................................


(function() {
    var params = {},
        r = /([^&=]+)=?([^&]*)/g;

    function d(s) {
        return decodeURIComponent(s.replace(/\+/g, ' '));
    }
    var match, search = window.location.search;
    while (match = r.exec(search.substring(1)))
        params[d(match[1])] = d(match[2]);
    window.params = params;
})();

var roomid = '';
if (localStorage.getItem(connection.socketMessageEvent)) {
    roomid = localStorage.getItem(connection.socketMessageEvent);
} else {
    roomid = connection.token();
}
// document.getElementById('room-id').value = document.getElementById('room-id').value;
document.getElementById('room-id').onkeyup = function() {
    localStorage.setItem(connection.socketMessageEvent, document.getElementById('room-id').value);
};

var hashString = location.hash.replace('#', '');
if (hashString.length && hashString.indexOf('comment-') == 0) {
    hashString = '';
}

var roomid = params.roomid;
if (!roomid && hashString.length) {
    roomid = hashString;
}

if (roomid && roomid.length) {
    // document.getElementById('room-id').value = roomid;
    localStorage.setItem(connection.socketMessageEvent, roomid);

    // auto-join-room
    (function reCheckRoomPresence() {
        connection.checkPresence(roomid, function(isRoomExist) {
            if (isRoomExist) {
                connection.join(roomid);
                return;
            }

            setTimeout(reCheckRoomPresence, 5000);
        });
    })();

    disableInputButtons();
}

// detect 2G
if(navigator.connection &&
    navigator.connection.type === 'cellular' &&
    navigator.connection.downlinkMax <= 0.115) {
    alert('2G is not supported. Please use a better internet service.');
}


function leaveMeetingRoomScreenSharing() {
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