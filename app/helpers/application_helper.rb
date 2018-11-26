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
      elsif current_page?(controller: "babies", action: :show)     
         "#{@baby.name}'s Dashboard"
      elsif current_page?(controller: "babies", action: :edit)      
         "Edit #{@baby.name}'s Dashboard"
      elsif current_page?(controller: "entries", action: :show)      
         "#{@entry.created_at.strftime("%A, %b %d, %Y")}"
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
