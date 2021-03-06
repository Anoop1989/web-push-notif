Rails.application.routes.draw do

  root :to => "welcome#index"

  resources :welcome, only: [:index, :create]

  get '/firebase-messaging-sw', to: "welcome#firebase_messaging_sw", defaults: { format: 'js' }
  post 'message/send', to: "welcome#message_send"

  get 'demo', to: 'welcome#demo'
  get 'landing', to: 'welcome#landing'
  get 'homepage', to: 'welcome#homepage'
end
