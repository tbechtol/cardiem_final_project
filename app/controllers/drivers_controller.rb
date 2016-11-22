class DriversController < ApplicationController
  def index
    @drivers = Driver.page(params[:page]).per(10)
  end

  def show
    @driver = Driver.find(params[:id])
  end
end
