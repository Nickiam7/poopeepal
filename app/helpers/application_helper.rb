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

   def poo_image_size(diaper)
      case diaper
      when "large" then 40
      when "medium" then 30
      else 20
      end
   end

   def poo_image_color(diaper)
      case diaper
      when "black" then image_tag("black_poo.svg", width: 30, data: {toggle: "tooltip", placement: "top", title: "Black"})
      when "dark-green" then image_tag("dark-green.svg", width: 30, data: {toggle: "tooltip", placement: "top", title: "Dark Green"})
      when "bright-green" then image_tag("bright-green.svg", width: 30, data: {toggle: "tooltip", placement: "top", title: "Bright Green"})
      when "brown" then image_tag("ppp-logo.svg", width: 30, data: {toggle: "tooltip", placement: "top", title: "Brown"})
      when "green-tan" then image_tag("green-tan.svg", width: 30, data: {toggle: "tooltip", placement: "top", title: "Green Tan"})
      when "mustard-yellow" then image_tag("mustard_yellow.svg", width: 30, data: {toggle: "tooltip", placement: "top", title: "Mustard Yellow"})
      when "red" then image_tag("red.svg", width: 30, data: {toggle: "tooltip", placement: "top", title: "Red"})
      when "orange" then image_tag("orange.svg", width: 30, data: {toggle: "tooltip", placement: "top", title: "Orange"})
      when "yellow" then image_tag("bright_yellow.svg", width: 30, data: {toggle: "tooltip", placement: "top", title: "Yellow"})
      when "gray" then image_tag("gray.svg", width: 30, data: {toggle: "tooltip", placement: "top", title: "Gray"})
      when "white" then image_tag("white.svg", width: 30, data: {toggle: "tooltip", placement: "top", title: "White"})
      when "other" then image_tag("other-poo.svg", width: 30, data: {toggle: "tooltip", placement: "top", title: "Other"})
      end
   end
end
