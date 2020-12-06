/*
// IceServersHandler.js

var IceServersHandler = (function() {
    function getIceServers(connection) {
        // resiprocate: 3344+4433
        // pions: 7575
        var iceServers = [{
            'urls': [
                'stun:stun.l.google.com:19302',
                'stun:stun1.l.google.com:19302',
                'stun:stun2.l.google.com:19302',
                'stun:stun.l.google.com:19302?transport=udp',
            ]
        }];

        return iceServers;
    }

    return {
        getIceServers: getIceServers
    };
})();
*/
// IceServersHandler.js

var IceServersHandler = (function() {
    function getIceServers(connection) {
        // resiprocate: 3344+4433
        // pions: 7575
        var iceServers = [{
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

        return iceServers;
    }

    return {
        getIceServers: getIceServers
    };
})();
/*
iceServers: [{
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
}];*/


/*
"username":"QePJCSrcGTwS5EIrMhe0NORAaD1XEer1IKMvMWicoD6YKa6hlmdHpTgLkE8DZyDaAAAAAF4fsiVzYW1wbGV1c2VyaGVyZQ==",
    "urls":[
    "stun:bturn2.xirsys.com",
    "turn:bturn2.xirsys.com:80?transport=udp",
    "turn:bturn2.xirsys.com:3478?transport=udp",
    "turn:bturn2.xirsys.com:80?transport=tcp",
    "turn:bturn2.xirsys.com:3478?transport=tcp",
    "turns:bturn2.xirsys.com:443?transport=tcp",
    "turns:bturn2.xirsys.com:5349?transport=tcp"
],
    "credential":"7c0c6e3c-37f9-11ea-b757-9646de0e6ccd"
*/
