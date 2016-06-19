class DriversController < ApplicationController

  before_action :find_driver

  def show; end

  def edit; end

  private

  def find_driver
    @driver = Driver.find(params[:id])
  end
end
