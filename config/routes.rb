Rails.application.routes.draw do
  resources :users
  resources :tasks
  resource :login
  delete "login/destroy" => "logins#destroy"
end
