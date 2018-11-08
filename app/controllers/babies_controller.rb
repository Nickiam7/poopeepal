class BabiesController < ApplicationController
   before_action :authenticate_account!
   layout "baby"

   def new
      @account = current_account
      @baby = Baby.new
   end

   def show
      @baby = Baby.find(params[:id])
   end

   def start
      @account = current_account
      redirect_to new_baby_path if @account.sign_in_count > 1
      @baby = Baby.new
   end

   def create
      @account = current_account
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

   def baby_params
      params.require(:baby).permit(:name, :gender, :dob)
   end
end
