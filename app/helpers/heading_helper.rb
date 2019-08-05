module HeadingHelper
   def dashboard_heading
      if current_page?(root_path) || current_page?("/dashboard")
         "Your Account Dashboard"
      elsif current_page?(new_baby_path)    
         "Create Your Baby's New Dashboard"
      elsif current_page?(full_baby_path(@baby))
         "#{@baby.name}'s Dashboard"         
      elsif current_page?(baby_path(@baby))
         "#{@baby.name}'s Dashboard"
      elsif current_page?(edit_baby_path(@baby))
         "Edit #{@baby.name}'s Dashboard"
      elsif current_page?(baby_entry_path(@baby, @entry))
         "#{@entry.created_at.strftime("%A, %b %d, %Y")}"
      elsif current_page?(new_baby_entry_feeding_path(@baby, @entry))
         "Tracking New Feeding"
      else
         "PooPeePal"
      end
   end
end