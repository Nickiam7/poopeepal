module ApplicationHelper
   def resource_name
      :account
   end

   def resource_class 
      account 
   end

   def resource
      @resource ||= Account.new
   end

   def devise_mapping
      @devise_mapping ||= Devise.mappings[:account]
   end

   def dashboard_heading
      if current_page?(root_path) || current_page?("/dashboard")
         "Your Account Dashboard"
      elsif current_page?(new_baby_path)    
         "Create Your Baby's New Dashboard"
      elsif current_page?(baby_path(@baby))
         "#{@baby.name}'s Dashboard"
      elsif current_page?(edit_baby_path(@baby))
         "Edit #{@baby.name}'s Dashboard"
      elsif current_page?(baby_entry_path(@baby, @entry))
         "#{@entry.created_at.strftime("%A, %b %d, %Y")}"
      elsif current_page?(edit_baby_entry_feeding_path(@baby, @entry, @feeding))
         "Edit Baby Feeding"
      elsif current_page?(new_baby_entry_feeding_path(@baby, @entry))
         "Tracking New Feeding"
      else
         "PooPeePal"
      end
   end

   def flash_class(key)
      case key
      when "success" then "alert alert-success"
      when "error" then "alert alert-danger"
      when "alert" then "alert alert-danger"
      when "notice" then "alert alert-success"
      end
   end

   def baby_submit_button_text
      if @baby.id.present?
         "Update Dashboard"
      else
         "Create Dashboard"
      end 
   end

   def baby_weight
      weight = @baby.weight.split(".")
      "#{weight[0]} lbs, #{weight[1]} oz"
   end
end
