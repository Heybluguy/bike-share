require 'spec_helper'

describe "when a visitor edits a trip" do
  it 'visitor sees updated trip page' do

  Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")

  Condition.create(date: "2013-08-30", max_temperature: 76, mean_temperature: 70, min_temperature: 61, mean_humidity: 75, mean_visibility: 10, mean_wind_speed: 11, precipitation: 0, zip_code: 94127)

  Trip.create(duration: 63, start_date: "30/8/2013", start_station_id: 1, end_date: "2013-08-29", end_station_id: 1, bike_id: 520, subscription: "Subscriber", zip_code: 94127, condition_id: 1)

  visit '/trips'


  click_link('Edit')

  expect(current_path).to eq("/trips/#{Trip.first.id}/edit")
  expect(page).to have_content("Edit Trip")

  fill_in 'trip[duration]', with: 60

  click_button 'submit'

  expect(current_path).to eq("/trips/#{Trip.first.id}")
  expect(Trip.first.duration).to eq(60)
  end
end
