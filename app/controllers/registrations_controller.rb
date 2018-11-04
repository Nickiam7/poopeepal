class RegistrationsController < Devise::RegistrationsController
  
  protected

  def after_sign_up_path_for(resource)
    accounts_customize_path
  end
end