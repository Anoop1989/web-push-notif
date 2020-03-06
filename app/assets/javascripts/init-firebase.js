let browser_id = null;
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
    console.log('token',token)
    browser_id = token;
    sendTokenToServer(token);
  }).
  catch(function(err){
    console.log("Error-- ", err);
  })

function onSubmit() {
  // var xhttp = new XMLHttpRequest();

  //   var title = document.getElementById('n-title').value;
  //   var body = document.getElementById('n-message').value;
  //   var url = document.getElementById('n-url').value;
  //   var add_icon = document.getElementById('n-image').checked;

  //       const content = {
  //           title, body, url, icon: 'http://localhost:8000/assets/flying-bird.png',
  //       }

  //   // fetch('http://localhost:8000/message/send', {
  //   //   method: 'POST',
  //   //   body: JSON.stringify({
  //   //     browser_id, content, add_icon

  //   // })}
  //   // )

  //   var formData = new FormData();
  //   formData.append('browser_id', browser_id)
  //   formData.append('content', JSON.stringify(content) )
  //   formData.append('add_icon', add_icon)
  //   xhttp.open("POST", "message/send", true);
  //   xhttp.send(formData);
}


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

messaging.onMessage(function({ notification}){
  var obj = notification;
  var notification = new Notification(obj.title, {
    icon: obj.icon,
    body: obj.body
  });
})