class VehicleVisit < ApplicationRecord
  scope :visits_counter, -> (vins) { where('vin IN (?) AND created_at > ?', vins, (DateTime.now - 1.hour)).group(:vin).count }
  scope :old_visits, -> { where('created_at < ?', (DateTime.now - 1.hour)) }
end
