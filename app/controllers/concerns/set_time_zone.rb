module SetTimeZone
   extend ActiveSupport::Concern

   included do
      around_action :set_time_zone, if: :current_account
   end

   private

   def set_time_zone(&block)
      Time.use_zone(current_account.time_zone, &block)
   end
end