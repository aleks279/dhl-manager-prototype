class Drivers::SessionsController < Devise::SessionsController 
  
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
    when :driver, Driver
      driver_path(resource)
    else
      super
    end
  end

end
