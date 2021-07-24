Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#new"
  post "/submit", to: "home#submit"
  get "/success", to: "home#success"
end
