Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "user#Hello"
  get "/about",to: "user#about"
  resource :todos
end
