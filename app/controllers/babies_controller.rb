class BabiesController < ApplicationController
   before_action :authenticate_account!
   before_action :set_account
   layout "authenticated", except: [:start]

   def new      
      @baby = Baby.new
   end

   def show      
      @baby = Baby.friendly.find(params[:id])
   end

   def start      
      redirect_to new_baby_path if @account.sign_in_count > 1
      @baby = Baby.new
   end

   def create      
      @baby = @account.babies.new(baby_params)
      if @baby.save
         flash[:success] = "A dashboard for #{@baby.name} has been created!"
         redirect_to baby_path(@baby)
      else
         flash[:error] = "Sorry we weren't able to create this dashboard. Please try again."
         render :new
      end
   end

   private

   def set_account
      @account = current_account
   end

   def baby_params
      params.require(:baby).permit(:name, :gender, :dob, :hight, :weight)
   end
end
