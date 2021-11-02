Rails.application.routes.draw do
  get "/chat_messages" => "chat_messages#index"
  resources :paths
  resources :sketches
  get "/rooms" ,to:"rooms#index"
  post '/signup', to: 'users#signup'
  post "/login", to: "authentication#login"
  get '/profile', to: "users#profile"
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
