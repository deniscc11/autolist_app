class CacheService

  def initialize(record)
    @record = record
  end

  def cache_data
    Rails.cache.delete("vehicle:#{@record.vin}")
    Rails.cache.fetch("vehicle:#{@record.vin}") do
      @record
    end
  end

  def self.get_data(vin)
    Rails.cache.fetch("vehicle:#{vin}")
  end

end
