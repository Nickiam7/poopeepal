class AccountsController < ApplicationController
   before_action :authenticate_account!
   layout "authenticated"

   def dashboard
      @account = current_account
      @babies = @account.babies
   end
end
