Rails.application.routes.draw do

   devise_for :accounts, 
               controllers: { registrations: "registrations" }, 
               path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}
   
   get "/babies/start", to: "babies#start"
   resources :babies do 
      member {get :full}
      resources :entries do
         resources :feedings, only: [:create, :edit, :update, :destroy]
         resources :diapers, only: [:create, :edit, :update, :destroy]
      end
   end
   get "/babies", to: redirect("/")
   
   authenticated :account do 
      root to: "accounts#dashboard"
   end 
   get "/accounts", to: redirect("/")
   
   get "/about", to: "pages#about"
   get "/privacy", to: "pages#privacy"
   get "/terms-of-use", to: "pages#terms", as: "terms"

   root to: "pages#home"
end
