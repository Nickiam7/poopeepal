class RegistrationsController < Devise::RegistrationsController
  
  protected

  def after_sign_up_path_for(resource)
   babies_start_path
  end
end