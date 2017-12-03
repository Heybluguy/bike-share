require 'spec_helper'

RSpec.describe Trip do
  describe "validations" do
    it "is invalid without a duration" do
      trip = Trip.create(start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without a start date" do
      trip = Trip.create(duration: 40, start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without a start station" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without an end date" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without an end_station_name" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", bike_id: 527, subscription: "Subscriber", zip_code: 94109)


      expect(trip).to be_invalid
    end

    it "is invalid without a bike id" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without a subscription type" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, zip_code: 94109)

      expect(trip).to be_invalid
    end
  end

  describe "Class Mehtods" do

    it "can find average duration of rides" do
      Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
      Trip.create(duration: 109, start_date: "29/8/2013 13:25", start_station_name: "Santa Clara at Almaden", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
      Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Post at Kearney", end_date: "29/8/2013 16:59", end_station_name: "Post at Kearney", bike_id: 408, subscription: "Subscriber", zip_code: 94117)

    expect(Trip.average_duration).to eql(95)
    end
  end
end
