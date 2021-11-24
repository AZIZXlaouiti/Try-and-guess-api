Rails.application.routes.draw do
  post '/signup', to: 'users#signup'
  post "/login", to: "authentication#login"
  get '/profile', to: "users#profile"
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
