require './app/models/station'
require './app/models/trip'
require './app/models/condition'
require 'csv'
require 'date'
require 'pry'

puts "begin seed...."

Station.destroy_all

stations = CSV.open './db/csv/station.csv', headers:true, header_converters: :symbol
stations.each do |row|
  Station.create!(id:                row[:id],
                  name:              row[:name],
                  dock_count:        row[:dock_count],
                  city:              row[:city],
                  installation_date: Date.strptime(row[:installation_date], "%m/%d/%Y"))
end

Condition.delete_all

conditions = CSV.open './db/csv/weather.csv', headers:true, header_converters: :symbol
conditions.each do |row|
  Condition.create!(date:        Date.strptime(row[:date], "%m/%d/%Y"),
  max_temperature:       row[:max_temperature_f],
  mean_temperature:      row[:mean_temperature_f],
  min_temperature:       row[:min_temperature_f],
  mean_humidity:         row[:mean_humidity],
  mean_visibility:       row[:mean_visibility_miles],
  mean_wind_speed:       row[:mean_wind_speed_mph],
  precipitation:         row[:precipitation_inches],
  zip_code:              row[:zip_code])
end

Trip.destroy_all

trips = CSV.open './db/csv/trip.csv', headers:true, header_converters: :symbol
trips.each do |row|
  zipcode = row[:zip_code].to_s.rjust(5, "0")[0..4]
  condition_id = Condition.date_id(Date.strptime(row[:start_date], "%m/%d/%Y"))
  Trip.create!(duration:           row[:duration],
               start_date:         DateTime.strptime(row[:start_date], "%m/%d/%Y"),
               start_station_id:   row[:start_station_id],
               end_date:           DateTime.strptime(row[:end_date], "%m/%d/%Y"),
               end_station_id:     row[:end_station_id],
               bike_id:            row[:bike_id],
               subscription:       row[:subscription_type],
               zip_code:           zipcode,
               condition_id:       condition_id)
end

puts "Seed complete"
