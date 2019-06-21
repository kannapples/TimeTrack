require 'csv'    
require 'rake'

namespace :import_trackers do
	task :import_from_csv => :environment do
		csv_text = File.read('/Users/Claire/Documents/coding/git_projects/TimeTrack/lib/tasks/legacy_trackers_6.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
  			Tracker.create!(row.to_hash)
		end
	end
end