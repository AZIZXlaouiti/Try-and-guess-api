Rails.application.routes.draw do
  get "/chat_messages" => "chat_messages#index"
  resources :paths
  resources :sketches
  post '/signup', to: 'users#signup'
  post "/login", to: "authentication#login"
  get '/profile', to: "users#get_current_user"
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
