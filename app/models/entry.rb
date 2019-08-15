class Entry < ApplicationRecord
   has_many :feedings, dependent: :destroy
   has_many :diapers, dependent: :destroy
   has_many :sleeps, dependent: :destroy

   belongs_to :account
   belongs_to :baby

   def sum_feedings
      self.feedings.sum(&:amount)
   end

   def total_sleep_time
      sleep_time = []
      self.sleeps.each do |sleep|
         sleep_time << (sleep.end_time.to_time.to_i - sleep.start_time.to_time.to_i) / 60
      end
      hrs = sleep_time.inject(:+) / 60
      mins = sleep_time.inject(:+) % 60
      if mins == 0
         "<h3>#{hrs}</h3><p>hrs</p>"
      else
         "<h3>#{hrs}</h3><p>hrs</p> <h3>#{mins}</h3><p>mins</p>"
      end
   end
end
