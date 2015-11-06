class VehiclesController < ApplicationController
  before_action :require_login

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new vehicle_params

    if @vehicle.save
      redirect_to vehicles_path
    else
      render :new
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:year, :make, :model, :vin, :mileage,
                                    :currently_owned)
  end
end
