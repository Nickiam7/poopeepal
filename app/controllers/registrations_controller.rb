class RegistrationsController < Devise::RegistrationsController
  
  protected

  def after_sign_up_path_for(resource)
   babies_start_path
  end

  def after_update_path_for(resource)
   edit_account_registration_path
  end
end