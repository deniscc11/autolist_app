class VehiclesApiService

  include HTTParty
  base_uri 'https://autolist-test.herokuapp.com/'

  attr_reader :pagination_info

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
      @pagination_info[:current_page] = @options[:query][:page].to_i
      @pagination_info[:total_count] = @api_response["total_count"]
      @pagination_info[:total_pages] = (@api_response["total_count"] / 20.0).ceil
      #it generates a range of the last 3 pages and next 3 pages
      @pagination_info[:pages] =  ((@options[:query][:page].to_i - 3)..(@options[:query][:page].to_i + 3))
    end

    def parse_response()
      @api_response["records"].map do |record|
        json_object = JSON.parse(record.to_json, object_class: OpenStruct)
        CacheService.new(json_object).cache_data
        json_object
      end
    end

end
