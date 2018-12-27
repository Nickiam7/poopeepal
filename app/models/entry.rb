class Entry < ApplicationRecord
   has_many :feedings

   belongs_to :account
   belongs_to :baby

   def sum_amount
      self.feedings.sum(&:amount)
   end
end
