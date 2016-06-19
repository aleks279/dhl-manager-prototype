class DriversController < ApplicationController

  before_action :find_driver

  def show; end

  def edit; end

  def update
    if @driver.update(driver_params)
      redirect_to driver_path(@driver)
    else
      render 'edit'
    end
  end

  private

  def driver_params
    params.require(:driver).permit(
    )
  end

  def find_driver
    @driver = Driver.find(params[:id])
  end
end
