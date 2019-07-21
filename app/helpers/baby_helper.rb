module BabyHelper
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