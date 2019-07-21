module PooHelper
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