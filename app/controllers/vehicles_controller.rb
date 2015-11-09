class VehiclesController < ApplicationController
  before_action :require_login

  def index
    @vehicles = current_user.vehicles
  end

  def new
    @vehicle = current_user.vehicles.build
  end

  def create
    @vehicle = Vehicle.new vehicle_params

    if @vehicle.save
      redirect_to vehicles_path
    else
      render :new
    end
  end

  def edit
    @vehicle = current_user.vehicles.find(params[:id])
  end

  def update
    @vehicle = current_user.vehicles.find(params[:id])

    if @vehicle.update vehicle_params
      redirect_to vehicles_path
    else
      render :edit
    end
  end

  def destroy
    @vehicle = current_user.vehicles.find(params[:id])

    if @vehicle.destroy
      redirect_to vehicles_path
    else
      flash.alert = translate("vehicles.unable_to_delete")
      redirect_to vehicles_path
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:year, :make, :model, :vin, :mileage,
                                    :currently_owned, :owner_id, :purchase_date,
                                    :sale_date)
  end
end
