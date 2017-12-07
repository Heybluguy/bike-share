require 'spec_helper'

describe "when a visitor visits weather dashboard" do
  it 'visitor sees updated weather page' do

  Condition.create(date: "1/8/2013", max_temperature: 85, mean_temperature: 68, min_temperature: 61, mean_humidity: 74, mean_visibility: 10, mean_wind_speed: 2, precipitation:0.2)
  Condition.create(date: "2/8/2013", max_temperature: 75, mean_temperature: 68, min_temperature: 61, mean_humidity: 74, mean_visibility: 6, mean_wind_speed: 6, precipitation:0.7)
  Condition.create(date: "3/8/2013", max_temperature: 65, mean_temperature: 68, min_temperature: 61, mean_humidity: 74, mean_visibility: 2, mean_wind_speed: 10, precipitation:1.2)
  Condition.create(date: "4/8/2013", max_temperature: 55, mean_temperature: 68, min_temperature: 61, mean_humidity: 74, mean_visibility: 10, mean_wind_speed: 14, precipitation:1.7)
  Condition.create(date: "5/8/2013", max_temperature: 45, mean_temperature: 68, min_temperature: 61, mean_humidity: 74, mean_visibility: 10, mean_wind_speed: 18, precipitation:1.9)
  Condition.create(date: "6/8/2013", max_temperature: 55, mean_temperature: 68, min_temperature: 61, mean_humidity: 74, mean_visibility: 10, mean_wind_speed: 22, precipitation:2.7)


  Trip.create(duration: 63, start_date: "01/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127, condition_id: 1)
  Trip.create(duration: 70, start_date: "02/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138, condition_id: 2)
  Trip.create(duration: 71, start_date: "03/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214, condition_id: 3)
  Trip.create(duration: 63, start_date: "04/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127, condition_id: 4)
  Trip.create(duration: 70, start_date: "05/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 95138, condition_id: 5)
  Trip.create(duration: 71, start_date: "06/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 97214, condition_id: 6)


  visit '/weather-dashboard'

  expect(current_path).to eq("/weather-dashboard")
  expect(page).to have_content("Weather")
  expect(Condition.all.count).to eq(6)
  end
end
