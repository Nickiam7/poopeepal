module AfterLoginPath
   extend ActiveSupport::Concern

   def after_sign_in_path_for(resource)
      root_path
   end
end
