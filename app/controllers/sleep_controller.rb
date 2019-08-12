class SleepController < ApplicationController
   before_action :authenticate_account!
   layout "authenticated", except: [:edit]
   
   def create
      @baby = Baby.friendly.find(params[:bab_id])
      @entry = Entry.find(params[:entry_id])
      @sleep = Sleep.new(sleep_params)
      if @sleep.save
         flash[:success] = "Sleep has been recorded"
      else
         flash[:error] = "Something went wrong."
      end
      redirect_to baby_entry_path(@baby, @entry)
   end 

   private

   def sleep_params
      params.require(:sleep).permit(:start_time, :end_time, :location, :notes)
   end
end
