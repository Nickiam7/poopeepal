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

   def flash_class(key)
      case key
      when "success" then "alert alert-success"
      when "error" then "alert alert-danger"
      when "alert" then "alert alert-danger"
      when "notice" then "alert alert-success"
      end
   end

   def for_current_month
      Time.now.beginning_of_month..Time.now.end_of_month
   end
end
