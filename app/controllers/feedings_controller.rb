class FeedingsController < ApplicationController
   before_action :authenticate_account!
   layout "authenticated"

   def new
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:entry_id])
      @feeding = Feeding.new
   end

   def create
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:entry_id])
      @feeding = @entry.feedings.new(feeding_params)
      if @feeding.save
         flash[:success] = "New Feeding has been recorded"
      else
         flash[:error] = "Sorry, something went wrong"
      end
      redirect_to baby_entry_path(@baby, @entry)
   end

   private

   def feeding_params
      params.require(:feeding).permit(:start_time, :end_time, :amount)
   end
end
