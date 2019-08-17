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

   def edit
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:entry_id])
      @sleep = Sleep.find(params[:id])
   end 

   def update
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:entry_id])
      @sleep = Sleep.find(params[:id])      
      if @sleep.update(sleep_params)
         flash[:success] = "sleep data has been updated."
         redirect_to baby_entry_path(@baby, @entry)
      else
         flash[:error] = "Sorry, something went wrong."
         render :edit
      end
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
      params.require(:sleep).permit(:start_time, :end_time, :location, :notes, :in_progress)
   end
end
