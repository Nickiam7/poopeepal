class Sleep < ApplicationRecord
   belongs_to :entry

   validates :start_time, presence: true
end
