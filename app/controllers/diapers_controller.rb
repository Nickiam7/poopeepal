class DiapersController < ApplicationController
   before_action :authenticate_account!
   layout "authenticated", except: [:edit]

   def create
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:entry_id])
      @diaper = @entry.diapers.new(diaper_params)
      if @diaper.save
         flash[:success] = "Diaper change has been recorded"
      else
         flash[:error] = "Sorry, something went wrong"
      end
      redirect_to baby_entry_path(@baby, @entry)
   end

   def edit
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:entry_id])
      @diaper = Diaper.find(params[:id])      
   end

   def update
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:entry_id])
      @diaper = Diaper.find(params[:id])      
      if @diaper.update(diaper_params)
         flash[:success] = "Diaper data has been updated."
         redirect_to baby_entry_path(@baby, @entry)
      else
         flash[:error] = "Sorry, something went wrong."
         render :edit
      end
   end

   def destroy
      @baby = Baby.friendly.find(params[:baby_id])
      @entry = Entry.find(params[:entry_id])
      @diaper = Diaper.find(params[:id])
      if @diaper.destroy                
         flash[:success] = "Diaper has been deleted"
      else
         flash[:error] = "Sorry, something went wrong"
      end
      redirect_to baby_entry_path(@baby, @entry)
   end

   private

   def diaper_params
      params.require(:diaper).permit(:time, :size, :color, :note, :pee, :poo, :texture)
   end
end
