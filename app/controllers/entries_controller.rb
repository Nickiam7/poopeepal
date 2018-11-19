class EntriesController < ApplicationController
   layout "authenticated"

   def show
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:id])
   end

   def create
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = @baby.entries.new(account_id: current_account.id, baby_id: @baby.id)
      if @entry.save && @entry.created_at != Time.now.beginning_of_day.utc..Time.now.end_of_day.utc
         flash[:success] = "Entry created"
         redirect_to baby_path(@baby)
      else
         flash[:error] = "Entry was not created"
         redirect_to baby_path(@baby)
      end
   end
end
