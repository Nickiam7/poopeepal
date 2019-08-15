class SleepsController < ApplicationController
   before_action :authenticate_account!
   layout "authenticated", except: [:edit]
   
   def create
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:entry_id])
      @sleep = @entry.sleeps.new(sleep_params)
      if @sleep.save
         flash[:success] = "Sleep has been recorded"
      else
         flash[:error] = "Something went wrong."
      end
      redirect_to baby_entry_path(@baby, @entry)
   end 

   def destroy
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:entry_id])
      @sleep = Sleep.find(params[:id])
      if @sleep.destroy
         flash[:success] = "Sleep entry has been deleted."         
      else
         flash[:error] = "Something went wrong"
      end
      redirect_to baby_entry_path(@baby, @entry)
   end

   private

   def sleep_params
      params.require(:sleep).permit(:start_time, :end_time, :location, :notes)
   end
end
