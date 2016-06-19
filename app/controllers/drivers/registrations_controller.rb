class Drivers::RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  protected

  def after_sign_up_path_for(resource)
    case resource
    when :user, Driver
      driver_path(resource)
    else
      super
    end
  end

end
