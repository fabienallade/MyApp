Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "user#Hello"
  get "/about",to: "user#about"
  get "/login",to: "user#login"
  post "/login",to:"user#create"
  delete "/logout",to:"users#destroy"
=begin
  get "/inscription",to:"user#inscription"
=end
  resource :user
  resources :todos
  resources :users
  resources :publications

  mount ActionCable.server =>"/cable"
end
