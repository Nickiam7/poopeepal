module AfterLoginPath
   extend ActiveSupport::Concern

   def after_sign_in_path_for(resource)
      accounts_dashboard_path
   end
end
