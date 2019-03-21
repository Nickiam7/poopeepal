class EntriesController < ApplicationController
   before_action :authenticate_account!
   before_action :check_current_account_permissions
   layout "authenticated"

   def show
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:id])
      @feeding = Feeding.new
      @feedings = @entry.feedings.all
      @diaper = Diaper.new
      @diapers = @entry.diapers.all
   end

   def create
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = @baby.entries.new(account_id: current_account.id, baby_id: @baby.id)
      if @entry.save
         flash[:success] = "Entry created"
         redirect_to baby_entry_path(@baby, @entry)
      else
         flash[:error] = "Entry was not created"
         redirect_to baby_path(@baby)
      end
   end

   def destroy
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:id])
      if @entry.destroy
         flash[:success] = "Entry has been deleted."
         redirect_to baby_path(@baby)
      else
         flash[:error] = "Something went wrong"
         redirect_to baby_entry_path(@baby, @entry)
      end
   end

   private

   def check_current_account_permissions
      baby = Baby.friendly.find(params[:baby_id])      
      unless baby.account == current_account
         flash[:error] = "You don't have permission for that"
         redirect_to(accounts_path(current_account))
      end
   end
end
