class TrucksController < ApplicationController

  before_action :find_truck, only: [:show]

  def index
    @trucks = Truck.all
  end

  def show; end

  private

  def find_truck
    @truck = Truck.find(params[:id])
  end

end
