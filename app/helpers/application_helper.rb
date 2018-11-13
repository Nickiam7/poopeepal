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
      end
   end
end
