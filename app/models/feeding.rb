class Feeding < ApplicationRecord
   belongs_to :entry

   validates :amount, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
   validates :start_time, presence: true
end
