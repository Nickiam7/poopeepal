class Entry < ApplicationRecord
   has_many :feedings, dependent: :destroy
   has_many :diapers, dependent: :destroy

   belongs_to :account
   belongs_to :baby

   def sum_feedings
      self.feedings.sum(&:amount)
   end

   def sum_diapers
      self.diapers.size
   end
end
