require 'csv'

namespace :vehicles do
  desc "Remove old visits"
  task :remove_old_visits => :environment do
    VehicleVisit.old_visits.destroy_all
  end
end
