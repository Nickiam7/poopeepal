class BabiesController < ApplicationController
   before_action :authenticate_account!

   def new
      @baby = Baby.new
   end

   def create
      @account = Account.find(params[:account_id])
      @baby = Account.babies.new(baby_params)
      if @baby.save
         flash[:success] = "A dashboard for #{@baby.name} has been created!"
      else
         flash[:error] = "Sorry we weren't able to create this dashboard. Please try again."
      end
      redirect_to account_path(current_account)
   end

   private

   def baby_params
      params.require(:baby).permit(:name, :gender, :dob)
   end
end
