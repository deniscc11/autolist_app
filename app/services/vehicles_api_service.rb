class VehiclesApiService

  include HTTParty
  base_uri 'https://autolist-test.herokuapp.com/'

  attr_reader :total_count

  def initialize(options)
    options["page"] = 1 if options["page"].nil?
    @options = { query: options }
    @pagination_info = Hash.new
  end

  def search
    @api_response = self.class.get("/search", @options).parsed_response
    set_pagination_info()
    parse_response()
  end

  private

    def set_pagination_info()
      @total_count = @api_response["total_count"]
    end

    def parse_response()
      @api_response["records"].map do |record|
        vehicle_object = JSON.parse(record.to_json, object_class: OpenStruct)
        CacheService.new(vehicle_object).cache_data
        vehicle_object
      end
    end

end
