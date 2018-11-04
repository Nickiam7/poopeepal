Rails.application.routes.draw do

   devise_for :accounts, controllers: { registrations: "registrations" }, path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}

   get "/accounts/dashboard/", to: "accounts#dashboard"
   get "/accounts/customize/", to: "accounts#customize"

   authenticated :account do 
      root to: "accounts#dashboard"
   end 
   
   get "/accounts", to: redirect("/")
   root to: "pages#home"
end
