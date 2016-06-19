class ClientsController < ApplicationController

  before_action :find_client, only: [:show]

  def show; end

  private

  def find_client
    @client = Client.find(params[:id])
  end
end
