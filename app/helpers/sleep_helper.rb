module SleepHelper
   def sleep_converter(sleep)
      if !sleep.in_progress
         duration = (sleep.end_time.to_time.to_i - sleep.start_time.to_time.to_i) / 60

         if duration < 60
            duration.to_s + " minutes"
         else
            hour_duration = duration / 60
            pluralize(hour_duration, 'hour')
         end
      else 
         "In Progress"
      end
   end
end
