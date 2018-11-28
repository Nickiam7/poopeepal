class Entry < ApplicationRecord
   has_many :feedings

   belongs_to :account
   belongs_to :baby
end
