/*const socket = io("http://192.168.0.77:3000");
const socket = io("https://192.168.0.77:3000", {security : true});*/
const socket = io("https://www.gamsung.site:3000", {security : true});

//화면들과 마이크를 ID값을 통해 잡아온다.
const myFace = document.getElementById("myFace");
const audioBtn = document.getElementById("audio");
const audiosSelect = document.getElementById("audios");
const cameraBtn = document.getElementById("camera");
const camerasSelect = document.getElementById("cameras");
const call = document.getElementById("call");

//입장 전에는 화면을 숨겨둔다.
call.hidden = true;

let myStream;
let muted = false;
let cameraOff = false;
let productNo;
let myPeerConnection;
let myDataChannel;

//PC에서 카메라들을 잡아와 Select Option에 세팅해준다.
async function getCameras() {
  try {
    const devices = await navigator.mediaDevices.enumerateDevices();
    const cameras = devices.filter((device) => device.kind === "videoinput");
    const currentCamera = myStream.getVideoTracks()[0];
    cameras.forEach((camera) => {
      const option = document.createElement("option");
      option.value = camera.deviceId;
      option.innerText = camera.label;
      if (currentCamera.label === camera.label) {
        option.selected = true;
      }
      camerasSelect.appendChild(option);
    });
  } catch (e) {
    console.log(e);
  }
}

async function getAudios() {
  try {
    const devices = await navigator.mediaDevices.enumerateDevices();
    const audios = devices.filter((device) => device.kind === "audioinput");
    const currentAudio = myStream.getAudioTracks()[0];
    audios.forEach((audio) => {
      const option = document.createElement("option");
      option.value = audio.deviceId;
      option.innerText = audio.label;
      if (currentAudio.label === audio.label) {
        option.selected = true;
      }
      audiosSelect.appendChild(option);
    });
  } catch (e) {
    console.log(e);
  }
}

//화면을 잡아온다.
async function getMedia(deviceId) {
  const initialConstrains = {
    audio: true,
    video: { facingMode: "user" },
  };
  const changeConstraints = {
    audio: true,
    video: { deviceId: { exact: deviceId } },
  };
  try {
    myStream = await navigator.mediaDevices.getUserMedia(
      deviceId ? changeConstraints : initialConstrains
    );
    myFace.srcObject = myStream;
    if (!deviceId) {
      await getCameras();
      await getAudios();
    }
  } catch (e) {
    console.log(e);
  }
}


//마이크 on/off Event Handler 
function handleAudioClick() {
  myStream
    .getAudioTracks()
    .forEach((track) => (track.enabled = !track.enabled));
  if (!muted) {
    audioBtn.innerHTML = '<i class="fa fa-microphone-slash"></i>';
    muted = true;
  } else {
    audioBtn.innerHTML = '<i class="fa fa-microphone"></i>';
    muted = false;
  }
}

//카메라 on/off Event Handler 
function handleCameraClick() {
  myStream
    .getVideoTracks()
    .forEach((track) => (track.enabled = !track.enabled));
  if (cameraOff) {
    cameraBtn.innerHTML = '<i class="fa fa-video-camera">';
    cameraOff = false;
  } else {
    cameraBtn.innerText = 'on';
    cameraOff = true;
  }
}

//카메라 변경 감지 이벤트
async function handleCameraChange() {
  await getMedia(camerasSelect.value);
  if (myPeerConnection) {
    const videoTrack = myStream.getVideoTracks()[0];
    const videoSender = myPeerConnection
      .getSenders()
      .find((sender) => sender.track.kind === "video");
    videoSender.replaceTrack(videoTrack);
  }
}

async function handleAudioChange() {
  await getMedia(audiosSelect.value);
  if (myPeerConnection) {
    const audioTrack = myStream.getAudioTracks()[0];
    const audioSender = myPeerConnection
      .getSenders()
      .find((sender) => sender.track.kind === "audio");
    audioSender.replaceTrack(audioTrack);
  }
}

audioBtn.addEventListener("click", handleAudioClick);
audiosSelect.addEventListener("input", handleAudioChange);
cameraBtn.addEventListener("click", handleCameraClick);
camerasSelect.addEventListener("input", handleCameraChange);

// Welcome Form 방 입장

const welcome = document.getElementById("welcome");
const welcomeForm = welcome.querySelector("form");

async function initCall() {
  welcome.hidden = true;
  call.hidden = false;
  await getMedia();
  makeConnection();
}

async function handleWelcomeSubmit(event) {
  event.preventDefault();
  const input = welcomeForm.querySelector("input");
  await initCall();
  socket.emit("joinVideo", input.value);
  productNo = input.value;
  input.value = "";
}

welcomeForm.addEventListener("submit", handleWelcomeSubmit);

// Socket Code

socket.on("welcome", async () => {
  myDataChannel = myPeerConnection.createDataChannel("chat");
  myDataChannel.addEventListener("message", (event) => console.log(event.data));

  const offer = await myPeerConnection.createOffer();
  myPeerConnection.setLocalDescription(offer);

  socket.emit("offer", offer, productNo);
});

socket.on("offer", async (offer) => {
  myPeerConnection.addEventListener("datachannel", (event) => {
    myDataChannel = event.channel;
    myDataChannel.addEventListener("message", (event) =>
      console.log(event.data)
    );
  });
  
  myPeerConnection.setRemoteDescription(offer);
  const answer = await myPeerConnection.createAnswer();
  myPeerConnection.setLocalDescription(answer);
  socket.emit("answer", answer, productNo);

});

socket.on("answer", (answer) => {
  myPeerConnection.setRemoteDescription(answer);
});

socket.on("ice", (ice) => {
  myPeerConnection.addIceCandidate(ice);
});

socket.on("left", () => {
  const peerFace = document.getElementById("peerFace");
  peerFace.srcObject = null;
});

// RTC Code 
function makeConnection() {
  // STUN server setting
  myPeerConnection = new RTCPeerConnection({
    iceServers: [
      {
        urls: [
          "stun:stun.l.google.com:19302",
          "stun:stun1.l.google.com:19302",
          "stun:stun2.l.google.com:19302",
          "stun:stun3.l.google.com:19302",
          "stun:stun4.l.google.com:19302",
        ],
      },
    ],
  });
  myPeerConnection.addEventListener("icecandidate", handleIce);
  myPeerConnection.addEventListener("addstream", handleAddStream);
  myStream
    .getTracks()
    .forEach((track) => myPeerConnection.addTrack(track, myStream));
}

function handleIce(data) {
  socket.emit("ice", data.candidate, productNo);
}

function handleAddStream(data) {
  const peerFace = document.getElementById("peerFace");
  peerFace.srcObject = data.stream;
}

window.onbeforeunload = function() {
  socket.emit("left", productNo);
}
