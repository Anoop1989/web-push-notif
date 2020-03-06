Rails.application.routes.draw do

  root :to => "welcome#index"

  resources :welcome, only: [:index, :create]
<<<<<<< HEAD

  get 'demo', to: 'welcome#demo'
  get 'landing', to: 'welcome#landing'
  get 'homepage', to: 'welcome#homepage'
=======
  get '/firebase-messaging-sw', to: "welcome#firebase_messaging_sw", defaults: { format: 'js' }
  post 'message/send', to: "welcome#message_send"
>>>>>>> 9e08e6449c0045c7f1cc2bc0177da5411dc1b818
end
