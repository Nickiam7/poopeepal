class BabiesController < ApplicationController
   before_action :authenticate_account!
   before_action :set_account
   before_action :check_for_allowed_accounts, only: [:show, :edit, :destroy]
   layout "authenticated", except: [:start]
   
   def new      
      @baby = Baby.new
   end

   def show      
      @baby = Baby.friendly.find(params[:id])      
      @entries_current_month = @baby.entries.includes(:feedings).order(created_at: :desc).where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).all
      @entry = Entry.new
   end

   def full
      @baby = Baby.friendly.find(params[:id])      
      @entries = @baby.entries.includes(:feedings).order(created_at: :desc).group_by {|entry| entry.created_at.beginning_of_month}
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

   def edit
      @baby = Baby.friendly.find(params[:id])
   end

   def update
      @baby = Baby.friendly.find(params[:id])
      if @baby.update(baby_params)
         flash[:success] = "#{@baby.name}'s Dashboard has been updated!"
         redirect_to baby_path(@baby)
      else
         flash[:error] = "Sorry we weren't able to update this dashboard. Please try again."
         render :edit
      end
   end

   def destroy
      @baby = Baby.friendly.find(params[:id])
      if @baby.destroy
         flash[:success] = "#{@baby.name} was deleted"
      else
         flash[:error] = "Sorry we weren't able to delete this dashboard. Please try again."         
      end
      redirect_to root_path
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
      params.require(:baby).permit(:name, :gender, :dob, :height, :weight, :baby_thumb)
   end
end
