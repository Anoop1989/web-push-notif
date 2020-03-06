Rails.application.routes.draw do

  root :to => "welcome#index"

  resources :welcome, only: [:index, :create]

  get 'demo', to: 'welcome#demo'
  get 'landing', to: 'welcome#landing'
  get 'homepage', to: 'welcome#homepage'
end
