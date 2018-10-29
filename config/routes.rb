Rails.application.routes.draw do
   
  devise_for :accounts, path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}
  
  root to: "pages#home"
end
