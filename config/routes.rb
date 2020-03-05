Rails.application.routes.draw do

  root :to => "welcome#index"

  resources :welcome, only: [:index, :create]
  get '/firebase-messaging-sw', to: "welcome#firebase_messaging_sw", defaults: { format: 'js' }
end
