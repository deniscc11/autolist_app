class VehiclesController < ApplicationController
  before_action :get_vehicle, :add_visit, :get_visits, only: [:show]

  def show
  end

  private

    def get_vehicle
      @vehicle = CacheService.get_data(params[:id])
    end

    def add_visit
      VehicleVisit.create(vin: params[:id])
    end

    def get_visits
      @vehicles_visit = VehicleVisit.visits_counter(@vehicle.vin)
    end

end
