Rails.application.routes.draw do
  resources :users
  resources :tasks
  resources :comments
  resource :login
  delete "login/destroy" => "logins#destroy"
end
