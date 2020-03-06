const firebaseConfig = {
    apiKey: "AIzaSyDud2lNsuXE1EOtoUT0eWnApF7yp43LJi0",
    authDomain: "web-push-notification-270206.firebaseapp.com",
    databaseURL: "https://web-push-notification-270206.firebaseio.com",
    projectId: "web-push-notification-270206",
    storageBucket: "web-push-notification-270206.appspot.com",
    messagingSenderId: "1086162068957",
    appId: "1:1086162068957:web:b0f0c075cd5190b039c234"
  };
  firebase.initializeApp(firebaseConfig);

  const messaging = firebase.messaging();

  messaging.usePublicVapidKey("BGAzMcy2xMSHEb8n_LriWtZYdyQygJq1CToIMVuuPVlDk2do2tQYhbogBmzEygxWrh8-5RZlpEVMs4AL8EMes_0");

    messaging.requestPermission().then(function(){
    console.log("Have Permission");
     return messaging.getToken();
  }).
  then(function(token){
    sendTokenToServer(token);
  }).
  catch(function(err){
    console.log("Error-- ", err);
  })


function sendTokenToServer(token) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      console.log("Success");
    }
  };
  var formData = new FormData();
  formData.append('browser_id', token)
  xhttp.open("POST", "welcome", true);
  xhttp.send(formData);
}

messaging.onMessage(function(payload){
  var obj = JSON.parse(payload.data.notification);
  var notification = new Notification(obj.title, {
    icon: obj.icon,
    body: obj.body
  });
})