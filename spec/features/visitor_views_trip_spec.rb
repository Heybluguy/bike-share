require 'spec_helper'

describe "when a visitor selects a trip" do
  it 'visitor sees trip page' do

  Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")

  trip = Trip.create(duration: 63, start_date: "30/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 1, bike_id: 520, subscription: "Subscriber", zip_code: 94127)

  visit '/trips'

  click_link(trip.id)

  expect(current_path).to eq("/trips/#{Trip.first.id}")

  expect(page).to have_content("MLK Library")
  expect(page).to have_no_content("All Trips")
  end
end
