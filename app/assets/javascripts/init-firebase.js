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
  messaging.requestPermission().then(function(){
    console.log("Have Permission");
     console.log(messaging.getToken());
  }).
  then(function(){
    console.log(token);
  }).
  catch(function(err){
    console.log("Error-- ", err);
  })

