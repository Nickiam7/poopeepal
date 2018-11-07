Rails.application.routes.draw do

   devise_for :accounts, controllers: { registrations: "registrations" }, path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}


   get "/babies/start/", to: "babies#start"
   resources :babies, only: [:show, :new, :create] 
   get "/babies/", to: redirect("/")

   get "/accounts/dashboard/", to: "accounts#dashboard"
   
   authenticated :account do 
      root to: "accounts#dashboard"
   end 
   
   get "/accounts", to: redirect("/")
   root to: "pages#home"
end
