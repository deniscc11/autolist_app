class SearchesController < ApplicationController

  def index
  end

  def results
    search_vehicles
  end

  private

    def search_params
      params.permit(:page, :price_min, :price_max)
    end

    def search_vehicles
      vehicles_api_service = VehiclesApiService.new(search_params)
      @vehicles = vehicles_api_service.search
      @total_count = vehicles_api_service.total_count
      get_visits
    end

    def get_visits
      @vehicles_visits = VehicleVisit.visits_counter(@vehicles.map(&:vin))
    end

end
