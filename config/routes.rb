Rails.application.routes.draw do

  root :to => "welcome#index"

  resources :welcome, only: [:index, :create]
end
