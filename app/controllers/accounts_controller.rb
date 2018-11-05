class AccountsController < ApplicationController
   before_action :authenticate_account!

   def dashboard
      @account = current_account
   end
end
