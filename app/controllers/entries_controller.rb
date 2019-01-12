class EntriesController < ApplicationController
   before_action :authenticate_account!
   layout "authenticated"

   def show
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:id])
      @feeding = Feeding.new
      @feedings = @entry.feedings.all
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
end
