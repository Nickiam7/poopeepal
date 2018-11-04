class AccountsController < ApplicationController
   before_action :authenticate_account!

   def dashboard
      @account = current_account
   end

   def customize
      @account = current_account
   end
end
