class BabiesController < ApplicationController
   before_action :authenticate_account!
   before_action :set_account
   before_action :check_for_allowed_accounts, only: [:show]
   layout "authenticated", except: [:start]

   def new      
      @baby = Baby.new
   end

   def show      
      @baby = Baby.friendly.find(params[:id])
      @entries = @baby.entries.order(created_at: :desc).group_by {|entry| entry.created_at.beginning_of_month}
      @entry = Entry.new
   end

   def start      
      redirect_to new_baby_path if @account.sign_in_count > 1
      @baby = Baby.new
   end

   def create      
      @baby = current_account.babies.new(baby_params)
      if @baby.save
         flash[:success] = "A dashboard for #{@baby.name} has been created!"
         redirect_to baby_path(@baby)
      else
         flash[:error] = "Sorry we weren't able to create this dashboard. Please try again."
         render :new
      end
   end

   private

   def check_for_allowed_accounts
      account = current_account
      baby = Baby.friendly.find(params[:id])
      unless baby.account == account
         redirect_to(accounts_path(current_account))
         flash[:error] = "Sorry, you don't have permissions to view this dashboard."      
      end
   end

   def set_account
      @account = current_account
   end

   def baby_params
      params.require(:baby).permit(:name, :gender, :dob, :height, :weight)
   end
end
