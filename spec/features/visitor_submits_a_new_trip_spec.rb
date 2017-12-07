require 'spec_helper'

describe "when a visitor presses submit on new trip" do
  it 'visitor sees trip page' do

  Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")

  visit '/trips/new'

  fill_in 'trip[duration]', with: 63
  fill_in 'trip[start_date]', with: "30/8/2013"
  fill_in 'trip[start_station_id]', with: 1
  fill_in 'trip[end_date]', with: '2013-08-29'
  fill_in 'trip[end_station_id]', with: 1
  fill_in 'trip[bike_id]', with: 379
  fill_in 'trip[zip_code]', with: 38046

  click_button 'submit'

  expect(current_path).to eq("/trips/#{Trip.last.id}")

  expect(page).to have_content("Trip 1")
  expect(page).to have_content("2013-08-30")
  end
end
